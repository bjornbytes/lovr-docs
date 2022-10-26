Distribution
===

LÖVR projects can be exported to standalone executables or WebVR projects.  This guide will teach you
how to export and distribute a project.

Creating an Archive
---

The first step is to create an archive of your project, which is really just a zipped up version of
its contents.  On Windows you can select all the files in a project (**not** the project folder),
right click them, and choose "Send to" -> "Compressed (zip) folder".  On Unix systems, the `zip`
utility can be used:

    zip -9qr .

A zip archive can be run with LÖVR but isn't a standalone executable yet.

Creating an Executable
---

Once you have a project archive, it can be appended to the LÖVR binary to create a standalone
executable.  On Windows, this can be done using the command prompt:

    copy /b lovr.exe+MyProject.zip MyProject.exe

On Unix systems, the `cat` utility can be used to concatenate the two files.

> Once you have an executable, be sure to distribute it with all the `.dll` files that came with the
original LÖVR download.

WebVR
---

You can use the [WebVR Exporter](/share) to export to WebVR.  Just drag and drop a `.zip` file into
your window to create a WebVR page.

> Note that WebVR exports are removed after 30 days of inactivity!

To create a custom WebVR build, see [this
guide](https://github.com/bjornbytes/lovr/blob/master/COMPILING.md#webvr).

Note that there are a few differences when running LÖVR in the browser:

- `Controller:newModel` will always return `nil`.
- `lovr.headset.getBoundsGeometry` is not supported and will return four zero vectors.
- Oculus Touch controllers are not fully supported yet.
