Drawing Shapes
===

Drawing simple shapes is a fun way to learn more about how LÖVR works.

You can draw a cube using the `lovr.graphics.cube` function:

    function lovr.draw()
      lovr.graphics.cube('line')
    end

This will draw a wireframe cube, 1 meter in size, at the position `(0, 0, 0)`.  If you tried this
in VR, you would notice that the cube goes through the floor.  We can move it up a few feet in the
air by changing its y coordinate:

    function lovr.draw()
      lovr.graphics.cube('line', 0, 1, 0)
    end

The three numbers there are the x, y, and z coordinate of the cube.  The units of these coordinates
are in meters, so drawing the cube at `(0, 1, 0)` raises it 1 meter off the ground.

We can also change the size of the cube.  The fifth argument to `lovr.graphics.cube` is the size of
the cube

    function lovr.draw()
      lovr.graphics.cube('line', 0, 1, 0, .2)
    end

Now our cube is really small!  Let's make the cube spin:

    function lovr.draw()
      lovr.graphics.cube('line', 0, 1, 0, .2, lovr.timer.getTime())
    end

The sixth argument is a rotation for the cube, in radians.  If we pass the current time as our
rotation using `lovr.timer.getTime`, we get a different rotation value every frame.  The end result
is an animated spinning cube.  Finally, let's make our cube red:

    function lovr.draw()
      lovr.graphics.setColor(255, 0, 0)
      lovr.graphics.cube('line', 0, 1, 0, .2, lovr.timer.getTime())
    end

`lovr.graphics.setColor` sets the color of drawn objects.  It takes in 3 numbers, each from 0 to
255. One is for the red, one is for the green, and one is for the blue.  We are maxing out the red
color and turning off the other ones, which results in a red color.

There are functions for drawing shapes other than cubes too.  We can draw a floor using
`lovr.graphics.plane`:

    function lovr.draw()
      lovr.graphics.plane('fill', 0, 0, 0)
    end

We can also draw a triangle from 3 points using `lovr.graphics.triangle`, or draw a line using
`lovr.graphics.line`.  Finally, we can draw single pixels using `lovr.graphics.points`.
