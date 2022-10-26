Getting Started
===

This guide will help you install LÖVR and teach you how to create a simple scene.  You'll need to
have an HTC Vive or Oculus Rift handy, and you'll also need to have SteamVR installed on your
computer.

Installing LÖVR
---

First, download LÖVR from the website:

![LOVR Home Page](https://lovr.org/static/img/please.jpg)

Next, extract the zip file and open up the folder.  You should see a file called `lovr.exe` and a
bunch of `.dll` files.

![Archive Contents](https://lovr.org/static/img/dlls.png)

Double click on `lovr.exe` to open LÖVR.  If you see a window with a black screen, don't panic!
That means LÖVR is working.  If you don't tell LÖVR what project you want to run, it will just open
a blank window.  That's super boring though.  Let's create a project with a cube in it.

To create a project, just create a new folder somewhere.  You can call the folder whatever you want.
I'm going to call it `SuperEpicCube`.

Writing Code
---

Now we're going to have to write some code.  Code is really scary, so we're going to download a
**text editor** to make it easier for us to write code.  There are lots of different kinds of text
editors.  Some good ones are [Sublime Text](http://www.sublimetext.com), [Atom](http://atom.io), or
[Zero Brane Studio](https://studio.zerobrane.com).  I'll use Sublime Text for this tutorial, but
the approach should be similar no matter what text editor you use.

Every LÖVR project needs a special file called `main.lua`.  Open a new file in your text editor and
type out this Lua code.  If you don't know what Lua is or don't know what the code does or are
beginning to have an out of body experience, that's fine.  It's not important to understand all the
details of the code right now.  *However*, I recommend that you avoid just copying and pasting it!
Typing out each line does this magical thing to your brain that helps you read, write, and
understand the code better.  I promise.

<<<<<<< HEAD
```
function lovr.draw()
  lovr.graphics.cube('line', 0, 1, 0)
end
```

Whew, that wasn't so bad.  Okay, save the file inside the `SuperEpicCube` folder and be sure to
name it `main.lua`.  Now we're ready to run our project!

> Note: If you're trying this out without a VR headset, use the coordinates `0, 0, -2` instead of
> `0, 1, 0` so the cube shows up correctly!
=======
    function lovr.draw()
      lovr.graphics.print('hello world', 0, 1.7, -3, .5)
    end

Don't worry if you're confused about the code, it's not important to understand it all right now.
In short, we declared the `lovr.draw` callback and used `Pass:text` in there to render some text in
the world.  We'll learn more about how this works in the next guide.
>>>>>>> afca132 (rm fenced codeblocks;)

Running a Project
---

We're going to run our project with LÖVR and experience our cube in VR.  First, start SteamVR if it
isn't started already:

![Steam VR](https://lovr.org/static/img/steamvr.png)

Now, drag the `SuperEpicCube` folder on to the `lovr.exe` application we ran earlier:

![Drag and Drop](https://lovr.org/static/img/dragonDrop.png)

Ok, put on your headset!  You should see a cube floating in the middle of the play space.  Walk
around, introduce yourself to it, befriend it.

![A Beautiful Cube](https://lovr.org/static/img/cube.png)

That's it for this guide.  I knew you could do it.
If you want to make something even more cool, you'll need to learn a little bit more about Lua.
Continue on to the <a data-key="How_to_Lua">How to Lua</a> guide to learn more about Lua!
