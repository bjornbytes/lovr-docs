return {
  tag = 'filesystem-files',
  summary = 'Write to a file.',
  description = 'Write to a file in the save directory.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The file to write to.'
    },
    content = {
      type = 'string | Blob',
      description = 'A string or Blob to write to the file.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the write was successful.'
    },
    error = {
      type = 'string',
      description = 'The error message, if there was an error.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'content' },
      returns = { 'success', 'error' }
    }
  },
  notes = [[
    If the file does not exist, it is created.

    If the file already has data in it, it will be replaced with the new content.

    If the path contains subdirectories, all of the parent directories need to exist first or the
    write will fail.  Use `lovr.filesystem.createDirectory` to make sure they're created first.
  ]],
  related = {
    'lovr.filesystem.append',
    'lovr.filesystem.getSaveDirectory',
    'lovr.filesystem.read'
  }
}
