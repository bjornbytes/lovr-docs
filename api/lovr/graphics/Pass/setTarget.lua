return {
  summary = 'TODO',
  description = 'TODO',
  arguments = {
    texture = {
      type = 'Texture',
      description = 'TODO'
    },
    ['...'] = {
      type = 'Texture',
      description = 'Additional textures.'
    },
    textures = {
      type = 'table',
      description = 'A table of textures, with an optional `depth` key for the depth texture.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'texture', '...' },
      returns = {}
    },
    {
      arguments = { 'textures' },
      returns = {}
    }
  }
}
