return {
  summary = 'Different values a Tally can measure.',
  description = 'TODO',
  values = {
    {
      name = 'time',
      description = 'Each slot measures elapsed time in nanoseconds.'
    },
    {
      name = 'pixel',
      description = 'Each slot measures the approximate number of pixels affected by rendering.'
    },
    {
      name = 'shader',
      description = 'Each slot measures the number of times different shader stages are invoked.'
    }
  }
}
