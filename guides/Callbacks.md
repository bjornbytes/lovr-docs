Callbacks
===

To start making things happen with LÖVR it's important to understand **callbacks**.  Callbacks are
Lua functions you can write that LÖVR will call at certain points in time. The three most important
callbacks are these ones:

<table>
  <tr>
    <td>Callback</td>
    <td>When is it called</td>
  </tr>

  <tr>
    <td class="pre">lovr.load</td>
    <td>Called once when LÖVR is started</td>
  </tr>

  <tr>
    <td class="pre">lovr.update</td>
    <td>Called over and over again really quickly</td>
  </tr>

  <tr>
    <td class="pre">lovr.draw</td>
    <td>Called over and over again after lovr.update</td>
  </tr>
</table>

So the basic "flow" of a LÖVR program in terms of callbacks looks like this:

1. `lovr.load`
1. `lovr.update`
1. `lovr.draw`
1. `lovr.update`
1. `lovr.draw`
1. ...

What in the world does this mean?  These callbacks give us a handy way to design our app.

`lovr.load` is a great place to create a bunch of variables, load 3D models and sounds, and perform
any other setup work.

In `lovr.update` we put the "logic" of our application, so we might move objects around, simulate a
physics system, or keep track of scores and timers.  Because lovr.update is called over and over
again, we can update our simulation constantly to respond to user input or move objects smoothly
over time to create animation.

Finally, lovr.draw is a callback where "rendering" takes place.  In here we look at the stuff we
did in lovr.update and use `lovr.graphics` functions to tell LÖVR what things should look like in
the virtual world.  Usually we'll do things like draw 3D models or render visual effects.

Here's a simple example to help explain things better:

```
function lovr.load()
  cubeSize = 0
end

function lovr.update()
  cubeSize = cubeSize + .0001
end

function lovr.draw()
  lovr.graphics.cube('line', 0, 1, 0, size)
end
```

This program will draw a cube in the middle of the play area, and make it get bigger and bigger over
time.  In lovr.load we define a variable to keep track of the size of the cube.  In lovr.update we
add a small amount to the variable (this is our "application logic").  In lovr.draw we use the
variable to draw a cube with a certain size.  This is a simple application model that a large number
of  games and experiences use.

Understanding Delta Time
---

There's one problem with our growing cube example though.  We have to keep in mind that some people
have fast computers and some people have slow computers.  LÖVR calls lovr.update as fast as it can,
and so people with a fast computer might have lovr.update get called a lot more often than people
with slow computers.  The end result is that on a fast computer the cube will grow a lot faster than
it would on a slow computer.  This isn't what we want because then it makes it difficult to fine
tune the speed of the growth.

Fortunately, it's easy to fix.  Instead of basing the speed on how often lovr.update is called, we
can base the speed on real world time.  There is a single function parameter passed to lovr.update
called `dt`, which stands for **delta time**.  It represents the amount of time that has passed
since the last call to lovr.update.  Try changing the lovr.update function to this:

```
function lovr.update(dt)
  cubeSize = cubeSize + dt * .5
end
```

How is this different?  Instead of adding .001 to the cube size every time lovr.update is called,
we're basing that number on actual time values.  A computer that's only able to call lovr.update 10
times per second will have a `dt` value of (1 / 10) = .1, and so the cube size will increase by
(.1 * .5) = .05 per update.  On the other hand, a fast computer that's calling lovr.update **100**
times per second will have a `dt` value of (1 / 100) = .01, and so the cube size will increase by
(.01 * .5) = .005 per update.  This means that the cube growth speed scales with the speed of the
computer, and our cube will always grow by .5 units per second no matter what!  Keep this in mind
when designing animations or physics and try to always base speed values on `dt`.

Moving On
---

That's about it for the callbacks guide.  If you're curious about what some of the other callbacks
do, there is a "Callbacks" section on the left.  Otherwise, move on to the next tutorial:
<a data-key="Simple_Shapes">Simple Shapes</a>.
