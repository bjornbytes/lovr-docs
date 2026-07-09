return {
  summary = 'Create a new Blob referencing a subsection of an existing Blob.',
  description = [[
    Creates a new Blob that does not allocate any memory of its own, but instead points at a
    subsection of an existing Blob.
  ]],
  arguments = {
    parent = {
      type = 'Blob',
      description = 'The parent Blob.'
    },
    offset = {
      type = 'number',
      description = 'The offset of the subsection to reference, in bytes.'
    },
    extent = {
      type = 'number?',
      description = [[
        The size of the subsection, in bytes.  By default the view will extend to the end of the
        parent Blob.
      ]]
    },
    name = {
      type = 'string?',
      default = [['']],
      description = 'An optional name for the view to use in error messages.'
    }
  },
  returns = {
    view = {
      type = 'Blob',
      description = 'The new Blob view.'
    }
  },
  variants = {
    {
      arguments = { 'parent', 'offset', 'extent', 'name' },
      returns = { 'view' }
    }
  },
  related = {
    'lovr.data.newBlob'
  }
}
