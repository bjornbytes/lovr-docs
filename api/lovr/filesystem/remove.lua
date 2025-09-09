return {
  tag = 'filesystem-files',
  summary = 'Remove a file or directory.',
  description = 'Remove a file or directory in the save directory.',
  arguments = {
    path = {
      type = 'string',
      description = 'The file or directory to remove.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the path was removed.'
    },
    error = {
      type = 'string | nil',
      description = 'The error message, if any.'
    }
  },
  variants = {
    {
      arguments = { 'path' },
      returns = { 'success', 'error' }
    }
  },
  notes = [[
    A directory can only be removed if it is empty.

    To recursively remove a folder, use this function with `lovr.filesystem.getDirectoryItems`.
  ]]
}
