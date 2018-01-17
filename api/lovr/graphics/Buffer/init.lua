return {
  summary = 'A drawable list of vertices.',
  description = [[
    A Buffer is a low-level graphics object that stores and renders a list of vertices.

    Buffers are really flexible since you can pack pretty much whatever you want in them.  This
    makes them great for rendering arbitrary geometry, but it also makes them kinda difficult to use
    since you have to place each vertex yourself.

    It's possible to batch geometry with Buffers too.  Instead of drawing a shape 100 times, it's
    much faster to pack 100 copies of the shape into a Buffer and draw the Buffer once.

    Buffers are also a good choice if you have a mesh that changes its shape over time.
  ]],
  constructor = 'lovr.graphics.newBuffer',
  notes = [[
    Each vertex in a buffer can hold several pieces of data.  For example, you might want a vertex
    to keep track of its position, color, and a weight.  Each one of these pieces of information is
    called a vertex **attribute**.  A vertex attribute must have a name, a type, and a size.  Here's
    what the "position" attribute would look like as a Lua table:

        { 'vPosition', 'float', 3 } -- 3 floats for x, y, and z

    Every vertex in a Buffer must have the same set of attributes.  We call this set of attributes
    the **format** of the Buffer, and it's specified as a simple table of attributes.  For example,
    we could represent the format described above as:

        {
          { 'vPosition', 'float', 3 },
          { 'vColor',    'byte',  4 },
          { 'vWeight',   'int',   1 }
        }

    When creating a Buffer, you can give it any format you want, or use the default.  The default
    Buffer format looks like this:

        {
          { 'lovrPosition', 'float', 3 },
          { 'lovrNormal',   'float', 3 },
          { 'lovrTexCoord', 'float', 2 }
        }

    Great, so why do we go through the trouble of naming everything in our vertex and saying what
    type and size it is?  The cool part is that we can access this data in a Shader.  We can write a
    vertex Shader that has `in` variables for every vertex attribute in our Buffer:

        in vec3 vPosition;
        in vec4 vColor;
        in int vWeight;

        vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
          // Here we can access the vPosition, vColor, and vWeight of each vertex in the buffer!
        }

    Specifying custom vertex data is really powerful and is often used for lighting, animation, and
    more!
  ]],
  example = {
    description = 'Draw a circle using a Buffer.',
    code = [[
      function lovr.load()
        local x, y, z = 0, 1, -2
        local radius = .3
        local points = 40

        -- A table to hold the Buffer data
        local vertices = {}

        for i = 0, points do
          local angle = i / points * 2 * math.pi
          local vx = x + math.cos(angle)
          local vy = y + math.sin(angle)
          table.insert(vertices, { vx, vy, z })
        end

        buffer = lovr.graphics.newBuffer(vertices, 'fan')
      end

      function lovr.draw()
        buffer:draw()
      end
    ]]
  }
}
