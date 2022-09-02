return {
  summary = 'Check if the Model uses joints for skeletal animation.',
  description = 'Returns whether the Model has any skeletal animations.',
  arguments = {},
  returns = {
    {
      name = 'jointed',
      type = 'boolean',
      description = 'Whether the animation uses joint nodes for skeletal animation.'
    }
  },
  notes = [[
    This will return when there's at least one skin in the model, as returned by
    `ModelData:getSkinCount`.

    Even if this function returns true, the model could still have non-skeletal animations.

    Right now a model can only be drawn with one skeletal pose per frame.
  ]]
}
