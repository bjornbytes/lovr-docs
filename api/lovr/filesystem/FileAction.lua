return {
  summary = 'Different actions that can be taken on files.',
  description = [[
    The different actions that can be taken on files, reported by `lovr.filechanged` when filesystem
    watching is active.
  ]],
  values = {
    {
      name = 'create',
      description = 'The file was created.'
    },
    {
      name = 'delete',
      description = 'The file was deleted.'
    },
    {
      name = 'modify',
      description = 'The file\'s contents were modified.'
    },
    {
      name = 'rename',
      description = 'The file was renamed.'
    }
  }
}
