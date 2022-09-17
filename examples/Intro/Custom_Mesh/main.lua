function lovr.draw(pass)
  local vertices = {
    vec3(  0,  .4, 0), vec4(1, 0, 0, 1),
    vec3(-.5, -.4, 0), vec4(0, 1, 0, 1),
    vec3( .5, -.4, 0), vec4(0, 0, 1, 1)
  }

  local format = {
    { type = 'vec3', location = 'VertexPosition' },
    { type = 'vec4', location = 'VertexColor' }
  }

  local triangle = lovr.graphics.getBuffer(vertices, format)

  pass:mesh(triangle, 0, 1.7, -1)
end
