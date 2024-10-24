return {
  tag = 'callbacks',
  summary = 'Called when a file is changed.',
  description = [[
    The `lovr.filechanged` callback is called when a file is changed.  File watching must be
    enabled, either by passing `--watch` when starting LÖVR or by calling `lovr.filesystem.watch`.

    Currently, only files in the source directory are watched.  On Android, files in the sdcard
    directory are watched.
  ]],
  arguments = {
    path = {
      type = 'string',
      description = 'The path to the file that changed.'
    },
    action = {
      type = 'FileAction',
      description = 'What happened to the file.'
    },
    oldpath = {
      type = 'string',
      description = 'The old path, for `rename` actions.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'path', 'action', 'oldpath' },
      returns = {}
    }
  },
  notes = [[
    LÖVR provides a default implementation for `lovr.filechanged` that restarts the project if a
    non-hidden file was changed:

        function lovr.filechanged(path)
          if not path:match('^%.') then
            lovr.event.restart()
          end
        end
  ]],
  related = {
    'lovr.filesystem.watch',
    'lovr.filesystem.unwatch'
  }
}
