return {
  summary = 'A convex hull shape.',
  description = [[
    A type of `Shape` that is a convex hull of a collection of points, allowing for custom collision
    shapes.  It is similar to a `MeshShape`, but it is not required to be kinematic, and it will use
    the convex hull of the mesh instead of using the exact triangles of the object.

    Convex shapes can be created from a `Model`, `ModelData`, `Mesh`, or a table of point positions,
    similar to `MeshShape`.

    Convex shapes can be cloned by passing in an existing ConvexShape to clone:

        model = lovr.data.newModelData('rock.glb')
        parent = lovr.physics.newConvexShape(model)
        clone = lovr.physics.newConvexShape(parent, scale)

    The clone will reuse all of the data from the parent, which speeds things up a lot.

    Convex shapes can have a custom scale applied to their points, and clones can have their own
    scale.
  ]],
  extends = 'Shape',
  constructors = {
    'lovr.physics.newConvexShape',
    'World:newConvexCollider'
  },
  example = {
    description = 'Drawing a convex hull.',
    code = [[
      function lovr.load()
        model = lovr.graphics.newModel('eggplant.glb')
        hull = lovr.physics.newConvexShape(model)

        -- Each face will be a list of points to draw a line through
        faces = {}

        for f = 1, hull:getFaceCount() do
          local face = {}

          for _, pointindex in ipairs(hull:getFace(f)) do
            local x, y, z = hull:getPoint(pointindex)
            table.insert(face, x)
            table.insert(face, y)
            table.insert(face, z)
          end

          -- Connect the last point back to the first point
          table.insert(face, face[1])
          table.insert(face, face[2])
          table.insert(face, face[3])

          table.insert(faces, face)
        end
      end

      function lovr.draw(pass)
        pass:push()
        pass:translate(0, 0, -5)
        pass:draw(model)

        pass:setColor(1, 0, 0)
        for i, points in pairs(faces) do
          pass:line(points)
        end
        pass:pop()
      end
    ]]
  }
}
