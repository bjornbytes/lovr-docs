return {
  summary = 'Get the application ID.',
  description = [[
    Returns the platform-specific application ID, or `nil` if this does not apply.

    Currently only implemented on Android.
  ]],
  arguments = {},
  returns = {
    {
      name = 'id',
      type = 'string',
      description = 'The application ID.'
    }
  }
}
