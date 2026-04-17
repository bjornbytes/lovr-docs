return {
  summary = 'Traces rays.',
  description = [[
    Raytracers store the information needed to trace rays in shaders.  They are sometimes also
    called "acceleration structures".  Raytracing is useful for implementing lighting effects in
    shaders, like shadows and ambient occlusion.

    ### Usage

    After creating a Raytracer with `lovr.graphics.newRaytracer`, add `Mesh` and `Model` objects to
    it with `Raytracer:add`.  After adding everything, call `Raytracer:build` to finalize
    everything.  Finally, send the Raytracer to a `Shader` with `Pass:send`.  The shader code can
    use the Raytracer to trace rays.

    Not all GPUs support raytracing.  Use `lovr.graphics.getFeatures` to check for the `raytracing`
    feature.

    ### Objects

    To move objects after adding them, use the ID returned from `Raytracer:add` along with
    `Raytracer:set` to set a new transform for the object.  To remove an object, either set its
    scale to zero, set its layer mask to zero, or call `Raytracer:clear` to remove everything and
    rebuild the raytracer from scratch.

    Objects can be placed on up to 8 different layers when they are added to the raytracer.  When
    tracing rays in shaders, rays have a mask that controls which layers they can hit.

    Raytracers have a fixed capacity that must be declared upfront.  `Raytracer:add` will return
    `nil` instead of an ID if this capacity is exceeded.

    `Mesh` and `Model` have their own internal "mini raytracer".  The first time an object is added
    to a raytracer, LÖVR will create the mini raytracer and build it automatically.  However, if the
    vertices change after the object has been added to the raytracer, the raytracer needs to be
    rebuilt with `Mesh:buildRaytracer` or `Model:buildRaytracer` for the changes to take affect.
    Additionally, any `Raytracer` objects using those meshes/models need to be rebuilt as well.
  ]],
  example = {
    description = 'This example demonstrates raytraced shadows for an animated model.',
    code = [=[
      function lovr.load()
        model = lovr.graphics.newModel('model.glb')
        lovr.graphics.setBackgroundColor(.2, .2, .22)

        shader = lovr.graphics.newShader('unlit', [[
          uniform raytracer tracer;
          uniform vec3 lightPosition;

          vec4 lovrmain() {
            vec4 color = DefaultColor;
            vec3 L = lightPosition - PositionWorld;
            vec3 rayPos = PositionWorld + normalize(Normal) * .01;
            vec3 rayDir = L;

            rayQueryEXT ray;
            float tmin = .001, tmax = 1.0;
            uint flags = gl_RayFlagsTerminateOnFirstHitEXT;
            rayQueryInitializeEXT(ray, tracer, flags, 0xff, rayPos, tmin, rayDir, tmax);
            rayQueryProceedEXT(ray);

            if (rayQueryGetIntersectionTypeEXT(ray, true) == gl_RayQueryCommittedIntersectionNoneEXT) {
              return vec4(color.rgb, 1.);
            } else {
              return vec4(color.rgb * .05, color.a);
            }
          }
        ]])

        raytracer = lovr.graphics.newRaytracer(1)
        raytracer:add(model, 0, 0, 0, .01)
      end

      function lovr.update(dt)
        model:resetNodeTransforms()
        model:animate(1, lovr.timer.getTime())
        model:buildRaytracer()
        raytracer:build()
      end

      function lovr.draw(pass)
        pass:setShader(shader)
        pass:send('tracer', raytracer)
        pass:send('lightPosition', 5, 5, 5)

        pass:setColor(0x664455)
        pass:plane(0, 0, 0, 10, 10, math.pi / 2, 1, 0, 0)

        pass:setColor(0xffffff)
        pass:draw(model, 0, 0, 0, .01)
      end
    ]=]
  }
}
