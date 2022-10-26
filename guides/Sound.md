Sound
===

Sound is a very important part of creating an immersive VR experience.  LÖVR makes it easy to load
and play sound effects.

Basics
---

Sound functionality can be accessed via the `lovr.audio` module.  To play a sound, you'll need to
create a `Source` object by calling `lovr.audio.newSource`.  Currently, only `.ogg` files are
supported.

    source = lovr.audio.newSource('airhorn.ogg')

Once the source is created, you can call a few functions on the source to control its playback:

    source:play()   -- Play the source
    source:pause()  -- Pause the source
    source:resume() -- Resume a paused source
    source:rewind() -- Rewind a source, playing it from the beginning
    source:stop()   -- Stop a source

You can also get whether or not a source is in a particular state:

    source:isPlaying()
    source:isPaused()
    source:isStopped()

You can set the volume and pitch of a source (even while it's playing):

    source:setVolume(.5) -- Volume can be between 0 and 1
    source:setPitch(2)   -- The default pitch is 1

Finally, you can control whether or not a source loops, which can be useful for background music:

    source:setLooping(loop) -- true or false

Spatial Audio
---

LÖVR supports spatial audio, which means that sounds can be positioned in 3D space.  When
positioned, they will be slightly distorted to make it sound as if they are coming from their
location in the virtual world!  To position a source, use `Source:setPosition`:

    source:setPosition(1.3, 2, -4.2)

Note that only mono sounds can be spatialized in this way.

Muting Audio
---

You can control all audio sources by using functions in `lovr.audio`.  For example,
`lovr.audio.stop` will stop all audio, `lovr.audio.pause` will pause all audio, and
`lovr.audio.resume` will resume all paused audio.

You can also set the "master volume" for all sounds using `lovr.audio.setVolume`.  This could be
used to easily allow for configurable volume settings in the experience, or all sounds could be
muted by setting the master volume to zero.

That's all you need to know to start adding sounds and music to your game!
