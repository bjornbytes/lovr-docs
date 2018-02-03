return {
  summary = 'Apply a Material to the Model.',
  description = 'Applies a Material to the Model.',
  arguments = {
    {
      name = 'material',
      type = 'Material',
      description = 'The material to apply to the Model.'
    }
  },
  returns = {},
  notes = [[
    A model's Material will be used when drawing every part of the model.  It will override any
    materials included in the model file.  It isn't currently possible to apply multiple materials
    to different pieces of the Model.
  ]]
}
