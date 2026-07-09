return {
  tag = 'graphics-objects',
  summary = 'Create a new Raytracer.',
  description = [[
    Creates a new Raytracer, which holds objects for raytracing in shaders.  The capacity of the
    raytracer, the number of objects it can hold, must be declared upfront and can not be changed
    afterwards.
  ]],
  arguments = {
    capacity = {
      type = 'number',
      description = 'The capacity of the Raytracer.'
    },
    options = {
      type = 'table?',
      description = 'Optional options.',
      table = {
        {
          name = 'dynamic',
          type = 'boolean?',
          default = 'false',
          description = [[
            An optimization hint indicating that the Raytracer will be frequently rebuilt with new
            objects or transform changes.  Set this to `false` for raytracers that have static
            content.
          ]]
        },
        {
          name = 'fasttrace',
          type = 'boolean?',
          default = 'true',
          description = [[
            An optimization hint indicating that the Raytracer should be optimized for fast tracing
            in shaders instead of fast rebuilds.
          ]]
        },
        {
          name = 'fastbuild',
          type = 'boolean?',
          default = 'false',
          description = [[
            An optimization hint indicating that the Raytracer should be optimized for fast rebuilds
            instead of fast tracing.  If `fasttrace` and `fastbuild` are both set, `fasttrace` wins.
          ]]
        },
        {
          name = 'compress',
          type = 'boolean?',
          default = 'false',
          description = [[
            An optimization hint indicating that the Raytracer should use less VRAM, possibly at the
            cost of performance.
          ]]
        }
      }
    }
  },
  returns = {
    raytracer = {
      type = 'Raytracer',
      description = 'The new Raytracer.'
    }
  },
  variants = {
    {
      arguments = { 'capacity', 'options' },
      returns = { 'raytracer' }
    }
  }
}
