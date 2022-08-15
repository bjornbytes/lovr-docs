return {
  summary = 'Start the Thread.',
  description = 'Starts the Thread.',
  arguments = {
    {
      name = '...arguments',
      type = '*',
      description = 'Up to 4 arguments to pass to the Thread\'s function.'
    }
  },
  returns = {},
  example = [=[
    function lovr.load()
      lovr.thread.newThread([[
        print(...)
      ]]):start(lovr.getVersion())
    end
  ]=]
}
