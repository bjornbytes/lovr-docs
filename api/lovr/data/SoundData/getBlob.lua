return {
    summary = 'Get the bytes backing this SoundData as a `Blob`.',
    description = 'This replaces `SoundData:getPointer()`, since you can get that through the blob.',
    arguments = {},
    returns = {
      {
        name = 'blob',
        type = 'blob',
        description = 'The blob instance containing the bytes for the `SoundData`.'
      }
    }
  }
  