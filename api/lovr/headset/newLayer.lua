return {
  tag = 'layers',
  summary = 'Create a new Layer.',
  description = [[
    Creates a new Layer.

    TODO
  ]],
  arguments = {
    width = {
      type = 'number',
      description = 'The width of the Layer texture, in pixels.'
    },
    height = {
      type = 'number',
      description = 'The height of the Layer texture, in pixels.'
    },
    options = {
      type = 'table',
      description = 'Optional options for the Layer.',
      table = {
        {
          name = 'filter',
          default = 'true',
          description = [[
            Whether the VR runtime is allowed to apply filtering effects to the Layer, such as
            sharpening and supersampling.  This can improve text legibility and reduces "shimmering"
            artifacts, but may reduce performance.
          ]]
        }
      }
    }
  },
  returns = {
    layer = {
      type = 'Layer',
      description = 'The new Layer.'
    }
  },
  variants = {
    {
      arguments = { 'width', 'height' },
      returns = { 'layer' }
    }
  },
  related = {
    'lovr.headset.getLayers',
    'lovr.headset.setLayers'
  }
}
