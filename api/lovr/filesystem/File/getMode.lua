return {
  summary = 'Get the mode the file was opened in.',
  description = 'Returns the mode the file was opened in.',
  arguments = {},
  returns = {
    mode = {
      type = 'OpenMode',
      description = 'The mode the file was opened in (`r`, `w`, or `a`).'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mode' }
    }
  },
  related = {
    'File:getPath'
  }
}
