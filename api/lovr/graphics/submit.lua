return {
  tag = 'work-submission',
  summary = 'Submit recorded graphics work to the GPU.',
  description = 'TODO',
  arguments = {
    {
      ['...'] = {
        type = 'Pass',
        description = 'The pass objects to submit.  Falsy values will be skipped.'
      },
      t = {
        type = 'table',
        description = 'A table of passes to submit.  Falsy values will be skipped.'
      }
    }
  },
  returns = {
    ['true'] = {
      type = 'boolean',
      description = 'Always returns true, for convenience when returning from `lovr.draw`.'
    }
  },
  variants = {
    {
      arguments = { '...' },
      returns = { 'true' }
    },
    {
      arguments = { 't' },
      returns = { 'true' }
    }
  },
  related = {
    'lovr.graphics.wait'
  }
}
