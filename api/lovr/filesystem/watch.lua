return {
  summary = 'Start watching the filesystem for changes.',
  description = [[
    Starts watching the filesystem for changes.  File events will be reported by the
    `lovr.filechanged` callback.

    Currently, on PC, only files in the source directory will be watched.  On Android, files in the
    save directory will be watched instead, so that pushing new files with `adb` can be detected.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  related = {
    'lovr.filesystem.unwatch',
    'lovr.filechanged'
  }
}
