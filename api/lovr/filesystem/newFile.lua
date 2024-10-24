return {
  summary = 'Open a file, returning a `File` object.',
  description = [[
    Opens a file, returning a `File` object that can be used to read/write the file contents.

    Normally you can just use `lovr.filesystem.read`, `lovr.filesystem.write`, etc.  However, those
    methods open and close the file each time they are called.  So, when performing multiple
    operations on a file, creating a File object and keeping it open will have less overhead.
  ]],
  arguments = {
    path = {
      type = 'string',
      description = 'The path of the file to open.'
    },
    mode = {
      type = 'OpenMode',
      description = 'The mode to open the file in (`r`, `w`, or `a`).'
    }
  },
  returns = {
    file = {
      type = 'File',
      description = 'A new file object, or nil if an error occurred.'
    },
    error = {
      type = 'string',
      description = 'The error message, if an error occurred.'
    }
  },
  variants = {
    {
      arguments = { 'path', 'mode' },
      returns = { 'file', 'error' }
    }
  },
  example = [[
    function lovr.load()
      local file = lovr.filesystem.newFile('asdf.txt', 'w')
      file:write('asdf')
      file:release()
    end
  ]],
  related = {
    'lovr.filesystem.read',
    'lovr.filesystem.write',
    'lovr.filesystem.append'
  }
}
