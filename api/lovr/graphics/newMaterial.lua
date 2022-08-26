return {
  tag = 'graphics-objects',
  summary = 'Create a new Material.',
  description = 'TODO',
  arguments = {
    texture = {
      type = 'Texture',
      description = 'TODO'
    },
    options = {
      type = 'table',
      description = 'Material properties.',
      table = {
        {
          name = 'color',
          type = 'Color',
          description = 'TODO'
        },
        {
          name = 'glow',
          type = 'Color',
          description = 'TODO'
        },
        {
          name = 'uvShift',
          type = 'Point2D',
          description = 'TODO'
        },
        {
          name = 'uvScale',
          type = 'Scale2D',
          description = 'TODO'
        },
        {
          name = 'metalness',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'roughness',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'clearcoat',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'clearcoatRoughness',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'occlusionStrength',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'glowStrength',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'normalScale',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'alphaCutoff',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'texture',
          type = 'Texture',
          description = 'TODO'
        },
        {
          name = 'glowTexture',
          type = 'Texture',
          description = 'TODO'
        },
        {
          name = 'occlusionTexture',
          type = 'Texture',
          description = 'TODO'
        },
        {
          name = 'metalnessTexture',
          type = 'Texture',
          description = 'TODO'
        },
        {
          name = 'roughnessTexture',
          type = 'Texture',
          description = 'TODO'
        },
        {
          name = 'clearcoatTexture',
          type = 'Texture',
          description = 'TODO'
        },
        {
          name = 'normalTexture',
          type = 'Texture',
          description = 'TODO'
        }
      }
    }
  },
  returns = {
    material = {
      type = 'Material',
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'texture' },
      returns = { 'material' }
    },
    {
      arguments = { 'options' },
      returns = { 'material' }
    }
  }
}
