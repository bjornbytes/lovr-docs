return {
  summary = 'Get the radius of the CylinderShape.',
  description = 'Returns the radius of the CylinderShape.',
  arguments = {},
  returns = {
    radius = {
      type = 'number',
      description = 'The radius of the cylinder, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'radius' }
    }
  },
  related = {
    'CylinderShape:getLength',
    'CylinderShape:setLength'
  }
}
