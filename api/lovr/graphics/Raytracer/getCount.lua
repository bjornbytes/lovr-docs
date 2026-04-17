return {
  summary = 'Get the number of objects in the Raytracer.',
  description = 'Returns the number of objects in the Raytracer.',
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of objects in the Raytracer.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  notes = '`Raytracer:add` returns nil if the Raytracer is full.',
  related = {
    'Raytracer:getCapacity',
    'Raytracer:clear'
  }
}
