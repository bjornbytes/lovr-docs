Game Distribution
===

Let's pretend you made an awesome game with LÖVR and you want to show it to the world (or your mom).
Here are instructions for packaging a game into a standalone `.exe` file that can be distributed.

Step one
---

The first step is to create a `.lovr` file from your project.  On Windows, create a `.zip` file from
the files in your project by selecting them, right clicking, and choosing "Send to" -> "Compressed
(zip) folder".

Once you have a `.zip` file for your project, change the extension to `.lovr`.  You can test the
`.lovr` file by dropping it onto `lovr.exe`.

On unix systems, the `zip` utility can be used to create a `.lovr` archive for the project.

Step two
---

Once you have a `.lovr` file, it needs to be "appended" to `lovr.exe`.  To start, place your `.lovr`
file in the same folder as `lovr.exe`.  Next, press Windows + R and type `cmd.exe` to open the
command prompt.  From there, type `cd C:\Users\Cena\Desktop\lovr`, or wherever the LÖVR folder is.
Finally, use the following command to create the executable:

```
copy /b lovr.exe+MyGame.lovr MyGame.exe
```

On unix systems, the `cat` utility can be used to concatenate the `lovr` file with `lovr.exe`.

Step Three
---

Awesome, now you have an exe for your game!  Be sure to distribute it with all the `.dll` files that
were in the LÖVR folder.
