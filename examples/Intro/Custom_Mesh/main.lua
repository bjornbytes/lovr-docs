function lovr.load()
  local format = {
    { 'VertexPosition', 'vec3' },
    { 'VertexColor', 'vec4' }
  }

  mesh = lovr.graphics.newMesh(format, {
    {   0,  .4, 0 ; 1, 0, 0, 1 },
    { -.5, -.4, 0 ; 0, 1, 0, 1 },
    {  .5, -.4, 0 ; 0, 0, 1, 1 }
  })
end

function lovr.draw(pass)
  pass:draw(mesh, 0, 1.7, -1)
end
