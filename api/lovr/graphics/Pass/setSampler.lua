return {
  tag = 'pipeline',
  summary = 'Set the sampler.',
  description = [[
    Sets the default `Sampler` to use when sampling textures.  It is also possible to send a custom
    sampler to a shader using `Pass:send` and use that instead, which allows customizing the sampler
    on a per-texture basis.
  ]],
  arguments = {
    sampler = {
      type = 'Sampler | FilterMode',
      default = [['linear']],
      description = [[
        The Sampler shaders will use when reading from textures.  It can also be a `FilterMode`, for
        convenience (other sampler settings will use their defaults).
      ]],
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'sampler' },
      returns = {}
    }
  },
  notes = [[
    The `getPixel` shader helper function will use this sampler.

    When a Pass is reset, its sampler will be reset to `linear`.

    The sampler applies to all draws in the pass on submit, regardless of when the sampler is set.

    If you need different samplers for each draw, currently you have to send a `Sampler` object to a
    Shader (this is not ideal).
  ]],
  example = [[
    function lovr.draw(pass)
      pass:setSampler('nearest') -- activate minecraft mode
      pass:setMaterial(rock)
      pass:cube(x, y, z)
    end
  ]]
}
