return {
  summary = 'Different material texture parameters.',
  description = 'The different types of texture parameters `Material`s can hold.',
  values = {
    {
      name = 'diffuse',
      description = 'The diffuse texture.'
    },
    {
      name = 'environment',
      description = 'The environment map, should be specified as a cubemap texture.'
    }
  },
  related = {
    'Material:getTexture',
    'Material:setTexture',
    'MaterialColor',
    'Material'
  }
}
