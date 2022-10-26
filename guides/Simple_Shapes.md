Simple Shapes
===

When you're quickly prototyping something or just getting started with LÖVR, it can be helpful to
draw some simple shapes.  These are sometimes called "graphics primitives".  Note that all units
for positions, sizes, etc. are in meters.

Colors
---

To change the color of a primitive, call `lovr.graphics.setColor(r, g, b)` before you draw the
primitive.  The r, g, b parameters are the red, green, and blue components of the color, like you
would find in Photoshop.  `(255, 255, 255)` is white, `(0, 0, 0)` is black, and `(0, 0, 128)` is
darkish blue.  Note that the color will remain active until it's changed again.

Points
---

    lovr.graphics.points(x, y, z)

This draws a single point at an x, y, z position in 3D space.  If you try it out and draw a point at
`(0, 0, 0)`, the point will be **really** hard to see because it's only 1 pixel big!  To change
this, have a look at the `lovr.graphics.setPointSize` function.  You can also draw more than one
point by passing in more point coordinates after the first.  Finally, you can also pass in a table:

    local points = {
      0, 0, 0,
      1, 1, 1
    }

    lovr.graphics.points(points)

Lines
---

    lovr.graphics.line(x1, y1, z1, x2, y2, z2, ...)

This function draws lines between points.  Here's how you would draw a square on the floor:

    lovr.graphics.line(
      -1, 0, -1,
      -1, 0,  1,
       1, 0,  1,
       1, 0, -1
    )

Triangles
---

    lovr.graphics.triangle(mode, x1, y1, z1, x2, y2, z2, x3, y3, z3)

This function draws a triangle from the specified 3 points.  `mode` can either be `line` for a
wireframe triangle or `fill` for a solid triangle.

Planes
---

A plane is a flat rectangle.  They can be used for simple floors and walls.

    lovr.graphics.plane(mode, x, y, z, size, nx, ny, nz)

This draws a plane `size` meters big centered at `(x, y, z)`.  To control the direction the plane
is facing, you gotta specify a _normal_ vector.  The normal vector is a direction specified using
3 numbers (x, y, and z).  The normal vector `(0, 1, 0)` is a vector that points straight up, because
the x and z parts of the direction are zero and the y direction of the vector is positive 1, which
is straight up.

Cubes
---

Finally, cubes, the pinnacle of primitives.

    lovr.graphics.cube(mode, x, y, z, size, angle, ax, ay, az)

This function draws a cube.  You can draw it as a wireframe or as a filled cube using the `mode`
parameter, similar to triangles and planes.  The `x`, `y`, and `z` parameters control the position.
The `size` parameter controls how big it is.  Finally, the last four parameters control the cube's
rotation.  The first number is the number of radians to rotate the cube around its axis of rotation,
and the last three numbers define the x, y, and z components of the axis of rotation.  This is
called "angle axis representation".  It's honestly pretty confusing, but LÖVR plans to add some
utilities to make this easier in the future!

Bonus!!
---

Planes and cubes can have **textures** applied to them.  Here's how you would draw a plane on the
ground with a ground texture applied to it:

    function lovr.load()
      texture = lovr.graphics.newTexture('ground.png')
    end

    function lovr.draw()
      lovr.graphics.plane(texture, 0, 0, 0, 2, 0, 1, 0)
    end

For this to work, put an image named `ground.png` in the same folder that `main.lua` is in.

Woohoo, let's take this a step further and start drawing <a data-key="3D_Models">3D Models</a>!
