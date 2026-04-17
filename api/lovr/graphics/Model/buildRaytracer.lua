return {
  summary = 'Rebuild raytracing data for the Model.',
  description = [[
    Rebuilds raytracing data for the Model.

    The first time a Model is added to a Raytracer with `Raytracer:add`, it computes raytracing data
    for its meshes automatically.  However, if the Model is animated or its node transforms change
    later, this raytracing data will be out of date.  This function is used to rebuild the
    raytracing data.  Afterwards, `Raytracer:build` also needs to be called on any `Raytracer`
    objects holding the Model.
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
    'Mesh:buildRaytracer',
    'Raytracer:build',
    'Raytracer:add',
    'Raytracer'
  }
}
