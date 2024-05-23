return {
  tag = 'version',
  summary = 'Get the current version.',
  description = 'Get the current major, minor, and patch version of LÖVR.',
  arguments = {},
  returns = {
    major = {
      type = 'number',
      description = 'The major version.'
    },
    minor = {
      type = 'number',
      description = 'The minor version.'
    },
    patch = {
      type = 'number',
      description = 'The patch number.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'major', 'minor', 'patch' }
    }
  }
}
