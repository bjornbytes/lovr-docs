return {
  summary = 'A loaded file object.',
  description = [[
    A Blob is an object that loads and holds the contents of a file.  It can be passed to most
    functions that take filename arguments, like `lovr.graphics.newModel` or `lovr.audio.newSource`.
    Loading many objects this way is often faster because the file data only needs to be read once
    and can be reused.  It can also be useful if file data is retrieved from some non-filesystem
    source, such as a network request.
  ]],
  constructor = 'lovr.filesystem.newBlob'
}
