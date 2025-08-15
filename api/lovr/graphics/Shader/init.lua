return {
  summary = 'GPU program.',
  description = [[
    Shaders are small GPU programs.  See the `Shaders` guide for a full introduction to Shaders.
  ]],
  extends = 'Object',
  constructors = {
    'lovr.graphics.newShader',
    'Shader:clone'
  }
}
