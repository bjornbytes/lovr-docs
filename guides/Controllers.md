Controllers
===

This guide will teach you how to interact with tracked motion controllers.  Controllers are an
important source of user input in VR experiences.  We'll learn how to draw models for controllers,
figure out when a button on the controller is pressed, and even trigger haptic feedback!

Discovering Controllers
---

The VR functionality in LÖVR is all in the `lovr.headset` module.  To get the number of connected
controllers, use `lovr.headset.getControllerCount`.

    function lovr.load()
      print(lovr.headset.getControllerCount())
    end

There are two callbacks related to Controllers: `lovr.controlleradded` and `lovr.controllerremoved`.
Using them, you can determine when controllers are connected and disconnected:

    function lovr.controlleradded(controller)
      print('Now there are ' .. lovr.headset.getControllerCount() .. ' controllers.')
    end

    function lovr.controllerremoved(controller)
      print('Now there are ' .. lovr.headset.getControllerCount() .. ' controllers.')
    end

Often, controllers need to be moved around a bit for them to be recognized, so make sure you add
code in those callbacks to keep your list of controllers up to date.

To get a list of currently connected controllers, use `lovr.headset.getControllers`.  We'll be using
that more in a bit.

Position and Orientation
---

To retrieve the position of a controller, use `Controller:getPosition`:

    controllers = lovr.headset.getControllers()
    for i, controller in ipairs(controllers) do
      print(controller:getPosition())
    end

The `ipairs` function returns an iterator that can be used in a `for` loop.  This lets you run a
chunk of code on each item in a list.  Here, we're printing out the position of each controller.

Similarly, you can get the orientation of a controller (in angle-axis representation) using
`Controller:getOrientation`.  We can combine these two functions to draw cubes at the position of
the player's hands:

    function lovr.draw()
      controllers = lovr.headset.getControllers()
      x, y, z = controller:getPosition()
      angle, ax, ay, az = controller:getOrientation()
      lovr.graphics.cube('line', x, y, z, .2, angle, ax, ay, az)
    end

Let's replace that cube with a realistic model of the controller.

Controller Models
---

We can create a new Model object for a controller with `Controller:newModel`.  The model will
automatically have a texture applied.  Drawing the model with the position and orientation of the
controller object greatly increases the feeling of presence of an application.  Here's an example
that keeps track of the list of controllers and draws their models:

    function refreshControllers()
      controllers = lovr.headset.getControllers()
      controllerModels = {}
      for i, controller in ipairs(controllers) do
        controllerModels[i] = controller:newModel()
      end
    end

    function lovr.load()
      refreshControllers()
    end

    function lovr.controlleradded()
      refreshControllers()
    end

    function lovr.controllerremoved()
      refreshControllers()
    end

    function lovr.draw()
      for i, controller in ipairs(controllers) do
        x, y, z = controller:getPosition()
        angle, ax, ay, az = controller:getOrientation()
        controllerModels[i]:draw(x, y, z, 1, angle, ax, ay, az)
      end
    end

Controller Input
---

To determine if a button on the controller is pressed, use `Controller:isDown`:

    print(controller:isDown('menu'))

The first parameter is a string with the name of a button, which can be `system`, `menu`, `grip`,
or `touchpad`.  The return value is a "boolean": either `true` or `false` depending on whether or
not the button is pressed.

You can also retrieve the input state of **axes**.  Axes are inputs that can take on a continuous
value between 0 and 1.  Axis state can be retrieved using `Controller:getAxis`.  Available axes are
`trigger`, `touchx`, and `touchy`.

Haptics
---

You can trigger haptic feedback on controllers to make them vibrate!  To do this, use
`Controller:vibrate`.  The function takes in a number representing how long the controller should
vibrate for, in seconds.  Currently, Vive controllers can only vibrate for durations less than .004
seconds.  To create longer or stronger vibrations, call the function over a period of several
frames.

    function lovr.update(dt)
      if controller:getAxis('trigger') == 1 then
        controller:vibrate(.002)
      end
    end

That's all for controllers.  The next guide is about <a data-key="Sound">Sound</a>.
