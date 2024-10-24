return {
  summary = 'A quad in 3D space.',
  description = [[
    A Layer is a textured plane placed in 3D space.  Layers are sent directly to the VR runtime and
    composited along with the rest of the 3D content.  This has several advantages compared to
    rendering the texture into the 3D scene with `Pass:draw`:

    - Better tracking.  The VR runtime composites the texture later in the rendering process, using
    a more accurate head pose.
    - Better resolution, less shimmery.  Regular 3D content must have lens distortion correction
      applied to it, whereas layers are composited after distortion correction, meaning they have a
      higher pixel density.  The layer can also use a higher resolution than the main headset
      texture, allowing for extra resolution on the 2D content without having to supersample all of
      the 3D rendering.
    - Supersampling and sharpening effects.  Some headset runtimes (currently just Quest) can also
      supersample and sharpen layers.

    Combined, all of this makes a massive difference in quality when rendering 2D content on a
    Layer, especially improving text readability.
  ]],
  constructor = 'lovr.headset.newLayer'
}
