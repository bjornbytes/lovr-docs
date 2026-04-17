return {
  summary = 'Get the capacity of the Raytracer.',
  description = [[
    Returns the capacity of the Raytracer, or the number of objects it can hold.  The capacity is
    declared when the raytracer is created, and can not be changed afterwards.
  ]],
  arguments = {},
  returns = {
    capacity = {
      type = 'number',
      description = 'The capacity of the raytracer.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'capacity' }
    }
  },
  notes = '`Raytracer:add` returns nil if the Raytracer is full.',
  related = {
    'Raytracer:getCount',
    'lovr.graphics.newRaytracer'
  }
}
