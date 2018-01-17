return {
  summary = 'Pump new events into the queue for processing.',
  description = [[
    Fills the event queue with unprocessed events from the operating system.  This function should
    be called often, otherwise the operating system will consider your application unresponsive.  By
    default, this function is called automatically by `lovr.run`.
  ]],
  arguments = {},
  returns = {},
  related = {
    'lovr.event.poll'
  }
}
