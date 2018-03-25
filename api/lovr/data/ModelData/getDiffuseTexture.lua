return {
  summary = 'Get the diffuse texture of a material in the ModelData.',
  description = 'Returns the diffuse texture of a material in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the material.'
    }
  },
  returns = {
    {
      name = 'texture',
      type = 'TextureData',
      description = 'The diffuse texture data.'
    }
  },
  related = {
    'ModelData:getDiffuseColor',
    'Material:getTexture',
    'MaterialTexture'
  }
}
