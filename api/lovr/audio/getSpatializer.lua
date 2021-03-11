return {
  tag = 'listener',
  summary = 'Get the name of the active spatializer',
  description = 'Returns the name of the active spatializer (`simple`, `oculus`, or `phonon`).',
  arguments = {},
  returns = {
    {
      name = 'spatializer',
      type = 'string',
      description = 'The name of the active spatializer.'
    }
  },
  related = {
    'lovr.conf'
  }
}
