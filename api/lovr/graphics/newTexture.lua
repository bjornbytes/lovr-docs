return {
  summary = 'Create a new Texture.',
  description = 'TODO',
  arguments = {
    filename = {
      type = 'string',
      description = 'TODO'
    },
    image = {
      type = 'string',
      description = 'TODO'
    },
    width = {
      type = 'number',
      description = 'TODO'
    },
    height = {
      type = 'number',
      description = 'TODO'
    },
    depth = {
      type = 'number',
      description = 'TODO'
    },
    images = {
      type = 'table',
      description = 'TODO'
    },
    options = {
      type = 'table',
      description = 'Texture options.',
      table = {
        {
          name = 'type',
          type = 'TextureType',
          description = 'TODO'
        },
        {
          name = 'format',
          type = 'TextureFormat',
          description = 'TODO'
        },
        {
          name = 'linear',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'samples',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'mipmaps',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'usage',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'label',
          type = 'string',
          description = 'TODO'
        }
      }
    }
  },
  returns = {
    texture = {
      type = 'Texture',
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'options' },
      returns = { 'texture' }
    },
    {
      arguments = { 'width', 'height', 'options' },
      returns = { 'texture' }
    },
    {
      arguments = { 'width', 'height', 'depth', 'options' },
      returns = { 'texture' }
    },
    {
      arguments = { 'image', 'options' },
      returns = { 'texture' }
    },
    {
      arguments = { 'images', 'options' },
      returns = { 'texture' }
    }
  },
  related = {
    'Texture:newView'
  }
}
