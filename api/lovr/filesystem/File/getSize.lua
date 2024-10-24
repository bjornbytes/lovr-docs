return {
  summary = 'Get the size of the File.',
  description = 'Returns the size of the file, in bytes.',
  arguments = {},
  returns = {
    size = {
      type = 'number',
      description = 'The size of the file, in bytes, or nil if an error occurred.'
    },
    error = {
      type = 'string',
      description = 'The error message, if an error occurred.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'size', 'error' }
    }
  },
  related = {
    'lovr.filesystem.getSize'
  }
}
