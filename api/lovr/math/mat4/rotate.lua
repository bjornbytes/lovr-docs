return {
  summary = 'Rotate the matrix.',
  description = 'Rotates the matrix using a quaternion or an angle/axis rotation.',
  arguments = {
    {
      name = 'rotation',
      type = 'quat',
      description = 'The rotation to apply to the matrix.'
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
    'mat4:scale',
    'mat4:identity'
  }
}
