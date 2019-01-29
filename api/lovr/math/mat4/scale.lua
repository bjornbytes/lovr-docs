return {
  summary = 'Scale the matrix.',
  description = 'Scales the matrix.',
  arguments = {
    scale = {
      type = 'vec3',
      description = 'The 3D scale to apply.'
    },
    x = {
      type = 'number',
      description = 'A uniform scale to apply.'
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
    'mat4:translate',
    'mat4:rotate',
    'mat4:identity'
  }
}
