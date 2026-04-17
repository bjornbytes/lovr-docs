return {
  summary = 'Rebuild raytracing data for the Mesh.',
  description = [[
    Rebuilds raytracing data for the Mesh.

    The first time a Mesh is added to a Raytracer with `Raytracer:add`, it computes raytracing data
    for its vertices automatically.  However, if the Mesh vertices change later, this raytracing
    data will be out of date.  This function is used to rebuild the raytracing data.  Afterwards,
    `Raytracer:build` also needs to be called on any `Raytracer` objects holding the Mesh.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  related = {
    'Model:buildRaytracer',
    'Raytracer:build',
    'Raytracer:add',
    'Raytracer'
  }
}
