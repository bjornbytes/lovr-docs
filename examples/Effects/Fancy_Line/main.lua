local function knot(u, p, q, r)
  local c1, s1 = math.cos(u), math.sin(u)
  local c2, s2 = math.cos(q / p * u), math.sin(q / p * u)
  return
    r * (2 + c2) * .5 * c1,
    r * (2 + c2) * .5 * s1,
    r * s2 * .5
end

points = {}
local ct = 300
local p, q, r = 2, 3, 1
for t = 0, ct do
  local th = t / ct * p * 2 * math.pi
  local x, y, z = knot(th, p, q, r)
  table.insert(points, x)
  table.insert(points, y)
  table.insert(points, z)
end

local quads = {}
local indexData = { 0,1,2, 2,1,3 ; 1,5,3, 3,5,7 }
for i = 1, ct do
  for j = 1, #indexData do
    table.insert(quads, (i - 1) * 8 + indexData[j])
  end
end

local vertices = lovr.graphics.newBuffer('float', points)
local indices = lovr.graphics.newBuffer('u16', quads)

local shader = lovr.graphics.newShader([[
readonly buffer Points { float data[]; };

flat out vec3 head;
flat out vec3 tail;
flat out vec4 headColor;
flat out vec4 tailColor;
out float width;

vec3 hsv2rgb(vec3 c) {
  vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec4 lovrmain() {
  uint p = 3 * (VertexIndex >> 3);

  head = vec3(ViewFromLocal * vec4(data[p + 0], data[p + 1], data[p + 2], 1.));
  tail = vec3(ViewFromLocal * vec4(data[p + 3], data[p + 4], data[p + 5], 1.));

  vec4 headClip = ClipFromView * vec4(head, 1.);
  vec4 tailClip = ClipFromView * vec4(tail, 1.);

  vec3 mid = mix(head, tail, .5);
  vec3 az = normalize(tail - head);
  vec3 a_ = normalize(cross(az, mid));
  vec3 ax = normalize(cross(az, a_));
  vec3 ay = normalize(cross(az, ax));

  float x = (VertexIndex & 0x1) >> 0;
  float y = (VertexIndex & 0x2) >> 1;
  float z = (VertexIndex & 0x4) >> 2;

  if (dot(mid, ax) > 0.) x = 1. - x;
  if (dot(mid, az) < 0.) z = 1. - z;

  width = .4;

  float w = mix(headClip.w, tailClip.w, z);

  if (w > 0.) {
    float minPixelWidth = 1.;
    width = max(width, Projection[0][0] * w * (minPixelWidth / Resolution.x));
  }

  vec3 local = vec3(x - .5, y - .5, z);
  mat3 basis = mat3(ax * width, ay * width, az * (length(tail - head) + width));
  vec3 start = head - az * width * .5;
  PositionWorld = start + basis * local;

  headColor = vec4(hsv2rgb(vec3(float(p/3 + 0) / 101., 1, 1)), 1.);
  tailColor = vec4(hsv2rgb(vec3(float(p/3 + 1) / 101., 1, 1)), 1.);

  return ClipFromView * vec4(PositionWorld, 1.);
}
]], [[
flat in vec3 head;
flat in vec3 tail;
flat in vec4 headColor;
flat in vec4 tailColor;
in float width;

layout(depth_less) out float FragDepth;

vec4 lovrmain() {
  vec3 A = tail - head;
  vec3 B = head;

  float AoA = dot(A, A);
  float AoB = dot(A, B);
  float BoB = dot(B, B);
  float r = width * .5;

  int coverage = 0;
  float param;

  for (int i = 0; i < 4; i++) {
    vec3 N = normalize(interpolateAtSample(PositionWorld, i));
    float NoA = dot(N, A);
    float NoB = dot(N, B);
    float a = AoA - NoA * NoA;
    float t1 = clamp((NoB * NoA - AoB) / a, 0., 1.);
    float t2 = t1 * NoA + NoB;
    float dist = distance(N * t2, head + A * t1);
    if (dist <= r) {
      coverage |= (1 << i);
      param = t1;
    }
  }

  gl_SampleMask[0] = coverage;

  if (coverage == 0) {
    discard;
  }

  vec3 N = normalize(PositionWorld);

  B = -head;
  AoB = dot(A, B);
  BoB = dot(B, B);
  float NoA = dot(N, A);
  float NoB = dot(N, B);

  // Quadratic formula
  float a = AoA - NoA * NoA;
  float b = AoA * NoB - AoB * NoA;
  float c = AoA * BoB - AoB * AoB - r * r * AoA;
  float d = max(b * b - a * c, 0.);

  float t1 = (-b - sqrt(d)) / a;
  float t2 = (AoB + t1 * NoA) / AoA;

  // If the hit is outside the cylindrical part of the capsule, see if it intersects the end caps
  if (t2 <= 0. || t2 >= 1.) {
    vec3 C = t2 <= 0. ? B : -tail;
    b = dot(N, C);
    c = dot(C, C) - r * r;
    d = max(b * b - c, 0.);
    t1 = -b - sqrt(d);
  }

  vec3 P = N * t1;
  vec4 clip = Projection * vec4(P, 1.);
  FragDepth = clip.z / clip.w;

  return Color * mix(headColor, tailColor, clamp(t2, 0., 1.));
}
]])

function lovr.draw(pass)
  pass:push()
  pass:translate(0, 1.7, -3)
  pass:rotate(lovr.timer.getTime() / 3, 0, 1, 0)
  pass:setShader(shader)
  pass:send('Points', vertices)
  pass:mesh(nil, indices)
  pass:pop()
end
