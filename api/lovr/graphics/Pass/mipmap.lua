return {
  tag = 'transfer',
  summary = 'Generate mipmaps for a texture.',
  description = 'TODO',
  arguments = {
    texture = {
      type = 'Texture',
      description = 'TODO'
    },
    base = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    count = {
      type = 'number',
      default = 'nil',
      description = 'TODO'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'texture', 'base', 'count' },
      returns = {}
    }
  }
}
