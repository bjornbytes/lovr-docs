return {
  summary = 'Set a Material to use when drawing the Mesh.',
  description = 'Sets a `Material` to use when drawing the Mesh.',
  arguments = {
    material = {
      type = 'Material',
      description = 'The material to use.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'material' },
      returns = {}
    }
  },
  related = {
    'Pass:setMaterial',
    'Model:getMaterial',
    'lovr.graphics.newMaterial'
  }
}
