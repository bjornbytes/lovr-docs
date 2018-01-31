3D Models
===

In the previous guide we learned how to draw some simple shapes.  Now we're going to learn how to
draw 3D models exported from tools like Blender, Maya, or 3DS Max.   LÖVR supports lots of different
3D file formats, including `.obj`, `.fbx`, and `.dae`.  We can also apply textures to our models.
Texture files can be `.png` or `.jpg`.  Once you have your model files, put them in the folder for
your project.

Create the Model
---

To load a model into LÖVR, we can use the `lovr.graphics.newModel` function.  It takes a string with
the name of the model file and returns an object representing the model.

```
model = lovr.graphics.newModel('assets/duck.dae')
```

Create the Texture
---

Creating textures is really similar to creating models:

```
texture = lovr.graphics.newTexture('assets/duck.png')
```

We can apply a texture to a model using `Model:setTexture`.  The colon syntax in Lua is used when
you're calling a function on an object.

```
model:setTexture(texture)
```

It is also possible to create and set the texture while creating the model, using the second
parameter to `lovr.graphics.newModel`:

```
model = lovr.graphics.newModel('assets/duck.dae', 'assets/duck.png')
```

Rendering the Model
---

To draw a model, call `:draw` on it.  It takes a position (x, y, z), a scale, and a rotation
(angle/axis).

```
model:draw(x, y, z, size, angle, axisX, axisY, axisZ)
```

You may need to adjust the size/position of the model, depending on how it was exported.

Putting it all together
---

Here's the complete program for loading and rendering a 3D model:

```
function lovr.load()
  model = lovr.graphics.newModel('assets/model.obj', 'assets/texture.png')
end

function lovr.draw()
  model:draw(0, 0, 0, 1)
end
```

The rotation parameters for `model:draw` were left out for simplicity.  The model and texture were
put in a folder called `assets`.

That's all there is to it!  Next we'll (finally!) talk about our first VR topic:
<a data-key="Controllers">Controllers</a>.
