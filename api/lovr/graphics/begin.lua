return {
  tag = 'work-submission',
  summary = 'Begin a pass of graphics work.',
  description = 'TODO',
  arguments = {
    type = {
      type = 'PassType',
      description = 'The type of pass to start.'
    },
    canvas = {
      type = 'table',
      description = 'The set of textures to render to, along with other rendering options.'
    },
    texture = {
      type = 'Texture',
      description = 'The texture to render to.'
    },
    batch = {
      type = 'Batch',
      description = 'The Batch to record commands to.'
    },
    order = {
      type = 'number',
      default = 'nil',
      description = [[
        A number between 1 and 100 used to define the order passes run in.  Passes with a smaller
        order run before passes with a larger order.  Passes with the same order may run in any
        order.  If `nil`, an autoincrementing number will be used, causing passes to run in the
        order they are started.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      description = 'TODO (compute and transfer pass)',
      arguments = { 'type', 'order' },
      returns = {}
    },
    {
      description = 'TODO',
      arguments = { 'type', 'texture', 'order' },
      returns = {}
    },
    {
      description = 'TODO',
      arguments = { 'type', 'canvas', 'order' },
      returns = {}
    },
    {
      description = 'TODO (batch pass)',
      arguments = { 'type', 'batch', 'order' },
      returns = {}
    }
  },
  related = {
    'lovr.graphics.finish'
  }
}
