return {
  summary = 'Translate the matrix.',
  description = 'Translates the matrix.',
  arguments = {
    {
      name = 'translation',
      type = 'vec3',
      description = 'The translation vector.'
    }
  },
  returns = {
    {
      name = 'm',
      type = 'mat4',
      description = 'The original matrix.'
    }
  },
  related = {
    'mat4:rotate',
    'mat4:scale',
    'mat4:identity'
  }
}
