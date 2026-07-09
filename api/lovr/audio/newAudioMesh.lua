return {
  tag = 'listener',
  summary = 'Create a new AudioMesh.',
  description = 'Creates a new `AudioMesh`.',
  arguments = {
    vertices = {
      type = 'table',
      description = [[
        A table of vertices in the mesh.  Can be a table of tables (each with 3 numbers) or a table
        of numbers (every 3 numbers form a 3D vertex).
      ]]
    },
    indices = {
      type = 'table',
      description = [[
        A table of triangle indices representing how the vertices are connected together into
        triangles.
      ]]
    },
    modelData = {
      type = 'ModelData',
      description = 'A ModelData to use for the mesh data.'
    },
    mesh = {
      type = 'Mesh',
      description = 'A Mesh to use for the mesh data.  It must use the `cpu` storage mode.'
    },
    material = {
      type = 'AudioMaterial | {AudioMaterial} | nil',
      default = [['generic']],
      description = [[
        The material the audio mesh is made out of.  Can be a single `AudioMaterial` to apply to the
        whole mesh, or a table of `AudioMaterial` values, one for each triangle.
      ]]
    }
  },
  returns = {
    audioMesh = {
      type = 'AudioMesh',
      description = 'The new AudioMesh.'
    }
  },
  variants = {
    {
      arguments = { 'vertices', 'indices', 'material' },
      returns = { 'audioMesh' }
    },
    {
      arguments = { 'modelData', 'material' },
      returns = { 'audioMesh' }
    },
    {
      arguments = { 'mesh', 'material' },
      returns = { 'audioMesh' }
    }
  },
  notes = [[
    The triangles in an AudioMesh should use counterclockwise winding.

    The AudioMesh will start out enabled, and it will be located at the origin.
  ]],
  related = {
    'AudioMesh:clone'
  }
}
