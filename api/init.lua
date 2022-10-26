return {
  callbacks = {
    {
      name = "conf",
      tag = "callbacks",
      summary = "Called to read configuration settings at startup.",
      description = "The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special file that's loaded before the rest of the framework initializes.",
      key = "lovr.conf",
      module = "lovr",
      variants = {
        {
          arguments = {
            {
              name = "t",
              type = "table",
              description = "The table to edit the configuration settings on.",
              table = {
                {
                  name = "identity",
                  type = "string",
                  description = "A unique label for this project."
                },
                {
                  name = "headset",
                  type = "table",
                  description = "Configuration for the headset.",
                  table = {
                    {
                      name = "mirrored",
                      type = "boolean",
                      description = "                Whether the desktop window should display a mirror of what's in the headset.\n              "
                    }
                  }
                },
                {
                  name = "modules",
                  type = "table",
                  description = "The set of enabled modules to use.",
                  table = {
                    {
                      name = "audio",
                      type = "boolean",
                      description = "Whether the audio module should be enabled."
                    },
                    {
                      name = "event",
                      type = "boolean",
                      description = "Whether the event module should be enabled."
                    },
                    {
                      name = "filesystem",
                      type = "boolean",
                      description = "Whether the filesystem module should be enabled."
                    },
                    {
                      name = "graphics",
                      type = "boolean",
                      description = "Whether the graphics module should be enabled."
                    },
                    {
                      name = "headset",
                      type = "boolean",
                      description = "Whether the headset module should be enabled."
                    },
                    {
                      name = "math",
                      type = "boolean",
                      description = "Whether the math module should be enabled."
                    },
                    {
                      name = "physics",
                      type = "boolean",
                      description = "Whether the physics module should be enabled."
                    },
                    {
                      name = "timer",
                      type = "boolean",
                      description = "Whether the timer module should be enabled."
                    }
                  }
                }
              }
            }
          },
          returns = {}
        }
      },
      related = {
        "lovr.load"
      },
      examples = {
        {
          description = "A noop conf.lua that sets all configuration settings to their defaults:",
          code = "function lovr.conf(t)\n  -- Set the project identity\n  t.identity = 'default'\n\n  -- Headset settings\n  t.headset.mirror = true\n\n  -- Enable or disable different modules\n  t.modules.audio = true\n  t.modules.event = true\n  t.modules.graphics = true\n  t.modules.headset = true\n  t.modules.math = true\n  t.modules.physics = true\n  t.modules.timer = true\nend"
        }
      },
      notes = "Disabling the `headset` module can improve startup time a lot if you aren't intending to use `lovr.headset`."
    },
    {
      name = "controlleradded",
      tag = "callbacks",
      summary = "Called when a Controller is connected.",
      description = "This callback is called when a Controller is connected, discovered, or woken up.",
      key = "lovr.controlleradded",
      module = "lovr",
      related = {
        "lovr.controllerremoved",
        "lovr.headset.getControllers",
        "lovr.headset.getControllerCount"
      },
      variants = {
        {
          arguments = {
            {
              name = "controller",
              type = "Controller",
              description = "The new controller object."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "controllerpressed",
      tag = "callbacks",
      summary = "Called when a Controller button is pressed.",
      description = "This callback is called when a button on a Controller is pressed.",
      key = "lovr.controllerpressed",
      module = "lovr",
      related = {
        "lovr.controllerreleased",
        "Controller:isDown",
        "ControllerButton"
      },
      variants = {
        {
          arguments = {
            {
              name = "controller",
              type = "Controller",
              description = "The new controller object."
            },
            {
              name = "button",
              type = "ControllerButton",
              description = "The button that was pressed."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "controllerreleased",
      tag = "callbacks",
      summary = "Called when a Controller button is released.",
      description = "This callback is called when a button on a Controller is released.",
      key = "lovr.controllerreleased",
      module = "lovr",
      related = {
        "lovr.controllerpressed",
        "Controller:isDown",
        "ControllerButton"
      },
      variants = {
        {
          arguments = {
            {
              name = "controller",
              type = "Controller",
              description = "The new controller object."
            },
            {
              name = "button",
              type = "ControllerButton",
              description = "The button that was released."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "controllerremoved",
      tag = "callbacks",
      summary = "Called when a Controller is disconnected.",
      description = "This callback is called when a Controller is disconnected or turned off.",
      key = "lovr.controllerremoved",
      module = "lovr",
      related = {
        "lovr.controlleradded",
        "lovr.headset.getControllers",
        "lovr.headset.getControllerCount"
      },
      variants = {
        {
          arguments = {
            {
              name = "controller",
              type = "Controller",
              description = "The controller that was removed."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "draw",
      tag = "callbacks",
      summary = "Called continuously to render frames to the display.",
      description = "This callback is called every frame.  Use it to render the scene.  If a VR headset is connected, this function will be called twice per frame (once for each eye) and the function will instead draw to the headset's display.",
      key = "lovr.draw",
      module = "lovr",
      related = {
        "lovr.headset.renderTo"
      },
      variants = {
        {
          arguments = {
            {
              name = "eye",
              type = "HeadsetEye",
              description = "The eye currently being rendered to."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "errhand",
      tag = "callbacks",
      summary = "Called when an error occurs.",
      description = "The `lovr.errhand` callback is run whenever an error occurs.  It receives a single string parameter containing the error message.\n\nThe program exits after this callback returns.\n\nA default error handler is supplied that renders the error message as text in a loop.",
      key = "lovr.errhand",
      module = "lovr",
      variants = {
        {
          arguments = {
            {
              name = "message",
              type = "string",
              description = "The error message."
            }
          },
          returns = {}
        }
      },
      examples = {
        {
          code = "function lovr.errhand(message)\n  print('ohh NOOOO!', message)\nend"
        }
      },
      related = {
        "lovr.quit"
      }
    },
    {
      name = "focus",
      tag = "callbacks",
      summary = "Called when the application gets or loses focus.",
      description = "The `lovr.focus` callback is called whenever the application acquires or loses focus (for example, when opening or closing the Steam dashboard).  The callback receives a single argument, focused, which is a boolean indicating whether or not the application is now focused.  It may make sense to pause the game or reduce visual fidelity when the application loses focus.",
      key = "lovr.focus",
      module = "lovr",
      related = {},
      variants = {
        {
          arguments = {
            {
              name = "focused",
              type = "boolean",
              description = "Whether the program is now focused."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "load",
      tag = "callbacks",
      summary = "Called once at startup.",
      description = "This callback is called once when the app starts.  It should be used to perform initial setup work, like loading resources and initializing classes and variables.",
      key = "lovr.load",
      module = "lovr",
      variants = {
        {
          arguments = {
            {
              name = "args",
              type = "table",
              description = "The command line arguments provided to the program."
            }
          },
          returns = {}
        }
      },
      examples = {
        {
          code = "function lovr.load(args)\n  model = lovr.graphics.newModel('cena.fbx')\n  texture = lovr.graphics.newTexture('cena.png')\n  levelGeometry = lovr.graphics.newMesh(1000)\n  effects = lovr.graphics.newShader('vert.glsl', 'frag.glsl')\n  loadLevel(1)\nend"
        }
      },
      related = {
        "lovr.quit"
      }
    },
    {
      name = "quit",
      tag = "callbacks",
      summary = "Called before quitting.",
      description = "This callback is called right before the game is about to quit.  Use it to perform any cleanup you need to do.  You can also return a \"truthy\" value from this callback to abort quitting.",
      key = "lovr.quit",
      module = "lovr",
      variants = {
        {
          arguments = {},
          returns = {
            {
              name = "abort",
              type = "boolean",
              description = "Whether quitting should be aborted."
            }
          }
        }
      },
      examples = {
        {
          code = "function lovr.quit()\n  if shouldQuit() then\n    return false\n  else\n    return true\n  end\nend"
        }
      },
      related = {
        "lovr.event.quit",
        "lovr.load"
      }
    },
    {
      name = "run",
      tag = "callbacks",
      summary = "The main entry point.",
      description = "This callback is the main entry point for a LÖVR program.  It is responsible for calling `lovr.load` and `lovr.step`.",
      key = "lovr.run",
      module = "lovr",
      variants = {
        {
          arguments = {},
          returns = {
            {
              name = "exit",
              type = "number",
              description = "The exit code.  A nonzero exit code indicates an error."
            }
          }
        }
      },
      examples = {
        {
          description = "The default `lovr.run`:",
          code = "function lovr.run()\n  if lovr.load then lovr.load() end\n  while true do\n    local exit = lovr.step()\n    if exit then return exit end\n  end\nend"
        }
      },
      related = {
        "lovr.step",
        "lovr.load",
        "lovr.quit"
      }
    },
    {
      name = "step",
      tag = "callbacks",
      summary = "The main loop.",
      description = "This callback is called continuously and contains a single iteration of the main loop.  The default is usually suitable, but sometimes it is helpful to override this callback for custom behavior.",
      key = "lovr.step",
      module = "lovr",
      variants = {
        {
          arguments = {},
          returns = {
            {
              name = "exit",
              type = "number",
              description = "The exit code.  A nonzero exit code indicates an error."
            }
          }
        }
      },
      examples = {
        {
          description = "The default `lovr.step`:",
          code = "function lovr.step()\n  lovr.event.pump()\n  for name, a, b, c, d in lovr.event.poll() do\n    if name == 'quit' and (not lovr.quit or not lovr.quit()) then\n      return a\n    end\n    lovr.handlers[name](a, b, c, d)\n  end\n\n  local dt = lovr.timer.step()\n  if lovr.audio then\n    lovr.audio.update()\n    if lovr.headset and lovr.headset.isPresent() then\n      lovr.audio.setOrientation(lovr.headset.getOrientation())\n      lovr.audio.setPosition(lovr.headset.getPosition())\n      lovr.audio.setVelocity(lovr.headset.getVelocity())\n    end\n  end\n  if lovr.update then lovr.update(dt) end\n\n  lovr.graphics.clear()\n  lovr.graphics.origin()\n  if lovr.draw then\n    if lovr.headset and lovr.headset.isPresent() then\n      lovr.headset.renderTo(lovr.draw)\n    else\n      lovr.draw()\n    end\n  end\n  lovr.graphics.present()\n\n  lovr.timer.sleep(.001)\nend"
        }
      },
      related = {
        "lovr.run",
        "lovr.load",
        "lovr.quit"
      }
    },
    {
      name = "update",
      tag = "callbacks",
      summary = "Called every frame to update the application logic.",
      description = "The `lovr.update` callback should be used to update your game's logic.  It receives a single parameter, `dt`, which represents the amount of elapsed time between frames.  You can use this value to scale timers, physics, and animations in your game so they play at a smooth, consistent speed.",
      key = "lovr.update",
      module = "lovr",
      variants = {
        {
          arguments = {
            {
              name = "dt",
              type = "number",
              description = "The number of seconds elapsed since the last update."
            }
          },
          returns = {}
        }
      },
      examples = {
        {
          code = "function lovr.update(dt)\n  ball.vy = ball.vy + ball.gravity * dt\n  ball.y = ball.y + ball.vy * dt\nend"
        }
      },
      related = {
        "lovr.timer.getDelta"
      }
    }
  },
  modules = {
    {
      name = "json",
      tag = "library",
      summary = "Encodes and decodes JSON.",
      description = "The json module exposes functions for encoding and decoding JSON. You can use it by requiring the `json` module.",
      key = "json",
      functions = {},
      objects = {},
      enums = {},
      external = true,
      examples = {
        {
          code = "local json = require 'json'\nlocal data = { health = 10, position = { 1, 2, 3 } }\nlocal encoded = json.encode(data)\nprint(encoded)\nlocal decoded = json.decode(encoded)\nprint(decoded.health, unpack(decoded.position))"
        }
      }
    },
    {
      name = "lovr",
      summary = "In the beginning, there was nothing.",
      description = "`lovr` is the single global table that is exposed to every LÖVR app. It contains a set of **modules** and a set of **callbacks**.",
      key = "lovr",
      enums = {},
      sections = {
        {
          name = "Modules",
          tag = "modules",
          description = "Modules are the **what** of your app; you can use the functions in modules to tell LÖVR to do things. For example, you can draw things on the screen, figure out what buttons on a controller are pressed, or load a 3D model from a file.  Each module does what it says on the tin, so the `lovr.graphics` module deals with rendering graphics and `lovr.headset` allows you to interact with VR hardware."
        },
        {
          name = "Callbacks",
          tag = "callbacks",
          description = "Callbacks are the **when** of the application; you write code inside callbacks which LÖVR then calls at certain points in time.  For example, the `lovr.load` callback is called once at startup and `lovr.controlleradded` is called when controllers are connected."
        },
        {
          name = "System",
          tag = "system",
          description = "The lovr module also exposes some functions for retrieving information about the system."
        },
        {
          name = "Libraries",
          tag = "library",
          description = "A few helpful third-party libraries are included with LÖVR for convenience."
        }
      },
      functions = {
        {
          name = "getOS",
          tag = "system",
          summary = "Get the current operating system.",
          description = "Returns the current operating system.",
          key = "lovr.getOS",
          module = "lovr",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "os",
                  type = "string",
                  description = "Either \"Windows\", \"macOS\", or \"Web\"."
                }
              }
            }
          }
        },
        {
          name = "getVersion",
          tag = "system",
          summary = "Get the current version.",
          description = "Get the current major, minor, and patch version of LÖVR.",
          key = "lovr.getVersion",
          module = "lovr",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "major",
                  type = "number",
                  description = "The major version."
                },
                {
                  name = "minor",
                  type = "number",
                  description = "The minor version."
                },
                {
                  name = "patch",
                  type = "number",
                  description = "The patch number."
                }
              }
            }
          }
        }
      },
      objects = {}
    },
    {
      name = "audio",
      tag = "modules",
      summary = "Plays sound.",
      description = "The `lovr.audio` module is responsible for playing sound effects and music.  Currently, the only supported audio format is .ogg (Vorbis).  Playing a sound involves creating a `Source` object for the sound and calling `Source:play` on it.",
      key = "lovr.audio",
      sections = {
        {
          name = "Sources",
          tag = "sources",
          description = "Sources are objects that represent a single sound instance."
        },
        {
          name = "Listener",
          tag = "listener",
          description = "The listener is a virtual object in 3D space that \"hears\" all the sounds that are playing. The listener can be positioned and oriented in 3D space, which controls how Sources in the world are heard.  For example, sounds further away from the listener will be more quiet, and sounds to the left of the listener will be heard from the left speaker.  By default, the listener will be synchronized with any connected headset so audio is positioned properly as the headset is moved around and rotated."
        }
      },
      enums = {
        {
          name = "TimeUnit",
          summary = "Time units for sound samples.",
          description = "When figuring out how long a Source is or seeking to a specific position in the sound file, units can be expressed in terms of seconds or in terms of samples.",
          key = "TimeUnit",
          module = "audio",
          values = {
            {
              name = "seconds",
              description = "Seconds."
            },
            {
              name = "samples",
              description = "Samples."
            }
          }
        }
      },
      functions = {
        {
          name = "getOrientation",
          tag = "listener",
          summary = "Get the orientation of the listener.",
          description = "Returns the orientation of the virtual audio listener in angle/axis representation.",
          key = "lovr.audio.getOrientation",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians the listener is rotated around its axis of rotation."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation."
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation."
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation."
                }
              }
            }
          }
        },
        {
          name = "getPosition",
          tag = "listener",
          summary = "Get the position of the listener.",
          description = "Returns the position of the virtual audio listener, in meters.",
          key = "lovr.audio.getPosition",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the listener."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the listener."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the listener."
                }
              }
            }
          }
        },
        {
          name = "getVelocity",
          tag = "listener",
          summary = "Get the velocity of the audio listener.",
          description = "Returns the velocity of the audio listener, in meters per second.  This affects the doppler effect.",
          key = "lovr.audio.getVelocity",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x velocity."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y velocity."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z velocity."
                }
              }
            }
          },
          notes = "The audio listener does not move based on its velocity."
        },
        {
          name = "getVolume",
          tag = "listener",
          summary = "Get the master volume.",
          description = "Returns the master volume.  All Source objects have their volume multiplied by this factor.",
          key = "lovr.audio.getVolume",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "volume",
                  type = "number",
                  description = "The master volume."
                }
              }
            }
          },
          notes = "The default is 1.0."
        },
        {
          name = "isSpatialized",
          tag = "listener",
          summary = "Check if audio is spatialized.",
          description = "Returns whether or not audio is currently spatialized with HRTFs.  Spatialized audio is much more immersive.",
          key = "lovr.audio.isSpatialized",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "spatialized",
                  type = "boolean",
                  description = "Whether or not audio is spatialized."
                }
              }
            }
          }
        },
        {
          name = "newSource",
          tag = "sources",
          summary = "Create a new Source.",
          description = "Creates a new Source from an ogg file.",
          key = "lovr.audio.newSource",
          module = "lovr.audio",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the sound to load."
                }
              },
              returns = {
                {
                  name = "source",
                  type = "Source",
                  description = "The new Source."
                }
              }
            }
          }
        },
        {
          name = "pause",
          tag = "sources",
          summary = "Pause all Sources.",
          description = "Pause all playing audio.",
          key = "lovr.audio.pause",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "resume",
          tag = "sources",
          summary = "Resume all Sources.",
          description = "Resume all Sources.  Has no effect on Sources that are playing or stopped.",
          key = "lovr.audio.resume",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "rewind",
          tag = "sources",
          summary = "Rewind all Sources.",
          description = "Rewind all playing audio.",
          key = "lovr.audio.rewind",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          },
          notes = "Sources that are paused will remain paused. Sources that are currently playing will restart from the beginning."
        },
        {
          name = "setOrientation",
          tag = "listener",
          summary = "Set the orientation of the listener.",
          description = "Sets the orientation of the virtual audio listener in angle/axis representation.",
          key = "lovr.audio.setOrientation",
          module = "lovr.audio",
          variants = {
            {
              arguments = {
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians the listener should be rotated around its rotation axis."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation."
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation."
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setPosition",
          tag = "listener",
          summary = "Set the position of the listener.",
          description = "Sets the position of the virtual audio listener, in meters.",
          key = "lovr.audio.setPosition",
          module = "lovr.audio",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the listener."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the listener."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the listener."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setVelocity",
          tag = "listener",
          summary = "Set the velocity of the audio listener.",
          description = "Sets the velocity of the audio listener, in meters per second.  This affects the doppler effect.",
          key = "lovr.audio.setVelocity",
          module = "lovr.audio",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x velocity."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y velocity."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z velocity."
                }
              },
              returns = {}
            }
          },
          notes = "The audio listener does not move based on its velocity."
        },
        {
          name = "setVolume",
          tag = "listener",
          summary = "Set the master volume.",
          description = "Sets the master volume.  The volume of all Sources will be multiplied by this factor.",
          key = "lovr.audio.setVolume",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "volume",
                  type = "number",
                  description = "The master volume."
                }
              }
            }
          },
          notes = "The default is 1.0."
        },
        {
          name = "stop",
          tag = "sources",
          summary = "Stop all Sources.",
          description = "Stops all audio.",
          key = "lovr.audio.stop",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          },
          notes = "If you want to resume the stopped audio later, see `lovr.audio.pause`."
        },
        {
          name = "update",
          tag = "sources",
          summary = "Updates the audio system.",
          description = "Updates all playing sources. This must be called regularly for audio playback to occur. Normally this is called for you by `lovr.step`.",
          key = "lovr.audio.update",
          module = "lovr.audio",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        }
      },
      objects = {
        {
          name = "Source",
          summary = "A playable sound object.",
          description = "A Source is an object representing a single sound.  Currently, only ogg sounds are supported. Sources can be in three different states:\n\n<table>\n  <tr>\n    <td>Playing</td>\n    <td>The source is currently playing. It can be stopped, paused, or rewound.</td>\n  </tr>\n  <tr>\n    <td>Paused</td>\n    <td>The source is paused. It can be stopped, played/resumed, or rewound.</td>\n  </tr>\n  <tr>\n    <td>Stopped</td>\n    <td>The source has been stopped. It can be played.</td>\n  </tr> </table>",
          key = "Source",
          module = "lovr.audio",
          methods = {
            {
              name = "getBitDepth",
              summary = "Get the bit depth of the Source.",
              description = "Returns the number of bits per sample in the Source.  This is a rough indicator of the resolution of the Source, and is usually 16.",
              key = "Source:getBitDepth",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "bits",
                      type = "number",
                      description = "The number of bits per sample."
                    }
                  }
                }
              }
            },
            {
              name = "getChannels",
              summary = "Get the number of channels in the Source.",
              description = "Returns the number of channels in the Source.  Mono sounds have 1 channel and stereo sounds have 2 channels.",
              key = "Source:getChannels",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "channels",
                      type = "number",
                      description = "The number of channels."
                    }
                  }
                }
              }
            },
            {
              name = "getCone",
              summary = "Get the Source's volume cone.",
              description = "Returns the directional volume cone of the Source.  The cone is specified by three values: `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is inside the `innerAngle`, the Source won't have its volume changed.  Otherwise, the volume will start to decrease, reaching a minimum volume of `outerVolume` once the listener is `outerAngle` degrees from the direction of the Source.",
              key = "Source:getCone",
              module = "lovr.audio",
              notes = "The default `innerAngle` for a Source is `0`.\n\nThe default `outerAngle` for a Source is `2 * math.pi`.\n\nThe default `outerVolume` for a Source is `0`.\n\nMake sure to set the direction of a Source before setting its cone.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "innerAngle",
                      type = "number",
                      description = "The inner cone angle, in radians."
                    },
                    {
                      name = "outerAngle",
                      type = "number",
                      description = "The outer cone angle, in radians."
                    },
                    {
                      name = "outerVolume",
                      type = "number",
                      description = "The outer cone angle, in radians."
                    }
                  }
                }
              }
            },
            {
              name = "getDirection",
              summary = "Get the direction vector of the Source.",
              description = "Returns the direction vector of the Source (the direction it's playing in).",
              key = "Source:getDirection",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the direction vector."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the direction vector."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the direction vector."
                    }
                  }
                }
              }
            },
            {
              name = "getDuration",
              summary = "Get the duration of the Source.",
              description = "Returns the duration of the Source.",
              key = "Source:getDuration",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "unit",
                      type = "TimeUnit",
                      description = "The unit to return.",
                      default = "'seconds'"
                    }
                  },
                  returns = {
                    {
                      name = "duration",
                      type = "number",
                      description = "The duration of the Source."
                    }
                  }
                }
              }
            },
            {
              name = "getFalloff",
              summary = "Get the falloff parameters for the Source.",
              description = "Returns parameters that control how the volume of the Source falls of with distance.",
              key = "Source:getFalloff",
              module = "lovr.audio",
              related = {
                "Source:getVolumeLimits",
                "Source:setVolumeLimits"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "reference",
                      type = "number",
                      description = "The distance at which the volume will start to decrease."
                    },
                    {
                      name = "max",
                      type = "number",
                      description = "The distance at which the Source will be its quietest."
                    },
                    {
                      name = "rolloff",
                      type = "number",
                      description = "How quickly the sound falls off between the reference and max distances (1.0 is the default)."
                    }
                  }
                }
              }
            },
            {
              name = "getPitch",
              summary = "Get the pitch of the Source.",
              description = "Returns the current pitch factor of the Source.  The default is 1.0.",
              key = "Source:getPitch",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "pitch",
                      type = "number",
                      description = "The current pitch."
                    }
                  }
                }
              }
            },
            {
              name = "getPosition",
              summary = "Get the position of the Source.",
              description = "Returns the position of the Source, in meters.  Setting the position will cause the Source to be distorted and attenuated based on its position relative to the listener.",
              key = "Source:getPosition",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate."
                    }
                  }
                }
              }
            },
            {
              name = "getSampleRate",
              summary = "Get the sample rate of the Source.",
              description = "Returns the number of samples per second in the Source.  This is usually a high number like 44100.",
              key = "Source:getSampleRate",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "frequency",
                      type = "number",
                      description = "The number of samples per second in the Source."
                    }
                  }
                }
              }
            },
            {
              name = "getVelocity",
              summary = "Get the velocity of the Source.",
              description = "Returns the velocity of the Source, in meters per second.  This affects the doppler effect.",
              key = "Source:getVelocity",
              module = "lovr.audio",
              notes = "The Source does not move based on its velocity.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x velocity."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y velocity."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z velocity."
                    }
                  }
                }
              }
            },
            {
              name = "getVolume",
              summary = "Get the volume of the Source.",
              description = "Returns the current volume factor for the Source.  1.0 is the default and the maximum.",
              key = "Source:getVolume",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "volume",
                      type = "number",
                      description = "The volume of the Source."
                    }
                  }
                }
              }
            },
            {
              name = "getVolumeLimits",
              summary = "Get the volume limits of the Source.",
              description = "Returns the minimum and maximum volume of the Source.  These limits have priority over the parameters set by `Source:setFalloff` and `Source:setCone`, so they can be used to make sure a Source can always be heard even if it's far away.",
              key = "Source:getVolumeLimits",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "min",
                      type = "number",
                      description = "The minimum volume of the Source."
                    },
                    {
                      name = "max",
                      type = "number",
                      description = "The maximum volume of the Source."
                    }
                  }
                }
              }
            },
            {
              name = "isLooping",
              summary = "Check if the Source is looping.",
              description = "Returns whether or not the Source will loop when it finishes.",
              key = "Source:isLooping",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "looping",
                      type = "boolean",
                      description = "Whether or not the Source is looping."
                    }
                  }
                }
              }
            },
            {
              name = "isPaused",
              summary = "Check if the Source is paused.",
              description = "Returns whether or not the Source is paused.",
              key = "Source:isPaused",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "paused",
                      type = "boolean",
                      description = "Whether the Source is paused."
                    }
                  }
                }
              }
            },
            {
              name = "isPlaying",
              summary = "Check if the Source is playing.",
              description = "Returns whether or not the Source is playing.",
              key = "Source:isPlaying",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "playing",
                      type = "boolean",
                      description = "Whether the Source is playing."
                    }
                  }
                }
              }
            },
            {
              name = "isRelative",
              summary = "Check if the Source is relative to the listener.",
              description = "Returns whether or not the Source is relative to the listener.  If a Source is relative then its position, velocity, cone, and direction are all relative to the audio listener.",
              key = "Source:isRelative",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "relative",
                      type = "boolean",
                      description = "Whether or not the Source is relative."
                    }
                  }
                }
              }
            },
            {
              name = "isStopped",
              summary = "Check if the Source is stopped.",
              description = "Returns whether or not the Source is stopped.",
              key = "Source:isStopped",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "stopped",
                      type = "boolean",
                      description = "Whether the Source is stopped."
                    }
                  }
                }
              }
            },
            {
              name = "pause",
              summary = "Pause the Source.",
              description = "Pauses the source.  It can be resumed with `Source:resume` or `Source:play`. If a paused source is rewound, it will remain paused.",
              key = "Source:pause",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "play",
              summary = "Play the Source.",
              description = "Plays the Source.  This has no effect if the Source is already playing.",
              key = "Source:play",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "resume",
              summary = "Resume the Source.",
              description = "Resumes the Source.",
              key = "Source:resume",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "rewind",
              summary = "Rewind the Source.",
              description = "Rewinds the Source, starting it over at the beginning.  Paused Sources will remain paused.",
              key = "Source:rewind",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "seek",
              summary = "Set the playback position of the Source.",
              description = "Seeks the Source to the specified position.",
              key = "Source:seek",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "position",
                      type = "number",
                      description = "The position to seek to."
                    },
                    {
                      name = "unit",
                      type = "TimeUnit",
                      description = "The units for the seek position.",
                      default = "'seconds'"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setCone",
              summary = "Set the Source's volume cone.",
              description = "Sets the directional volume cone of the Source.  The cone is specified by three values: `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is inside the `innerAngle`, the Source won't have its volume changed.  Otherwise, the volume will start to decrease, reaching a minimum volume of `outerVolume` once the listener is `outerAngle` degrees from the direction of the Source.",
              key = "Source:setCone",
              module = "lovr.audio",
              notes = "The default `innerAngle` for a Source is `0`.\n\nThe default `outerAngle` for a Source is `2 * math.pi`.\n\nThe default `outerVolume` for a Source is `0`.\n\nMake sure to set the direction of a Source before setting its cone.",
              variants = {
                {
                  arguments = {
                    {
                      name = "innerAngle",
                      type = "number",
                      description = "The inner cone angle, in radians."
                    },
                    {
                      name = "outerAngle",
                      type = "number",
                      description = "The outer cone angle, in radians."
                    },
                    {
                      name = "outerVolume",
                      type = "number",
                      description = "The outer cone angle, in radians."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setDirection",
              summary = "Set the direction vector of the Source.",
              description = "Sets the direction vector of the Source (the direction it's playing in).",
              key = "Source:setDirection",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the direction vector."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the direction vector."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the direction vector."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setFalloff",
              summary = "Set the falloff parameters for the Source.",
              description = "Sets parameters that control how the volume of the Source falls of with distance.",
              key = "Source:setFalloff",
              module = "lovr.audio",
              related = {
                "Source:getVolumeLimits",
                "Source:setVolumeLimits"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "reference",
                      type = "number",
                      description = "The distance at which the volume will start to decrease."
                    },
                    {
                      name = "max",
                      type = "number",
                      description = "The distance at which the Source will be its quietest."
                    },
                    {
                      name = "rolloff",
                      type = "number",
                      description = "How quickly the sound falls off between the reference and max distances (1.0 is the default)."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLooping",
              summary = "Set whether or not the Source loops.",
              description = "Sets whether or not the Source loops.",
              key = "Source:setLooping",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "loop",
                      type = "boolean",
                      description = "Whether or not the Source will loop."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setPitch",
              summary = "Set the pitch of the Source.",
              description = "Sets the pitch of the Source.  The default is 1.0.",
              key = "Source:setPitch",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "pitch",
                      type = "number",
                      description = "The new pitch."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setPosition",
              summary = "Set the position of the Source.",
              description = "Sets the position of the Source, in meters.  Setting the position will cause the Source to be distorted and attenuated based on its position relative to the listener.\n\nOnly mono sources can be positioned.",
              key = "Source:setPosition",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setRelative",
              summary = "Set whether or not the Source is relative.",
              description = "Sets whether or not the Source is relative to the listener.  If a Source is relative then its position, velocity, cone, and direction are all relative to the audio listener.",
              key = "Source:setRelative",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "relative",
                      type = "boolean",
                      description = "Whether or not the Source is relative."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVelocity",
              summary = "Set the velocity of the Source.",
              description = "Sets the velocity of the Source, in meters per second.  This affects the doppler effect.",
              key = "Source:setVelocity",
              module = "lovr.audio",
              notes = "The Source does not move based on its velocity.",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x velocity."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y velocity."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z velocity."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVolume",
              summary = "Set the volume of the Source.",
              description = "Sets the current volume factor for the Source.  1.0 is the default and the maximum.",
              key = "Source:setVolume",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "volume",
                      type = "number",
                      description = "The new volume."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVolumeLimits",
              summary = "Set the volume limits of the Source.",
              description = "Sets the minimum and maximum volume of the Source.  These limits have priority over the parameters set by `Source:setFalloff` and `Source:setCone`, so they can be used to make sure a Source can always be heard even if it's far away.",
              key = "Source:setVolumeLimits",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "min",
                      type = "number",
                      description = "The minimum volume of the Source."
                    },
                    {
                      name = "max",
                      type = "number",
                      description = "The maximum volume of the Source."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "stop",
              summary = "Stop the Source.",
              description = "Stops the source.",
              key = "Source:stop",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "tell",
              summary = "Get the playback position of the Source.",
              description = "Returns the current playback position of the Source.",
              key = "Source:tell",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "unit",
                      type = "TimeUnit",
                      description = "The unit to return.",
                      default = "'seconds'"
                    }
                  },
                  returns = {
                    {
                      name = "position",
                      type = "number",
                      description = "The current playback position."
                    }
                  }
                }
              }
            }
          },
          constructors = {
            "lovr.audio.newSource"
          }
        }
      }
    },
    {
      name = "event",
      tag = "modules",
      summary = "Handles events from the operating system.",
      description = "The `lovr.event` module handles events from the operating system.\n\nDue to its low-level nature, it's rare to use `lovr.event` in simple projects.",
      key = "lovr.event",
      functions = {
        {
          name = "clear",
          summary = "Clear the event queue.",
          description = "Clears the event queue, removing any unprocessed events.",
          key = "lovr.event.clear",
          module = "lovr.event",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "poll",
          summary = "Iterate over unprocessed events in the queue.",
          description = "This function returns a Lua iterator for all of the unprocessed items in the event queue.  Each event consists of a name as a string, followed by event-specific arguments.  Typically this function is automatically called for you by `lovr.step`.",
          key = "lovr.event.poll",
          module = "lovr.event",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "iterator",
                  type = "function",
                  description = "The iterator function, usable in a for loop.",
                  arguments = {},
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "pump",
          summary = "Pump new events into the queue for processing.",
          description = "Fills the event queue with unprocessed events from the operating system.  This function should be called often, otherwise the operating system will consider your application unresponsive.  By default, this function is called automatically by `lovr.step`.",
          key = "lovr.event.pump",
          module = "lovr.event",
          related = {
            "lovr.event.poll"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "push",
          summary = "Manually push an event onto the queue.",
          description = "Pushes an event onto the event queue.  It will be processed the next time `lovr.event.poll` is called.  For an event to be processed properly, there needs to be a function in the `lovr.handlers` table with a key that's the same as the event name.",
          key = "lovr.event.push",
          module = "lovr.event",
          related = {
            "lovr.event.poll",
            "lovr.event.quit"
          },
          variants = {
            {
              arguments = {
                {
                  name = "name",
                  type = "string",
                  description = "The name of the event."
                },
                {
                  name = "...",
                  type = "*",
                  description = "The arguments for the event."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "quit",
          summary = "Quit the application.",
          description = "Pushes an event to quit the game.  An optional number can be passed to set the exit code for the application.  An exit code of zero indicates normal termination, whereas a nonzero exit code indicates that an error occurred.",
          key = "lovr.event.quit",
          module = "lovr.event",
          related = {
            "lovr.quit",
            "lovr.event.poll"
          },
          variants = {
            {
              arguments = {
                {
                  name = "code",
                  type = "number",
                  description = "The exit code of the program.",
                  default = "0"
                }
              },
              returns = {}
            }
          },
          notes = "This function is equivalent to:\n\n    lovr.event.push('quit', code)\n\nThe program won't actually exit until the next time `lovr.event.poll` is called."
        }
      },
      examples = {
        {
          description = "Adding a custom event.",
          code = "function lovr.load()\n  lovr.handlers['customevent'] = function(a, b, c)\n    print('custom event handled with args:', a, b, c)\n  end\n\n  lovr.event.push('customevent', 1, 2, 3)\nend"
        }
      },
      enums = {},
      objects = {},
      notes = "You can define your own custom events by adding a function to the `lovr.handlers` table with a key of the name of the event you want to add.  Then, push the event using `lovr.event.push`."
    },
    {
      name = "filesystem",
      tag = "modules",
      summary = "Provides access to the filesystem.",
      description = "The `lovr.filesystem` module provides access to the filesystem.",
      key = "lovr.filesystem",
      enums = {},
      notes = "LÖVR programs can only write to a single directory, called the save directory.  The location of the save directory is platform-specific:\n\n<table>\n  <tr>\n    <td>Windows</td>\n    <td><code>C:\\Users\\&lt;user&gt;\\AppData\\Roaming\\LOVR\\&lt;identity&gt;</code></td>\n  </tr>\n  <tr>\n    <td>macOS</td>\n    <td><code>/Users/&lt;user&gt;/Library/Application Support/LOVR/&lt;identity&gt;</code></td>\n  </tr>\n  <tr>\n    <td>Linux</td>\n    <td><code>/home/&lt;user&gt;/.local/share/LOVR/&lt;identity&gt;</code></td>\n  </tr>\n  <tr>\n    <td>Android</td>\n    <td><code>/sdcard/Android/data/&lt;identity&gt;/files</code></td>\n  </tr> </table>\n\n`<identity>` should be a unique identifier for your app.  It can be set either in `lovr.conf` or by using `lovr.filesystem.setIdentity`.\n\nAll filenames are relative to either the save directory or the directory containing the project source.  Files in the save directory take precedence over files in the project.",
      functions = {
        {
          name = "append",
          summary = "Append content to the end of a file.",
          description = "Appends content to the end of the file.",
          key = "lovr.filesystem.append",
          module = "lovr.filesystem",
          notes = "If the file does not exist, it is created.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The file to append to."
                },
                {
                  name = "content",
                  type = "string",
                  description = "A string to write to the end of the file."
                }
              },
              returns = {
                {
                  name = "bytes",
                  type = "number",
                  description = "The number of bytes written."
                }
              }
            }
          }
        },
        {
          name = "createDirectory",
          summary = "Create a directory.",
          description = "Creates a directory in the save directory.",
          key = "lovr.filesystem.createDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The directory to create."
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether the directory was created."
                }
              }
            }
          }
        },
        {
          name = "exists",
          summary = "Check whether a file exists.",
          description = "Determine if a file exists.",
          key = "lovr.filesystem.exists",
          module = "lovr.filesystem",
          notes = "This function checks both the source directory and the save directory.",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The path to check."
                }
              },
              returns = {
                {
                  name = "exists",
                  type = "boolean",
                  description = "Whether the path is a file or directory."
                }
              }
            }
          }
        },
        {
          name = "getAppdataDirectory",
          summary = "Get the application data directory.",
          description = "Returns the application data directory.  This will be something like `C:\\Users\\user\\AppData` on Windows, or `/Users/user/Library/Application Support` on macOS.",
          key = "lovr.filesystem.getAppdataDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The absolute path to the appdata directory."
                }
              }
            }
          }
        },
        {
          name = "getDirectoryItems",
          summary = "Get a list of files in a directory..",
          description = "Returns an unsorted table containing all files and subfolders in a directory.",
          key = "lovr.filesystem.getDirectoryItems",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The directory."
                }
              },
              returns = {
                {
                  name = "table",
                  type = "items",
                  description = "A table with a string for each file and subfolder in the directory."
                }
              }
            }
          }
        },
        {
          name = "getExecutablePath",
          summary = "Get the path of the LÖVR executable.",
          description = "Returns the absolute path of the LÖVR executable.",
          key = "lovr.filesystem.getExecutablePath",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The absolute path of the LÖVR executable."
                }
              }
            }
          }
        },
        {
          name = "getIdentity",
          summary = "Get the name of the save directory.",
          description = "Returns the identity of the game, which is used as the name of the save directory.  The default is `default`.",
          key = "lovr.filesystem.getIdentity",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "identity",
                  type = "string",
                  description = "The name of the save directory."
                }
              }
            }
          }
        },
        {
          name = "getLastModified",
          summary = "Get the modification time of a file.",
          description = "Returns when a file was last modified.",
          key = "lovr.filesystem.getLastModified",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "file",
                  type = "string",
                  description = "The file."
                }
              },
              returns = {
                {
                  name = "time",
                  type = "number",
                  description = "The time when the file was last modified, in seconds."
                }
              }
            }
          }
        },
        {
          name = "getRealDirectory",
          summary = "Get the absolute path to a file.",
          description = "Get the absolute path of a directory containing a path in the virtual filesystem.  This can be used to determine if a file is in the game's source directory or the save directory.",
          key = "lovr.filesystem.getRealDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The path to check."
                }
              },
              returns = {
                {
                  name = "realpath",
                  type = "string",
                  description = "The absolute path of the directory containing `path`."
                }
              }
            }
          }
        },
        {
          name = "getSaveDirectory",
          summary = "Get the location of the save directory.",
          description = "Returns the absolute path to the save directory.",
          key = "lovr.filesystem.getSaveDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The absolute path to the save directory."
                }
              }
            }
          }
        },
        {
          name = "getSize",
          summary = "Get the size of a file.",
          description = "Returns the size of a file, in bytes.",
          key = "lovr.filesystem.getSize",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "file",
                  type = "string",
                  description = "The file."
                }
              },
              returns = {
                {
                  name = "size",
                  type = "number",
                  description = "The size of the file, in bytes."
                }
              }
            }
          }
        },
        {
          name = "getSource",
          summary = "Get the location of the project source.",
          description = "Get the absolute path of the project's source directory or archive.",
          key = "lovr.filesystem.getSource",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The absolute path of the project's source."
                }
              }
            }
          }
        },
        {
          name = "getUserDirectory",
          summary = "Get the location of the user's home directory.",
          description = "Returns the absolute path of the user's home directory.",
          key = "lovr.filesystem.getUserDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The absolute path of the user's home directory."
                }
              }
            }
          }
        },
        {
          name = "isDirectory",
          summary = "Check whether a path is a directory.",
          description = "Check if a path exists and is a directory.",
          key = "lovr.filesystem.isDirectory",
          module = "lovr.filesystem",
          related = {
            "lovr.filesystem.isFile"
          },
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The path to check."
                }
              },
              returns = {
                {
                  name = "isDirectory",
                  type = "boolean",
                  description = "Whether or not path is a directory."
                }
              }
            }
          }
        },
        {
          name = "isFile",
          summary = "Check whether a path is a file.",
          description = "Check if a path exists and is a file.",
          key = "lovr.filesystem.isFile",
          module = "lovr.filesystem",
          related = {
            "lovr.filesystem.isDirectory"
          },
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The path to check."
                }
              },
              returns = {
                {
                  name = "isFile",
                  type = "boolean",
                  description = "Whether or not path is a file."
                }
              }
            }
          }
        },
        {
          name = "isFused",
          summary = "Check if the project is fused.",
          description = "Returns whether the current project source is fused to the executable.",
          key = "lovr.filesystem.isFused",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "fused",
                  type = "boolean",
                  description = "Whether or not the project is fused."
                }
              }
            }
          }
        },
        {
          name = "load",
          summary = "Load a file as Lua code.",
          description = "Load a file containing Lua code, returning a Lua chunk that can be run.",
          key = "lovr.filesystem.load",
          module = "lovr.filesystem",
          notes = "An error is thrown if the file contains syntax errors.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The file to load."
                }
              },
              returns = {
                {
                  name = "chunk",
                  type = "function",
                  description = "The runnable chunk.",
                  arguments = {
                    {
                      name = "...",
                      type = "*"
                    }
                  },
                  returns = {
                    {
                      name = "...",
                      type = "*"
                    }
                  }
                }
              }
            }
          },
          examples = {
            {
              description = "Safely loading code:",
              code = "local success, chunk = pcall(lovr.filesystem.load, filename)\nif not success then\n  print('Oh no! There was an error: ' .. tostring(chunk))\nelse\n  local success, result = pcall(chunk)\n  print(success, result)\nend"
            }
          }
        },
        {
          name = "mount",
          summary = "Mount a directory or archive.",
          description = "Mounts a directory or `.zip` archive, adding it to the virtual filesystem.  This allows you to read files from it.",
          key = "lovr.filesystem.mount",
          module = "lovr.filesystem",
          related = {
            "lovr.filesystem.unmount"
          },
          notes = "The `append` option lets you control the priority of the archive's files in the event of naming collisions.",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The path to mount."
                },
                {
                  name = "mountpoint",
                  type = "string",
                  description = "The path in the virtual filesystem to mount to.",
                  default = "'/'"
                },
                {
                  name = "append",
                  type = "boolean",
                  description = "Whether the archive will be added to the end or the beginning of the search path.",
                  default = "false"
                }
              },
              returns = {}
            }
          },
          examples = {
            {
              description = "Mount `data.zip` with a file `images/background.png`:",
              code = "lovr.filesystem.mount('data.zip', 'assets')\nprint(lovr.filesystem.exists('assets/images/background.png')) -- true"
            }
          }
        },
        {
          name = "newBlob",
          summary = "Create a new Blob.",
          description = "Creates a new Blob from a file.",
          key = "lovr.filesystem.newBlob",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                name = {
                  type = "string",
                  description = "A name for the Blob (used in error messages)"
                },
                filename = {
                  type = "string",
                  description = "The file to load."
                },
                str = {
                  type = "string",
                  description = "A string containing the Blob's contents."
                }
              },
              returns = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The new Blob."
                }
              }
            }
          }
        },
        {
          name = "read",
          summary = "Read a file.",
          description = "Read the contents of a file.",
          key = "lovr.filesystem.read",
          module = "lovr.filesystem",
          notes = "If the file does not exist or cannot be read, an error is thrown.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The name of the file to read."
                }
              },
              returns = {
                {
                  name = "contents",
                  type = "string",
                  description = "The contents of the file."
                }
              }
            }
          }
        },
        {
          name = "remove",
          summary = "Remove a file or directory.",
          description = "Remove a file or directory in the save directory.",
          key = "lovr.filesystem.remove",
          module = "lovr.filesystem",
          notes = "A directory can only be removed if it is empty.",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The file or folder to remove.."
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether the path was removed."
                }
              }
            }
          }
        },
        {
          name = "setIdentity",
          summary = "Set the name of the save directory.",
          description = "Set the name of the save directory.",
          key = "lovr.filesystem.setIdentity",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "identity",
                  type = "string",
                  description = "The new name of the save directory."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setSource",
          summary = "Set the project source.",
          description = "Sets the location of the project's source.  This can only be done once, and is usually done internally.",
          key = "lovr.filesystem.setSource",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "identity",
                  type = "string",
                  description = "The path containing the project's source."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "unmount",
          summary = "Unmount a mounted archive.",
          description = "Unmounts a directory or archive previously mounted with `lovr.filesystem.mount`.",
          key = "lovr.filesystem.unmount",
          module = "lovr.filesystem",
          related = {
            "lovr.filesystem.mount"
          },
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The path to unmount."
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether the archive was unmounted."
                }
              }
            }
          }
        },
        {
          name = "write",
          summary = "Write to a file.",
          description = "Write to a file.",
          key = "lovr.filesystem.write",
          module = "lovr.filesystem",
          notes = "If the file does not exist, it is created.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The file to write to."
                },
                {
                  name = "content",
                  type = "string",
                  description = "A string to write to the file."
                }
              },
              returns = {
                {
                  name = "bytes",
                  type = "number",
                  description = "The number of bytes written."
                }
              }
            }
          }
        }
      },
      objects = {
        {
          name = "Blob",
          summary = "A loaded file object.",
          description = "A Blob is an object that loads and holds the contents of a file.  It can be passed to most functions that take filename arguments, like `lovr.graphics.newModel` or `lovr.audio.newSource`. Loading many objects this way is often faster because the file data only needs to be read once and can be reused.  It can also be useful if file data is retrieved from some non-filesystem source, such as a network request.",
          key = "Blob",
          module = "lovr.filesystem",
          methods = {
            {
              name = "getFilename",
              summary = "Get the file the Blob was loaded from.",
              description = "Returns the name of the file used to load the Blob, or the custom name given to it when it was created.",
              key = "Blob:getFilename",
              module = "lovr.filesystem",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "filename",
                      type = "string",
                      description = "The name of the Blob."
                    }
                  }
                }
              }
            },
            {
              name = "getPointer",
              summary = "Get a raw pointer to the Blob's data.",
              description = "Returns a raw pointer to the Blob's data.  This can be used to interface with other C libraries using the LuaJIT FFI.  Use this only if you know what you're doing!",
              key = "Blob:getPointer",
              module = "lovr.filesystem",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "pointer",
                      type = "userdata",
                      description = "A pointer to the data."
                    }
                  }
                }
              }
            },
            {
              name = "getSize",
              summary = "Get the size of the Blob's data.",
              description = "Returns the size of the Blob's contents, in bytes.",
              key = "Blob:getSize",
              module = "lovr.filesystem",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "bytes",
                      type = "number",
                      description = "The size of the Blob, in bytes."
                    }
                  }
                }
              }
            },
            {
              name = "getString",
              summary = "Get the Blob's contents as a string.",
              description = "Returns a binary string containing the Blob's data.",
              key = "Blob:getString",
              module = "lovr.filesystem",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "data",
                      type = "string",
                      description = "The Blob's data."
                    }
                  }
                }
              },
              examples = {
                {
                  description = "Manually copy a file using Blobs:",
                  code = "blob = lovr.filesystem.newBlob('image.png')\nlovr.filesystem.write('copy.png', blob:getString())"
                }
              }
            }
          },
          constructors = {
            "lovr.filesystem.newBlob"
          }
        }
      }
    },
    {
      name = "graphics",
      tag = "modules",
      summary = "Renders graphics.",
      description = "The `lovr.graphics` module renders graphics to displays.  Anything rendered using this module will automatically show up in the VR headset if one is connected, otherwise it will just show up in a window on the desktop.",
      key = "lovr.graphics",
      sections = {
        {
          name = "Drawing",
          tag = "graphicsPrimitives",
          description = "Simple functions for drawing simple shapes."
        },
        {
          name = "Objects",
          tag = "graphicsObjects",
          description = "Several graphics-related objects can be created with the graphics module.  Try to avoid calling these functions in `lovr.update` or `lovr.draw`, because then the objects will be loaded every frame, which can really slow things down!"
        },
        {
          name = "Transforms",
          tag = "graphicsTransforms",
          description = "These functions manipulate the 3D coordinate system.  By default the negative z axis points forwards and the positive y axis points up.  Manipulating the coordinate system can be used to create a hierarchy of rendered objects.  Thinking in many different coordinate systems can be challenging though, so be sure to brush up on 3D math first!"
        },
        {
          name = "State",
          tag = "graphicsState",
          description = "These functions get or set graphics state.  Graphics state is is a collection of small settings like the background color of the scene or the active shader.  Keep in mind that all this state is **global**, so if you change a setting, the change will persist until that piece of state is changed again."
        },
        {
          name = "Window",
          tag = "window",
          description = "Get info about the desktop window or operate on the underlying graphics context."
        }
      },
      enums = {
        {
          name = "BlendAlphaMode",
          summary = "Different ways of blending alpha.",
          description = "Different ways the alpha channel of pixels affects blending.",
          key = "BlendAlphaMode",
          module = "graphics",
          notes = "The premultiplied mode should be used if pixels being drawn have already been blended, or \"pre-multiplied\", by the alpha channel.  This happens when rendering a framebuffer that contains pixels with transparent alpha values, since the stored color values have already been faded by alpha and don't need to be faded a second time with the alphamultiply blend mode.",
          related = {
            "BlendMode",
            "lovr.graphics.getBlendMode",
            "lovr.graphics.setBlendMode"
          },
          values = {
            {
              name = "alphamultiply",
              description = "Color channel values are multiplied by the alpha channel during blending."
            },
            {
              name = "premultiplied",
              description = "Color channels are not multiplied by the alpha channel.  This should be used if the pixels being drawn have already been blended, or \"pre-multiplied\", by the alpha channel."
            }
          }
        },
        {
          name = "BlendMode",
          summary = "Different blend modes.",
          description = "Blend modes control how overlapping pixels are blended together, similar to layers in Photoshop.",
          key = "BlendMode",
          module = "graphics",
          values = {
            {
              name = "alpha",
              description = "Normal blending where the alpha value controls how the colors are blended."
            },
            {
              name = "add",
              description = "The incoming pixel color is added to the destination pixel color."
            },
            {
              name = "subtract",
              description = "The incoming pixel color is subtracted from the destination pixel color."
            },
            {
              name = "multiply",
              description = "The color channels from the two pixel values are multiplied together to produce a result."
            },
            {
              name = "lighten",
              description = "The maximum value from each color channel is used, resulting in a lightening effect."
            },
            {
              name = "darken",
              description = "The minimum value from each color channel is used, resulting in a darkening effect."
            },
            {
              name = "screen",
              description = "The opposite of multiply: The pixel values are inverted, multiplied, and inverted again, resulting in a lightening effect."
            },
            {
              name = "replace",
              description = "The incoming pixel replaces the destination pixel."
            }
          },
          related = {
            "BlendAlphaMode",
            "lovr.graphics.getBlendMode",
            "lovr.graphics.setBlendMode"
          }
        },
        {
          name = "CompareMode",
          summary = "Different depth test modes.",
          description = "The method used to compare z values when deciding how to overlap rendered objects.  This is called the \"depth test\", and it happens on a pixel-by-pixel basis every time new objects are drawn.  If the depth test \"passes\" for a pixel, then the pixel color will be replaced by the new color and the depth value in the depth buffer will be updated.  Otherwise, the pixel will not be changed and the depth value will not be updated.",
          key = "CompareMode",
          module = "graphics",
          values = {
            {
              name = "equal",
              description = "The depth test passes when the depth values are equal."
            },
            {
              name = "notequal",
              description = "The depth test passes when the depth values are not equal."
            },
            {
              name = "less",
              description = "The depth test passes when the new depth value is less than the existing one."
            },
            {
              name = "lequal",
              description = "The depth test passes when the new depth value is less than or equal to the existing one."
            },
            {
              name = "gequal",
              description = "The depth test passes when the new depth value is greater than or equal to the existing one."
            },
            {
              name = "greater",
              description = "The depth test passes when the new depth value is greater than the existing one."
            }
          }
        },
        {
          name = "DrawMode",
          summary = "Different ways graphics primitives can be drawn.",
          description = "Most graphics primitives can be drawn in one of two modes: a filled mode and a wireframe mode.",
          key = "DrawMode",
          module = "graphics",
          values = {
            {
              name = "fill",
              description = "The shape is drawn as a filled object."
            },
            {
              name = "line",
              description = "The shape is drawn as a wireframe object."
            }
          }
        },
        {
          name = "FilterMode",
          summary = "How textures are sampled.",
          description = "The method used to downsample (or upsample) a texture.  \"nearest\" can be used for a pixelated effect, whereas \"linear\" leads to more smooth results.  Nearest is slightly faster than linear.",
          key = "FilterMode",
          module = "graphics",
          values = {
            {
              name = "linear",
              description = "The texture will be smoothed."
            },
            {
              name = "nearest",
              description = "The texture will be pixelated."
            }
          }
        },
        {
          name = "HorizontalAlign",
          summary = "Different ways to horizontally align text.",
          description = "Different ways to horizontally align text when using `lovr.graphics.print`.",
          key = "HorizontalAlign",
          module = "graphics",
          values = {
            {
              name = "left",
              description = "Left aligned lines of text."
            },
            {
              name = "center",
              description = "Centered aligned lines of text."
            },
            {
              name = "right",
              description = "Right aligned lines of text."
            }
          },
          related = {
            "VerticalAlign",
            "lovr.graphics.print"
          }
        },
        {
          name = "MeshDrawMode",
          summary = "Different ways Mesh objects can be drawn.",
          description = "Meshes are lists of arbitrary vertices.  These vertices can be drawn in a few different ways, leading to different results.",
          key = "MeshDrawMode",
          module = "graphics",
          values = {
            {
              name = "points",
              description = "Draw each vertex as a single point."
            },
            {
              name = "strip",
              description = "The first three vertices define a triangle.  Each vertex after that creates a triangle using the new vertex and last two vertices."
            },
            {
              name = "triangles",
              description = "Each set of three vertices represents a discrete triangle."
            },
            {
              name = "fan",
              description = "Draws a set of triangles.  Each one shares the first vertex as a common point, leading to a fan-like shape."
            }
          }
        },
        {
          name = "MeshUsage",
          summary = "How a Mesh is going to be updated.",
          description = "Meshes can have a usage hint, describing how they are planning on being updated.  Setting the usage hint allows the graphics driver optimize how it handles the data in the Mesh.",
          key = "MeshUsage",
          module = "graphics",
          values = {
            {
              name = "static",
              description = "The Mesh contents will rarely change."
            },
            {
              name = "dynamic",
              description = "The Mesh contents will change often."
            },
            {
              name = "stream",
              description = "The Mesh contents will change constantly, potentially multiple times each frame."
            }
          }
        },
        {
          name = "PolygonWinding",
          summary = "Different winding directions.",
          description = "Whether the points on triangles are specified in a clockwise or counterclockwise order.",
          key = "PolygonWinding",
          module = "graphics",
          values = {
            {
              name = "clockwise",
              description = "Triangle vertices are specified in a clockwise order."
            },
            {
              name = "counterclockwise",
              description = "Triangle vertices are specified in a counterclockwise order."
            }
          }
        },
        {
          name = "TextureProjection",
          summary = "Different projection types for renderable textures.",
          description = "When creating Textures to be used as render targets, they can be created in either \"2d\" or \"3d\" mode.  2D mode is good for 2D user interfaces or postprocessing, whereas 3d is useful for portals, weapon scopes, mirrors, and other situations where 3D content needs to be rendered.",
          key = "TextureProjection",
          module = "graphics",
          values = {
            {
              name = "2d",
              description = "Use an orthographic projection."
            },
            {
              name = "3d",
              description = "Use a perspective projection."
            }
          }
        },
        {
          name = "VerticalAlign",
          summary = "Different ways to vertically align text.",
          description = "Different ways to vertically align text when using `lovr.graphics.print`.",
          key = "VerticalAlign",
          module = "graphics",
          values = {
            {
              name = "top",
              description = "Align the top of the text to the origin."
            },
            {
              name = "middle",
              description = "Vertically center the text."
            },
            {
              name = "bottom",
              description = "Align the bottom of the text to the origin."
            }
          },
          related = {
            "HorizontalAlign",
            "lovr.graphics.print"
          }
        },
        {
          name = "WrapMode",
          summary = "How to wrap Textures.",
          description = "The method used to render textures when texture coordinates are outside of the 0-1 range.",
          key = "WrapMode",
          module = "graphics",
          values = {
            {
              name = "clamp",
              description = "The texture will be clamped at its edges."
            },
            {
              name = "repeat",
              description = "The texture repeats."
            },
            {
              name = "mirroredrepeat",
              description = "The texture will repeat, mirroring its appearance each time it repeats."
            }
          }
        }
      },
      functions = {
        {
          name = "box",
          tag = "graphicsPrimitives",
          summary = "Draw a box.",
          description = "Draws a box.  This is similar to `lovr.graphics.cube` except you can have different values for the width, height, and depth of the box.",
          key = "lovr.graphics.box",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How to draw the box."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the box.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the box.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the box.",
                  default = "0"
                },
                {
                  name = "width",
                  type = "number",
                  description = "The width of the box, in meters.",
                  default = "1"
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the box, in meters.",
                  default = "1"
                },
                {
                  name = "depth",
                  type = "number",
                  description = "The depth of the box, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the box around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The Texture to apply to the box."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the box.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the box.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the box.",
                  default = "0"
                },
                {
                  name = "width",
                  type = "number",
                  description = "The width of the box, in meters.",
                  default = "1"
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the box, in meters.",
                  default = "1"
                },
                {
                  name = "depth",
                  type = "number",
                  description = "The depth of the box, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the box around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How to draw the box."
                },
                {
                  name = "transform",
                  type = "Transform",
                  description = "The transform of the box."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The Texture to apply to the box."
                },
                {
                  name = "transform",
                  type = "Transform",
                  description = "The transform of the box."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "clear",
          tag = "window",
          summary = "Clear the screen.",
          description = "Clears the screen to the background color.  This function is called automatically by `lovr.step`.",
          key = "lovr.graphics.clear",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.setBackgroundColor"
          },
          variants = {
            {
              arguments = {
                {
                  name = "color",
                  type = "boolean",
                  description = "Whether or not to clear color information on the screen.",
                  default = "true"
                },
                {
                  name = "depth",
                  type = "boolean",
                  description = "Whether or not to clear the depth information on the screen.",
                  default = "true"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "cube",
          tag = "graphicsPrimitives",
          summary = "Draw a cube.",
          description = "Draws a cube.",
          key = "lovr.graphics.cube",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How to draw the cube."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the cube.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the cube.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the cube.",
                  default = "0"
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the cube, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the cube around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the cube's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the cube's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the cube's axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The Texture to apply to the cube faces."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the cube.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the cube.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the cube.",
                  default = "0"
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the cube, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the cube around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the cube's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the cube's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the cube's axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How to draw the cube."
                },
                {
                  name = "transform",
                  type = "Transform",
                  description = "The cube's transform."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The Texture to apply to the cube faces."
                },
                {
                  name = "transform",
                  type = "Transform",
                  description = "The cube's transform."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "cylinder",
          tag = "graphicsPrimitives",
          summary = "Draw a cylinder.",
          description = "Draws a cylinder.",
          key = "lovr.graphics.cylinder",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x1",
                  type = "number",
                  description = "The x coordinate of the top of the cylinder."
                },
                {
                  name = "y1",
                  type = "number",
                  description = "The y coordinate of the top of the cylinder."
                },
                {
                  name = "z1",
                  type = "number",
                  description = "The z coordinate of the top of the cylinder."
                },
                {
                  name = "x2",
                  type = "number",
                  description = "The x coordinate of the bottom of the cylinder."
                },
                {
                  name = "y2",
                  type = "number",
                  description = "The y coordinate of the bottom of the cylinder."
                },
                {
                  name = "z2",
                  type = "number",
                  description = "The z coordinate of the bottom of the cylinder."
                },
                {
                  name = "r1",
                  type = "number",
                  description = "The radius of the top of the cylinder.",
                  default = "1"
                },
                {
                  name = "r2",
                  type = "number",
                  description = "The radius of the bottom of the cylinder.",
                  default = "1"
                },
                {
                  name = "capped",
                  type = "boolean",
                  description = "Whether the top and bottom should be rendered.",
                  default = "true"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of radial segments to use for the cylinder.  If nil, the segment count is automatically determined from the radii.",
                  default = "nil"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "getBackgroundColor",
          tag = "graphicsState",
          summary = "Get the background color.",
          description = "Returns the current background color.  Color components are from 0 to 255.",
          key = "lovr.graphics.getBackgroundColor",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the background color."
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the background color."
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the background color."
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the background color."
                }
              }
            }
          },
          notes = "The default background color is black."
        },
        {
          name = "getBlendMode",
          tag = "graphicsState",
          summary = "Get the blend mode.",
          description = "Returns the current blend mode.  The blend mode controls how each pixel's color is blended with the previous pixel's color when drawn.",
          key = "lovr.graphics.getBlendMode",
          module = "lovr.graphics",
          related = {
            "BlendMode",
            "BlendAlphaMode"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "blend",
                  type = "BlendMode",
                  description = "The current blend mode."
                },
                {
                  name = "alphaBlend",
                  type = "BlendAlphaMode",
                  description = "The current alpha blend mode."
                }
              }
            }
          }
        },
        {
          name = "getColor",
          tag = "graphicsState",
          summary = "Get the global color factor.",
          description = "Returns the current global color factor.  Color components are from 0 to 255.  Every pixel drawn will be multiplied (i.e. tinted) by this color.",
          key = "lovr.graphics.getColor",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the color."
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the color."
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the color."
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the color."
                }
              }
            }
          },
          notes = "The default color is white."
        },
        {
          name = "getColorMask",
          tag = "graphicsState",
          summary = "Get the color mask.",
          description = "Returns the active color channels.  If a color channel is active, then drawing operations will affect that particular channel.",
          key = "lovr.graphics.getColorMask",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "r",
                  type = "boolean",
                  description = "Whether or not the red channel is enabled."
                },
                {
                  name = "g",
                  type = "boolean",
                  description = "Whether or not the green channel is enabled."
                },
                {
                  name = "b",
                  type = "boolean",
                  description = "Whether or not the blue channel is enabled."
                },
                {
                  name = "a",
                  type = "boolean",
                  description = "Whether or not the alpha channel is enabled."
                }
              }
            }
          },
          notes = "Initially, all color channels are enabled."
        },
        {
          name = "getDepthTest",
          tag = "graphicsState",
          summary = "Get the depth test mode.",
          description = "Returns the current depth test.  The depth test controls how overlapping objects are rendered.",
          key = "lovr.graphics.getDepthTest",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "compareMode",
                  type = "CompareMode",
                  description = "The current depth test."
                }
              }
            }
          },
          notes = "The default depth test is `less`."
        },
        {
          name = "getDimensions",
          tag = "window",
          summary = "Get the dimensions of the window.",
          description = "Returns the dimensions of the desktop window.",
          key = "lovr.graphics.getDimensions",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.getWidth",
            "lovr.graphics.getHeight"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the window, in pixels."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the window, in pixels."
                }
              }
            }
          }
        },
        {
          name = "getFont",
          tag = "graphicsState",
          summary = "Get the active font.",
          description = "Returns the active font.",
          key = "lovr.graphics.getFont",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.print"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "font",
                  type = "Font",
                  description = "The active font object."
                }
              }
            }
          }
        },
        {
          name = "getHeight",
          tag = "window",
          summary = "Get the height of the window.",
          description = "Returns the height of the desktop window.",
          key = "lovr.graphics.getHeight",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.getWidth",
            "lovr.graphics.getDimensions"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "height",
                  type = "number",
                  description = "The height of the window, in pixels."
                }
              }
            }
          }
        },
        {
          name = "getLineWidth",
          tag = "graphicsState",
          summary = "Get the line width.",
          description = "Returns the current line width.",
          key = "lovr.graphics.getLineWidth",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The current line width, in pixels."
                }
              }
            }
          },
          related = {
            "lovr.graphics.line"
          },
          notes = "The default line width is `1.0`."
        },
        {
          name = "getPointSize",
          tag = "graphicsState",
          summary = "Get the point size.",
          description = "Returns the current point size.",
          key = "lovr.graphics.getPointSize",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "size",
                  type = "number",
                  description = "The current point size, in pixels."
                }
              }
            }
          },
          related = {
            "lovr.graphics.points"
          },
          notes = "The default point size is `1.0`."
        },
        {
          name = "getPolygonWinding",
          tag = "graphicsState",
          summary = "Get the winding direction.",
          description = "Returns the current polygon winding.  The winding direction determines which face of a triangle is the front face and which is the back face.  This lets the graphics engine cull the back faces of polygons, improving performance.",
          key = "lovr.graphics.getPolygonWinding",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "winding",
                  type = "PolygonWinding",
                  description = "The current winding direction."
                }
              }
            }
          },
          related = {
            "lovr.graphics.setCullingEnabled",
            "lovr.graphics.isCullingEnabled"
          },
          notes = "Culling is initially disabled and must be enabled using `lovr.graphics.setCullingEnabled`.\n\nThe default winding direction is counterclockwise."
        },
        {
          name = "getScissor",
          tag = "graphicsState",
          summary = "Get the scissor rectangle.",
          description = "Returns the current scissor.  The scissor is a rectangular area of the screen.  Any pixels outside the scissor region will be unaffected by drawing operations.",
          key = "lovr.graphics.getScissor",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the upper left corner of the scissor."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the upper left corner of the scissor."
                },
                {
                  name = "w",
                  type = "number",
                  description = "The width of the scissor in pixels."
                },
                {
                  name = "h",
                  type = "number",
                  description = "The height of the scissor in pixels."
                }
              }
            }
          }
        },
        {
          name = "getShader",
          tag = "graphicsState",
          summary = "Get the active shader.",
          description = "Returns the active shader.",
          key = "lovr.graphics.getShader",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "shader",
                  type = "Shader",
                  description = "The active shader object, or `nil` if none is active."
                }
              }
            }
          }
        },
        {
          name = "getSystemLimits",
          tag = "graphicsState",
          summary = "Get capabilities of the graphics card.",
          description = "Returns information about the capabilities of the graphics card, such as the maximum texture size or the amount of supported antialiasing.",
          key = "lovr.graphics.getSystemLimits",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "limits",
                  type = "table",
                  description = "The table of limits.",
                  table = {
                    {
                      name = "pointsize",
                      type = "number",
                      description = "The maximum size of points, in pixels."
                    },
                    {
                      name = "texturesize",
                      type = "number",
                      description = "The maximum width or height of textures, in pixels."
                    },
                    {
                      name = "texturemsaa",
                      type = "number",
                      description = "The maximum MSAA value supported by `lovr.graphics.newTexture`."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "getWidth",
          tag = "window",
          summary = "Get the width of the window.",
          description = "Returns the width of the desktop window.",
          key = "lovr.graphics.getWidth",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.getHeight",
            "lovr.graphics.getDimensions"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the window, in pixels."
                }
              }
            }
          }
        },
        {
          name = "isCullingEnabled",
          tag = "graphicsState",
          summary = "Get whether backface culling is enabled.",
          description = "Returns whether or not culling is active.  Culling is an optimization that avoids rendering the back face of polygons.  This improves performance by reducing the number of polygons drawn, but requires that the vertices in triangles are specified in a consistent clockwise or counter clockwise order.",
          key = "lovr.graphics.isCullingEnabled",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "isEnabled",
                  type = "boolean",
                  description = "Whether or not culling is enabled."
                }
              }
            }
          },
          notes = "Culling is disabled by default."
        },
        {
          name = "isWireframe",
          tag = "graphicsState",
          summary = "Get whether wireframe mode is enabled.",
          description = "Returns a boolean indicating whether or not wireframe rendering is enabled.",
          key = "lovr.graphics.isWireframe",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "isWireframe",
                  type = "boolean",
                  description = "Whether or not wireframe rendering is enabled."
                }
              }
            }
          },
          notes = "Wireframe rendering is initially disabled."
        },
        {
          name = "line",
          tag = "graphicsPrimitives",
          summary = "Draw lines.",
          description = "Draws lines between points.  Each point will be connected to the previous point in the list.",
          key = "lovr.graphics.line",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x1",
                  type = "number",
                  description = "The x coordinate of the first point."
                },
                {
                  name = "y1",
                  type = "number",
                  description = "The y coordinate of the first point."
                },
                {
                  name = "z1",
                  type = "number",
                  description = "The z coordinate of the first point."
                },
                {
                  name = "x2",
                  type = "number",
                  description = "The x coordinate of the second point."
                },
                {
                  name = "y2",
                  type = "number",
                  description = "The y coordinate of the second point."
                },
                {
                  name = "z2",
                  type = "number",
                  description = "The z coordinate of the second point."
                },
                {
                  name = "...",
                  type = "number",
                  description = "More points."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "points",
                  type = "table",
                  description = "A table of point positions, as described above."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "newFont",
          tag = "graphicsObjects",
          summary = "Create a new Font.",
          description = "Creates a new Font.  It can be used to render text with `lovr.graphics.print`.\n\nCurrently, the only supported font format is TTF.",
          key = "lovr.graphics.newFont",
          module = "lovr.graphics",
          notes = "Larger font sizes will lead to sharper text at the cost of performance.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the font file."
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the font, in pixels.",
                  default = "32"
                }
              },
              returns = {
                {
                  name = "font",
                  type = "Font",
                  description = "The new Font."
                }
              }
            },
            {
              description = "Creates a new Font from the default font included with LÖVR (Cabin).",
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The size of the font, in pixels.",
                  default = "32"
                }
              },
              returns = {
                {
                  name = "font",
                  type = "Font",
                  description = "The new Font."
                }
              }
            }
          }
        },
        {
          name = "newMesh",
          tag = "graphicsObjects",
          summary = "Create a new Mesh.",
          description = "Creates a new Mesh.  You must specify either the capacity for the Mesh or an initial set of vertex data.  The draw mode and usage hint can also optionally be specified.",
          key = "lovr.graphics.newMesh",
          module = "lovr.graphics",
          notes = "Once created, the size of the Mesh can't be changed.",
          variants = {
            {
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The maximum number of vertices the Mesh can store."
                },
                {
                  name = "mode",
                  type = "MeshDrawMode",
                  description = "How the Mesh will render its vertices.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "How the Mesh will be updated.",
                  default = "'dynamic'"
                }
              },
              returns = {
                {
                  name = "mesh",
                  type = "Mesh",
                  description = "The new Mesh."
                }
              }
            },
            {
              arguments = {
                {
                  name = "vertices",
                  type = "table",
                  description = "A table of vertices.  Each vertex is a table containing the vertex data."
                },
                {
                  name = "mode",
                  type = "MeshDrawMode",
                  description = "How the Mesh will render its vertices.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "How the Mesh will be updated.",
                  default = "'dynamic'"
                }
              },
              returns = {
                {
                  name = "mesh",
                  type = "Mesh",
                  description = "The new Mesh."
                }
              }
            },
            {
              description = "These variants accept a custom vertex format.  For more info, see the <a data-key=\"Mesh\">`Mesh`</a> page.",
              arguments = {
                {
                  name = "format",
                  type = "table",
                  description = "A table describing the attribute format for the vertices."
                },
                {
                  name = "size",
                  type = "number",
                  description = "The maximum number of vertices the Mesh can store."
                },
                {
                  name = "mode",
                  type = "MeshDrawMode",
                  description = "How the Mesh will render its vertices.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "How the Mesh will be updated.",
                  default = "'dynamic'"
                }
              },
              returns = {
                {
                  name = "mesh",
                  type = "Mesh",
                  description = "The new Mesh."
                }
              }
            },
            {
              arguments = {
                {
                  name = "format",
                  type = "table",
                  description = "A table describing the attribute format for the vertices."
                },
                {
                  name = "vertices",
                  type = "table",
                  description = "A table of vertices.  Each vertex is a table containing the vertex data."
                },
                {
                  name = "mode",
                  type = "MeshDrawMode",
                  description = "How the Mesh will render its vertices.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "How the Mesh will be updated.",
                  default = "'dynamic'"
                }
              },
              returns = {
                {
                  name = "mesh",
                  type = "Mesh",
                  description = "The new Mesh."
                }
              }
            }
          }
        },
        {
          name = "newModel",
          tag = "graphicsObjects",
          summary = "Create a new Model.",
          description = "Creates a new Model from a file.  The supported 3D file formats are `obj`, `fbx`, and collada. Models use normals and texture coordinates, if provided.\n\nThe following features are not supported yet: animations, materials, vertex colors.",
          key = "lovr.graphics.newModel",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the model to load."
                },
                {
                  name = "texture",
                  type = "string",
                  description = "A filename for a texture to apply to the Model, or `nil` for no texture.",
                  default = "nil"
                }
              },
              returns = {
                {
                  name = "model",
                  type = "Model",
                  description = "The new Model."
                }
              }
            }
          }
        },
        {
          name = "newShader",
          tag = "graphicsObjects",
          summary = "Create a new Shader.",
          description = "Creates a new Shader.",
          key = "lovr.graphics.newShader",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "vertex",
                  type = "string",
                  description = "The code or filename of the vertex shader.  If `nil`, the default vertex shader is used."
                },
                {
                  name = "fragment",
                  type = "string",
                  description = "The code or filename of the fragment shader.  If `nil`, the default fragment shader is used."
                }
              },
              returns = {
                {
                  name = "shader",
                  type = "Shader",
                  description = "The new Shader."
                }
              }
            }
          }
        },
        {
          name = "newSkybox",
          tag = "graphicsObjects",
          summary = "Create a new Skybox.",
          description = "Creates a new Skybox from a set of 6 images.",
          key = "lovr.graphics.newSkybox",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "right",
                  type = "string",
                  description = "The filename of the image for the right face of the skybox."
                },
                {
                  name = "left",
                  type = "string",
                  description = "The filename of the image for the left face of the skybox."
                },
                {
                  name = "top",
                  type = "string",
                  description = "The filename of the image for the top face of the skybox."
                },
                {
                  name = "bottom",
                  type = "string",
                  description = "The filename of the image for the bottom face of the skybox."
                },
                {
                  name = "back",
                  type = "string",
                  description = "The filename of the image for the back face of the skybox."
                },
                {
                  name = "front",
                  type = "string",
                  description = "The filename of the image for the front face of the skybox."
                }
              },
              returns = {
                {
                  name = "skybox",
                  type = "Skybox",
                  description = "The new Skybox."
                }
              }
            },
            {
              arguments = {
                {
                  name = "images",
                  type = "table",
                  description = "A table containing 6 images, as described above."
                }
              },
              returns = {
                {
                  name = "skybox",
                  type = "Skybox",
                  description = "The new Skybox."
                }
              }
            },
            {
              description = "Creates a Skybox from a single equirectangular image.",
              arguments = {
                {
                  name = "image",
                  type = "string",
                  description = "A filename for an equirectangular image to load."
                }
              },
              returns = {
                {
                  name = "skybox",
                  type = "Skybox",
                  description = "The new Skybox."
                }
              }
            }
          }
        },
        {
          name = "newTexture",
          tag = "graphicsObjects",
          summary = "Create a new Texture.",
          description = "Creates a new Texture from an image file.",
          key = "lovr.graphics.newTexture",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the image to load."
                }
              },
              returns = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The new Texture."
                }
              }
            },
            {
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the Texture, in pixels."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the Texture, in pixels."
                },
                {
                  name = "projection",
                  type = "TextureProjection",
                  description = "The type of projection to use when rendering to the Texture."
                },
                {
                  name = "msaa",
                  type = "number",
                  description = "The number of samples to use for multisample antialiasing.",
                  default = "0"
                }
              },
              returns = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The new Texture."
                }
              }
            }
          }
        },
        {
          name = "origin",
          tag = "graphicsTransforms",
          summary = "Reset the coordinate system.",
          description = "Resets the transformation to the origin.",
          key = "lovr.graphics.origin",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          },
          notes = "This is called at the beginning of every frame to reset the coordinate space."
        },
        {
          name = "plane",
          tag = "graphicsPrimitives",
          summary = "Draw a plane.",
          description = "Draws a plane with a given position, size, and orientation.",
          key = "lovr.graphics.plane",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How to draw the plane."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the plane.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the plane.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the plane.",
                  default = "0"
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the plane, in meters.",
                  default = "1"
                },
                {
                  name = "nx",
                  type = "number",
                  description = "The x coordinate of the normal vector of the plane.",
                  default = "0"
                },
                {
                  name = "ny",
                  type = "number",
                  description = "The y coordinate of the normal vector of the plane.",
                  default = "1"
                },
                {
                  name = "nz",
                  type = "number",
                  description = "The z coordinate of the normal vector of the plane.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              description = "Draw a textured plane.",
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The texture to apply to the plane."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the plane.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the plane.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the plane.",
                  default = "0"
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the plane, in meters.",
                  default = "1"
                },
                {
                  name = "nx",
                  type = "number",
                  description = "The x coordinate of the normal vector of the plane.",
                  default = "0"
                },
                {
                  name = "ny",
                  type = "number",
                  description = "The y coordinate of the normal vector of the plane.",
                  default = "1"
                },
                {
                  name = "nz",
                  type = "number",
                  description = "The z coordinate of the normal vector of the plane.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              description = "Draw a fullscreen textured plane.",
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The texture to apply to the plane."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "points",
          tag = "graphicsPrimitives",
          summary = "Draw one or more points.",
          description = "Draws one or more points.",
          key = "lovr.graphics.points",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the point."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the point."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the point."
                },
                {
                  name = "...",
                  type = "number",
                  description = "More points."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "points",
                  type = "table",
                  description = "A table of points, as described above."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "pop",
          tag = "graphicsTransforms",
          summary = "Pop the current transform off the stack.",
          description = "Pops the current transform from the stack, returning to the transformation that was applied before `lovr.graphics.push` was called.",
          key = "lovr.graphics.pop",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          },
          related = {
            "lovr.graphics.push"
          },
          notes = "An error is thrown if there isn't a transform to pop.  This can happen if you forget to call push before calling pop, or if you have an unbalanced sequence of pushes and pops."
        },
        {
          name = "present",
          tag = "window",
          summary = "Present a frame to the window.",
          description = "Presents the results of pending drawing operations to the window.  This is automatically called after `lovr.draw` by the default `lovr.step` function.",
          key = "lovr.graphics.present",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "print",
          tag = "graphicsPrimitives",
          summary = "Render text.",
          description = "Draws text in 3D space using the active font.",
          key = "lovr.graphics.print",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "str",
                  type = "string",
                  description = "The text to render."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the text.",
                  default = 0
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the text.",
                  default = 0
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the text.",
                  default = 0
                },
                {
                  name = "scale",
                  type = "number",
                  description = "The scale of the text.",
                  default = 1
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians to rotate the text around its rotation axis.",
                  default = 0
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation.",
                  default = 0
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation.",
                  default = 1
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation.",
                  default = 0
                },
                {
                  name = "wrap",
                  type = "number",
                  description = "The maximum width of each line, in meters (affected by `scale`).  Set to 0 or `nil` for no wrapping.",
                  default = "0"
                },
                {
                  name = "halign",
                  type = "HorizontalAlign",
                  description = "The horizontal alignment.",
                  default = "'center'"
                },
                {
                  name = "valign",
                  type = "VerticalAlign",
                  description = "The vertical alignment.",
                  default = "'middle'"
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.getFont",
            "lovr.graphics.setFont",
            "lovr.graphics.newFont",
            "Font"
          },
          notes = "Unicode text is supported.\n\nUse `\\n` to add line breaks."
        },
        {
          name = "push",
          tag = "graphicsTransforms",
          summary = "Push a copy of the current transform onto the stack.",
          description = "Pushes a copy of the current transform onto the transformation stack.  After changing the transform using `lovr.graphics.translate`, `lovr.graphics.rotate`, and `lovr.graphics.scale`, the original state can be restored using `lovr.graphics.pop`.",
          key = "lovr.graphics.push",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          },
          related = {
            "lovr.graphics.pop"
          },
          notes = "An error is thrown if more than 64 matrices are pushed.  This can happen accidentally if a push isn't followed by a corresponding pop."
        },
        {
          name = "reset",
          tag = "graphicsState",
          summary = "Reset all graphics state.",
          description = "Resets the graphics state.  This includes the coordinate transformation, projection, shader, colors, scissor, and culling state.",
          key = "lovr.graphics.reset",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "rotate",
          tag = "graphicsTransforms",
          summary = "Rotate the coordinate system.",
          description = "Rotates the coordinate system around an axis.\n\nThe rotation will last until `lovr.draw` returns or the transformation is popped off the transformation stack.",
          key = "lovr.graphics.rotate",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "angle",
                  type = "number",
                  description = "The amount to rotate the coordinate system by, in radians."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.scale",
            "lovr.graphics.translate",
            "lovr.graphics.transform"
          },
          notes = "Order matters when scaling, translating, and rotating the coordinate system."
        },
        {
          name = "scale",
          tag = "graphicsTransforms",
          summary = "Scale the coordinate system.",
          description = "Scales the coordinate system in 3 dimensions.  This will cause objects to appear bigger or smaller.\n\nThe scaling will last until `lovr.draw` returns or the transformation is popped off the transformation stack.",
          key = "lovr.graphics.scale",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The amount to scale on the x axis."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The amount to scale on the y axis.",
                  default = "x"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The amount to scale on the z axis.",
                  default = "x"
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.rotate",
            "lovr.graphics.translate",
            "lovr.graphics.transform"
          },
          notes = "Order matters when scaling, translating, and rotating the coordinate system."
        },
        {
          name = "setBackgroundColor",
          tag = "graphicsState",
          summary = "Set the background color.",
          description = "Sets the background color used to clear the screen.  Color components are from 0 to 255.",
          key = "lovr.graphics.setBackgroundColor",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the background color."
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the background color."
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the background color."
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the background color.",
                  default = "255"
                }
              },
              returns = {}
            }
          },
          notes = "The default background color is black."
        },
        {
          name = "setBlendMode",
          tag = "graphicsState",
          summary = "Set the blend mode.",
          description = "Sets the blend mode.  The blend mode controls how each pixel's color is blended with the previous pixel's color when drawn.",
          key = "lovr.graphics.setBlendMode",
          module = "lovr.graphics",
          related = {
            "BlendMode",
            "BlendAlphaMode"
          },
          variants = {
            {
              arguments = {
                {
                  name = "blend",
                  type = "BlendMode",
                  description = "The blend mode."
                },
                {
                  name = "alphaBlend",
                  type = "BlendAlphaMode",
                  description = "The alpha blend mode."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setColor",
          tag = "graphicsState",
          summary = "Set the global color factor.",
          description = "Sets the color used for drawing objects.  Color components are from 0 to 255.  Every pixel drawn will be multiplied (i.e. tinted) by this color.  This is a global setting, so it will affect all subsequent drawing operations.",
          key = "lovr.graphics.setColor",
          module = "lovr.graphics",
          notes = "The default color is white.",
          variants = {
            {
              arguments = {
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the color."
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the color."
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the color."
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the color.",
                  default = "255"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "color",
                  type = "table",
                  description = "A table containing the color components."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "hex",
                  type = "number",
                  description = "An integer containing all four color components."
                }
              },
              returns = {}
            }
          },
          examples = {
            {
              description = "Draw a red cube.",
              code = "function lovr.draw()\n  lovr.graphics.setColor(255, 0, 0)\n  lovr.graphics.cube('fill', 0, 1.7, -1, .5, lovr.timer.getTime())\nend"
            }
          }
        },
        {
          name = "setColorMask",
          tag = "graphicsState",
          summary = "Set the color mask.",
          description = "Sets which color channels are affected by drawing operations.",
          key = "lovr.graphics.setColorMask",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "r",
                  type = "boolean",
                  description = "Whether or not the red channel should be enabled.",
                  default = "true"
                },
                {
                  name = "g",
                  type = "boolean",
                  description = "Whether or not the green channel should be enabled.",
                  default = "true"
                },
                {
                  name = "b",
                  type = "boolean",
                  description = "Whether or not the blue channel should be enabled.",
                  default = "true"
                },
                {
                  name = "a",
                  type = "boolean",
                  description = "Whether or not the alpha channel should be enabled.",
                  default = "true"
                }
              },
              returns = {}
            }
          },
          notes = "Initially, all color channels are enabled."
        },
        {
          name = "setCullingEnabled",
          tag = "graphicsState",
          summary = "Enable or disable backface culling.",
          description = "Enables or disables culling.  Culling is an optimization that avoids rendering the back face of polygons.  This improves performance by reducing the number of polygons drawn, but requires that the vertices in triangles are specified in a consistent clockwise or counter clockwise order.",
          key = "lovr.graphics.setCullingEnabled",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "isEnabled",
                  type = "boolean",
                  description = "Whether or not culling should be enabled."
                }
              },
              returns = {}
            }
          },
          notes = "Culling is disabled by default."
        },
        {
          name = "setDepthTest",
          tag = "graphicsState",
          summary = "Set or disable the depth test.",
          description = "Sets the current depth test.  The depth test controls how overlapping objects are rendered.",
          key = "lovr.graphics.setDepthTest",
          module = "lovr.graphics",
          notes = "The default depth test is `less`.",
          variants = {
            {
              description = "Set a new depth test.",
              arguments = {
                {
                  name = "compareMode",
                  type = "CompareMode",
                  description = "The new depth test."
                }
              },
              returns = {}
            },
            {
              description = "Disable the depth test.",
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "setFont",
          tag = "graphicsState",
          summary = "Set the active font.",
          description = "Sets the active font used to render text with `lovr.graphics.print`.",
          key = "lovr.graphics.setFont",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.print"
          },
          variants = {
            {
              arguments = {
                {
                  name = "font",
                  type = "Font",
                  description = "The font to use."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setLineWidth",
          tag = "graphicsState",
          summary = "Set the line width.",
          description = "Sets the width of lines rendered using `lovr.graphics.line`.",
          key = "lovr.graphics.setLineWidth",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The new line width, in pixels."
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.line"
          },
          notes = "The default line width is `1.0`.\n\nDriver support for line widths is poor.  The actual width of lines may be different from what is set here.  In particular, some graphics drivers only support a line width of `1.0`."
        },
        {
          name = "setPointSize",
          tag = "graphicsState",
          summary = "Set the point size.",
          description = "Sets the width of drawn points, in pixels.",
          key = "lovr.graphics.setPointSize",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The new point size."
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.points"
          },
          notes = "The default point size is `1.0`."
        },
        {
          name = "setPolygonWinding",
          tag = "graphicsState",
          summary = "Set the winding direction.",
          description = "Sets the polygon winding.  The winding direction determines which face of a triangle is the front face and which is the back face.  This lets the graphics engine cull the back faces of polygons, improving performance.  The default is counterclockwise.",
          key = "lovr.graphics.setPolygonWinding",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "winding",
                  type = "PolygonWinding",
                  description = "The new winding direction."
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.setCullingEnabled",
            "lovr.graphics.isCullingEnabled"
          },
          notes = "Culling is initially disabled and must be enabled using `lovr.graphics.setCullingEnabled`.\n\nThe default winding direction is counterclockwise."
        },
        {
          name = "setScissor",
          tag = "graphicsState",
          summary = "Set the scissor rectangle.",
          description = "Sets the scissor region.  The scissor is a rectangular area of the screen.  Any pixels outside the scissor region will be unaffected by drawing operations.",
          key = "lovr.graphics.setScissor",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the upper left corner of the scissor."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the upper left corner of the scissor."
                },
                {
                  name = "w",
                  type = "number",
                  description = "The width of the scissor in pixels."
                },
                {
                  name = "h",
                  type = "number",
                  description = "The height of the scissor in pixels."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setShader",
          tag = "graphicsState",
          summary = "Set or disable the active shader.",
          description = "Sets or disables the Shader used for drawing.",
          key = "lovr.graphics.setShader",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "shader",
                  type = "Shader",
                  description = "The shader to use."
                }
              },
              returns = {}
            },
            {
              description = "Revert back to the default shader.",
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "setWireframe",
          tag = "graphicsState",
          summary = "Enable or disable wireframe rendering.",
          description = "Enables or disables wireframe rendering.  This is meant to be used as a debugging tool.",
          key = "lovr.graphics.setWireframe",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "wireframe",
                  type = "boolean",
                  description = "Whether or not wireframe rendering should be enabled."
                }
              },
              returns = {}
            }
          },
          notes = "Wireframe rendering is initially disabled."
        },
        {
          name = "sphere",
          tag = "graphicsPrimitives",
          summary = "Draw a sphere.",
          description = "Draws a sphere.",
          key = "lovr.graphics.sphere",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the sphere.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the sphere.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the sphere.",
                  default = "0"
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the sphere, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the sphere around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the sphere's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the sphere's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the sphere's axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The Texture to apply to the sphere."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the sphere.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the sphere.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the sphere.",
                  default = "0"
                },
                {
                  name = "size",
                  type = "number",
                  description = "The size of the sphere, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the sphere around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the sphere's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the sphere's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the sphere's axis of rotation.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "transform",
                  type = "Transform",
                  description = "The sphere's transform."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The Texture to apply to the sphere."
                },
                {
                  name = "transform",
                  type = "Transform",
                  description = "The sphere's transform."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "transform",
          tag = "graphicsTransforms",
          summary = "Apply a general transform to the coordinate system.",
          description = "Apply a transform to the coordinate system, changing its translation, rotation, and scale using a single function.  A Transform object can also be used.\n\nThe transformation will last until `lovr.draw` returns or the transformation is popped off the transformation stack.",
          key = "lovr.graphics.transform",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.rotate",
            "lovr.graphics.scale",
            "lovr.graphics.translate"
          },
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x component of the translation.",
                  default = 0
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y component of the translation.",
                  default = 0
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z component of the translation.",
                  default = 0
                },
                {
                  name = "sx",
                  type = "number",
                  description = "The x scale factor.",
                  default = 1
                },
                {
                  name = "sy",
                  type = "number",
                  description = "The y scale factor.",
                  default = 1
                },
                {
                  name = "sz",
                  type = "number",
                  description = "The z scale factor.",
                  default = 1
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians to rotate around the rotation axis.",
                  default = 0
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation.",
                  default = 0
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation.",
                  default = 1
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation.",
                  default = 0
                }
              },
              returns = {}
            },
            {
              description = "Modify the coordinate system using a Transform object.",
              arguments = {
                {
                  name = "transform",
                  type = "Transform",
                  description = "The Transform to apply to the coordinate system."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "translate",
          tag = "graphicsTransforms",
          summary = "Translate the coordinate system.",
          description = "Translates the coordinate system in three dimensions.  All graphics operations that use coordinates will behave as if they are offset by the translation value.\n\nThe translation will last until `lovr.draw` returns or the transformation is popped off the transformation stack.",
          key = "lovr.graphics.translate",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The amount to translate on the x axis."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The amount to translate on the y axis."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The amount to translate on the z axis."
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.graphics.rotate",
            "lovr.graphics.scale",
            "lovr.graphics.transform"
          },
          notes = "Order matters when scaling, translating, and rotating the coordinate system."
        },
        {
          name = "triangle",
          tag = "graphicsPrimitives",
          summary = "Draw a triangle.",
          description = "Draws a triangle from three points.",
          key = "lovr.graphics.triangle",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How to draw the triangle."
                },
                {
                  name = "x1",
                  type = "number",
                  description = "The x coordinate of the first point."
                },
                {
                  name = "y1",
                  type = "number",
                  description = "The y coordinate of the first point."
                },
                {
                  name = "z1",
                  type = "number",
                  description = "The z coordinate of the first point."
                },
                {
                  name = "x2",
                  type = "number",
                  description = "The x coordinate of the second point."
                },
                {
                  name = "y2",
                  type = "number",
                  description = "The y coordinate of the second point."
                },
                {
                  name = "z2",
                  type = "number",
                  description = "The z coordinate of the second point."
                },
                {
                  name = "x3",
                  type = "number",
                  description = "The x coordinate of the third point."
                },
                {
                  name = "y3",
                  type = "number",
                  description = "The y coordinate of the third point."
                },
                {
                  name = "z3",
                  type = "number",
                  description = "The z coordinate of the third point."
                }
              },
              returns = {}
            }
          },
          notes = "Unlike some of the other primitives, exactly 3 points are required here."
        }
      },
      objects = {
        {
          name = "Font",
          summary = "A loaded font used to render text.",
          description = "A Font is an object created from a TTF file.  It can be used to render text with `lovr.graphics.print`.",
          key = "Font",
          module = "lovr.graphics",
          methods = {
            {
              name = "getAscent",
              summary = "Get the ascent of the Font.",
              description = "Returns the maximum distance that any glyph will extend above the Font's baseline.  Units are generally in meters, see `Font:getPixelDensity`.",
              key = "Font:getAscent",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "ascent",
                      type = "number",
                      description = "The ascent of the Font."
                    }
                  }
                }
              }
            },
            {
              name = "getBaseline",
              summary = "Get the baseline of the Font.",
              description = "Returns the baseline of the Font.  This is where the characters \"rest on\", relative to the y coordinate of the drawn text.  Units are generally in meters, see `Font:setPixelDensity`.",
              key = "Font:getBaseline",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "baseline",
                      type = "number",
                      description = "The baseline of the Font."
                    }
                  }
                }
              }
            },
            {
              name = "getDescent",
              summary = "Get the descent of the Font.",
              description = "Returns the maximum distance that any glyph will extend below the Font's baseline.  Units are generally in meters, see `Font:getPixelDensity` for more information.  Note that due to the coordinate system for fonts, this is a negative value.",
              key = "Font:getDescent",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "descent",
                      type = "number",
                      description = "The descent of the Font."
                    }
                  }
                }
              }
            },
            {
              name = "getHeight",
              summary = "Get the height of a line of text.",
              description = "Returns the height of a line of text, in meters.  Units are in meters, see `Font:setPixelDensity`.",
              key = "Font:getHeight",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "height",
                      type = "number",
                      description = "The height of a rendered line of text."
                    }
                  }
                }
              }
            },
            {
              name = "getLineHeight",
              summary = "Get the line height of the Font.",
              description = "Returns the current line height of the Font.  The default is 1.0.",
              key = "Font:getLineHeight",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "lineHeight",
                      type = "number",
                      description = "The line height."
                    }
                  }
                }
              }
            },
            {
              name = "getPixelDensity",
              summary = "Get the pixel density of the Font.",
              description = "Returns the current pixel density for the Font.  The default is 1.0.  Normally, this is in pixels per meter.  When rendering to a 2D texture, the units are pixels.",
              key = "Font:getPixelDensity",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "pixelDensity",
                      type = "number",
                      description = "The current pixel density."
                    }
                  }
                }
              }
            },
            {
              name = "getWidth",
              summary = "Get the width of a line of text.",
              description = "Returns the width of a string when rendered using the font, with an optional wrap.  To get the correct units returned, make sure the pixel density is set with `Font:setPixelDensity`.",
              key = "Font:getWidth",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "text",
                      type = "string",
                      description = "The text to get the width of."
                    },
                    {
                      name = "wrap",
                      type = "number",
                      description = "The width at which to wrap lines, or 0 for no wrap.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The maximum width of any line in the text."
                    }
                  }
                }
              }
            },
            {
              name = "setLineHeight",
              summary = "Set the line height of the Font.",
              description = "Sets the line height of the Font, which controls how far lines apart lines are vertically separated.  This value is a ratio and the default is 1.0.",
              key = "Font:setLineHeight",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "lineHeight",
                      type = "number",
                      description = "The new line height."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setPixelDensity",
              summary = "Set the pixel density of the Font.",
              description = "Sets the pixel density for the Font.  Normally, this is in pixels per meter.  When rendering to a 2D texture, the units are pixels.",
              key = "Font:setPixelDensity",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "pixelDensity",
                      type = "number",
                      description = "The new pixel density."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          constructors = {
            "lovr.graphics.newFont"
          }
        },
        {
          name = "Mesh",
          summary = "A drawable list of vertices.",
          description = "A Mesh is a low-level graphics object that stores and renders a list of vertices.\n\nMeshes are really flexible since you can pack pretty much whatever you want in them.  This makes them great for rendering arbitrary geometry, but it also makes them kinda difficult to use since you have to place each vertex yourself.\n\nIt's possible to batch geometry with Meshes too.  Instead of drawing a shape 100 times, it's much faster to pack 100 copies of the shape into a Mesh and draw the Mesh once.\n\nMeshes are also a good choice if you have a mesh that changes its shape over time.",
          key = "Mesh",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newMesh"
          },
          notes = "Each vertex in a Mesh can hold several pieces of data.  For example, you might want a vertex to keep track of its position, color, and a weight.  Each one of these pieces of information is called a vertex **attribute**.  A vertex attribute must have a name, a type, and a size.  Here's what the \"position\" attribute would look like as a Lua table:\n\n    { 'vPosition', 'float', 3 } -- 3 floats for x, y, and z\n\nEvery vertex in a Mesh must have the same set of attributes.  We call this set of attributes the **format** of the Mesh, and it's specified as a simple table of attributes.  For example, we could represent the format described above as:\n\n    {\n      { 'vPosition', 'float', 3 },\n      { 'vColor',    'byte',  4 },\n      { 'vWeight',   'int',   1 }\n    }\n\nWhen creating a Mesh, you can give it any format you want, or use the default.  The default Mesh format looks like this:\n\n    {\n      { 'lovrPosition', 'float', 3 },\n      { 'lovrNormal',   'float', 3 },\n      { 'lovrTexCoord', 'float', 2 }\n    }\n\nGreat, so why do we go through the trouble of naming everything in our vertex and saying what type and size it is?  The cool part is that we can access this data in a Shader.  We can write a vertex Shader that has `in` variables for every vertex attribute in our Mesh:\n\n    in vec3 vPosition;\n    in vec4 vColor;\n    in int vWeight;\n\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      // Here we can access the vPosition, vColor, and vWeight of each vertex in the Mesh!\n    }\n\nSpecifying custom vertex data is really powerful and is often used for lighting, animation, and more!",
          methods = {
            {
              name = "draw",
              summary = "Draw the Mesh.",
              description = "Draws the contents of the Mesh.",
              key = "Mesh:draw",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate to draw the Mesh at.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate to draw the Mesh at.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate to draw the Mesh at.",
                      default = "0"
                    },
                    {
                      name = "scale",
                      type = "number",
                      description = "The scale to draw the Mesh at.",
                      default = "1"
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The angle to rotate the Mesh around its axis of rotation.",
                      default = "0"
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation.",
                      default = "0"
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation.",
                      default = "1"
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation.",
                      default = "0"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The transform to apply before drawing."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "getDrawMode",
              summary = "Get the draw mode of the Mesh.",
              description = "Get the draw mode of the Mesh, which controls how the vertices are connected together.",
              key = "Mesh:getDrawMode",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "mode",
                      type = "MeshDrawMode",
                      description = "The draw mode of the Mesh."
                    }
                  }
                }
              }
            },
            {
              name = "getDrawRange",
              summary = "Get the draw range of the Mesh.",
              description = "Retrieve the current draw range for the Mesh.  The draw range is a subset of the vertices of the Mesh that will be drawn.",
              key = "Mesh:getDrawRange",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "start",
                      type = "number",
                      description = "The index of the first vertex that will be drawn, or `nil` if no draw range is set."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of vertices that will be drawn, or `nil` if no draw range is set."
                    }
                  }
                }
              }
            },
            {
              name = "getTexture",
              summary = "Get the Texture applied to the Mesh.",
              description = "Get the Texture applied to the Mesh.",
              key = "Mesh:getTexture",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The current texture applied to the Mesh."
                    }
                  }
                }
              }
            },
            {
              name = "getVertex",
              summary = "Get a single vertex in the Mesh.",
              description = "Gets the data for a single vertex in the Mesh.  The set of data returned depends on the Mesh's vertex format.  The default vertex format consists of 8 floating point numbers: the vertex position, the vertex normal, and the texture coordinates.",
              key = "Mesh:getVertex",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the vertex to retrieve."
                    }
                  },
                  returns = {
                    {
                      name = "...",
                      type = "number",
                      description = "All attributes of the vertex."
                    }
                  }
                }
              }
            },
            {
              name = "getVertexAttribute",
              summary = "Get an attribute of a single vertex in the Mesh.",
              description = "Get the components of a specific attribute of a single vertex in the Mesh.",
              key = "Mesh:getVertexAttribute",
              module = "lovr.graphics",
              notes = "Meshes without a custom format have the vertex position as their first attribute, the normal vector as the second attribute, and the texture coordinate as the third attribute.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the vertex to retrieve the attribute of."
                    },
                    {
                      name = "attribute",
                      type = "number",
                      description = "The index of the attribute to retrieve the components of."
                    }
                  },
                  returns = {
                    {
                      name = "...",
                      type = "number",
                      description = "The components of the vertex attribute."
                    }
                  }
                }
              }
            },
            {
              name = "getVertexCount",
              summary = "Get the number of vertices the Mesh can hold.",
              description = "Returns the maximum number of vertices the Mesh can hold.",
              key = "Mesh:getVertexCount",
              module = "lovr.graphics",
              notes = "The size can only be set when creating the Mesh, and cannot be changed afterwards.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "size",
                      type = "number",
                      description = "The number of vertices the Mesh can hold."
                    }
                  }
                }
              }
            },
            {
              name = "getVertexFormat",
              summary = "Get the vertex format of the Mesh.",
              description = "Get the format table of the Mesh's vertices.  The format table describes the set of data that each vertex contains.",
              key = "Mesh:getVertexFormat",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "format",
                      type = "table",
                      description = "The table of vertex attributes.  Each attribute is a table containing the name of the attribute, the data type, and the number of components."
                    }
                  }
                }
              }
            },
            {
              name = "getVertexMap",
              summary = "Get the current vertex map of the Mesh.",
              description = "Returns the current vertex map for the Mesh.  The vertex map is a list of indices in the Mesh, allowing the reordering or reuse of vertices.",
              key = "Mesh:getVertexMap",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "map",
                      type = "table",
                      description = "The list of indices in the vertex map, or `nil` if no vertex map is set."
                    }
                  }
                }
              }
            },
            {
              name = "isAttributeEnabled",
              summary = "Check if a vertex attribute is enabled.",
              description = "Returns whether or not a vertex attribute is enabled.  Disabled attributes won't be sent to shaders.",
              key = "Mesh:isAttributeEnabled",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "attribute",
                      type = "string",
                      description = "The name of the attribute."
                    }
                  },
                  returns = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether or not the attribute is enabled when drawing the Mesh."
                    }
                  }
                }
              }
            },
            {
              name = "setAttributeEnabled",
              summary = "Enable or disable a vertex attribute.",
              description = "Sets whether a vertex attribute is enabled.  Disabled attributes won't be sent to shaders.",
              key = "Mesh:setAttributeEnabled",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "attribute",
                      type = "string",
                      description = "The name of the attribute."
                    },
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether or not the attribute is enabled when drawing the Mesh."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setDrawMode",
              summary = "Change the draw mode of the Mesh.",
              description = "Set a new draw mode for the Mesh.",
              key = "Mesh:setDrawMode",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "mode",
                      type = "MeshDrawMode",
                      description = "The new draw mode for the Mesh."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setDrawRange",
              summary = "Set the draw range of the Mesh.",
              description = "Set the draw range for the Mesh.  The draw range is a subset of the vertices of the Mesh that will be drawn.",
              key = "Mesh:setDrawRange",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "start",
                      type = "number",
                      description = "The first vertex that will be drawn."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of vertices that will be drawn."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setTexture",
              summary = "Apply a Texture to the Mesh.",
              description = "Applies a Texture to the Mesh.",
              key = "Mesh:setTexture",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The new texture."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVertex",
              summary = "Update a single vertex in the Mesh.",
              description = "Update a single vertex in the Mesh.",
              key = "Mesh:setVertex",
              module = "lovr.graphics",
              notes = "Any unspecified components will be set to 0 for float and int attributes, or 255 for byte attributes.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the vertex to set."
                    },
                    {
                      name = "...",
                      type = "number",
                      description = "The attributes of the vertex."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the vertex to set."
                    },
                    {
                      name = "vertexData",
                      type = "table",
                      description = "A table containing the attributes of the vertex."
                    }
                  },
                  returns = {}
                }
              },
              examples = {
                {
                  description = "Set the position of a vertex:",
                  code = "function lovr.load()\n  mesh = lovr.graphics.newMesh({\n    { -1, 1, 0,  0, 0, 1,  0, 0 },\n    { 1, 1, 0,  0, 0, 1,  1, 0 },\n    { -1, -1, 0,  0, 0, 1,  0, 1 },\n    { 1, -1, 0,  0, 0, 1,  1, 1 }\n  }, 'strip')\n\n  mesh:setVertex(2, { 7, 7, 7 })\n  print(mesh:getVertex(2)) -- 7, 7, 7, 0, 0, 0, 0, 0\nend"
                }
              }
            },
            {
              name = "setVertexAttribute",
              summary = "Update a specific attribute of a single vertex in the Mesh.",
              description = "Set the components of a specific attribute of a vertex in the Mesh.",
              key = "Mesh:setVertexAttribute",
              module = "lovr.graphics",
              notes = "Meshes without a custom format have the vertex position as their first attribute, the normal vector as the second attribute, and the texture coordinate as the third attribute.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the vertex to update."
                    },
                    {
                      name = "attribute",
                      type = "number",
                      description = "The index of the attribute to update."
                    },
                    {
                      name = "...",
                      type = "number",
                      description = "Thew new components for the attribute."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVertexMap",
              summary = "Set the vertex map of the Mesh.",
              description = "Sets the vertex map.  The vertex map is a list of indices in the Mesh, allowing the reordering or reuse of vertices.\n\nOften, a vertex map is used to improve performance, since it usually requires less data to specify the index of a vertex than it does to specify all of the data for a vertex.",
              key = "Mesh:setVertexMap",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "map",
                      type = "table",
                      description = "The new vertex map.  Each element of the table is an index of a vertex."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVertices",
              summary = "Update multiple vertices in the Mesh.",
              description = "Update multiple vertices in the Mesh.",
              key = "Mesh:setVertices",
              module = "lovr.graphics",
              notes = "The start index plus the number of vertices in the table should not exceed the maximum size of the Mesh.",
              variants = {
                {
                  arguments = {
                    {
                      name = "vertices",
                      type = "table",
                      description = "The new set of vertices."
                    },
                    {
                      name = "start",
                      type = "number",
                      description = "The index of the vertex to start replacing at.",
                      default = "1"
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          examples = {
            {
              description = "Draw a circle using a Mesh.",
              code = "function lovr.load()\n  local x, y, z = 0, 1, -2\n  local radius = .3\n  local points = 40\n\n  -- A table to hold the Mesh data\n  local vertices = {}\n\n  for i = 0, points do\n    local angle = i / points * 2 * math.pi\n    local vx = x + math.cos(angle)\n    local vy = y + math.sin(angle)\n    table.insert(vertices, { vx, vy, z })\n  end\n\n  mesh = lovr.graphics.newMesh(vertices, 'fan')\nend\n\nfunction lovr.draw()\n  mesh:draw()\nend"
            }
          }
        },
        {
          name = "Model",
          summary = "An asset imported from a 3D model file.",
          description = "A Model is a drawable object loaded from a 3D file format.  The supported 3D file formats are `obj`, `fbx`, and collada.  Models will use normals and texture coordinates, if provided.\n\nThe following advanced features are not supported yet: animations, materials, and vertex colors.",
          key = "Model",
          module = "lovr.graphics",
          examples = {
            {
              code = "local model\n\nfunction lovr.load()\n  model = lovr.graphics.newModel('assets/model.fbx', 'assets/texture.png')\nend\n\nfunction lovr.draw()\n  model:draw(0, 1, -1, 1, lovr.timer.getTime())\nend"
            }
          },
          constructors = {
            "lovr.graphics.newModel",
            "Controller:newModel"
          },
          methods = {
            {
              name = "draw",
              summary = "Draw the Model.",
              description = "Draw the Model.",
              key = "Model:draw",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate to draw the Model at.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate to draw the Model at.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate to draw the Model at.",
                      default = "0"
                    },
                    {
                      name = "scale",
                      type = "number",
                      description = "The scale to draw the Model at.",
                      default = "1"
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The angle to rotate the Model around its axis of rotation.",
                      default = "0"
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation.",
                      default = "0"
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation.",
                      default = "1"
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation.",
                      default = "0"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The transform to apply before drawing."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "getAABB",
              summary = "Get the Model's axis aligned bounding box.",
              description = "Returns a bounding box that encloses the vertices of the Model.",
              key = "Model:getAABB",
              module = "lovr.graphics",
              related = {
                "Collider:getAABB"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "minx",
                      type = "number",
                      description = "The minimum x coordinate of the box."
                    },
                    {
                      name = "maxx",
                      type = "number",
                      description = "The maximum x coordinate of the box."
                    },
                    {
                      name = "miny",
                      type = "number",
                      description = "The minimum y coordinate of the box."
                    },
                    {
                      name = "maxy",
                      type = "number",
                      description = "The maximum y coordinate of the box."
                    },
                    {
                      name = "minz",
                      type = "number",
                      description = "The minimum z coordinate of the box."
                    },
                    {
                      name = "maxz",
                      type = "number",
                      description = "The maximum z coordinate of the box."
                    }
                  }
                }
              }
            },
            {
              name = "getTexture",
              summary = "Get the Texture applied to the Model.",
              description = "Get the Texture applied to the Model.",
              key = "Model:getTexture",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The current texture applied to the Model."
                    }
                  }
                }
              }
            },
            {
              name = "setTexture",
              summary = "Apply a Texture to the Model.",
              description = "Apply a Texture to the Model.",
              key = "Model:setTexture",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The texture to apply to the Model."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Shader",
          summary = "A GLSL program used for low-level control over rendering.",
          description = "Shaders are GLSL programs that transform the way vertices and pixels show up on the screen. They can be used for lighting, postprocessing, particles, animation, and much more.  You can use `lovr.graphics.setShader` to change the active Shader.",
          key = "Shader",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newShader"
          },
          notes = "The current GLSL version used is 150.\n\nThe default vertex shader:\n\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      return projection * transform * vertex;\n    }\n\nThe default fragment shader:\n\n    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {\n      return graphicsColor * texture(image, uv);\n    }\n\nAdditionally, the following headers are prepended to the shader source, giving you convenient access to a default set of uniform variables and vertex attributes.\n\nVertex shader header:\n\n    uniform mat4 lovrTransform;\n    uniform mat4 lovrNormalMatrix;\n    uniform mat4 lovrProjection;\n    in vec3 lovrPosition;\n    in vec3 lovrNormal;\n    in vec2 lovrTexCoord;\n    out vec2 texCoord;\n\nFragment shader header:\n\n    uniform vec4 lovrColor;\n    uniform sampler2D lovrTexture;\n    in vec2 texCoord;\n    in vec4 gl_FragCoord;\n    out vec4 lovrFragColor;",
          methods = {
            {
              name = "send",
              summary = "Update a uniform variable in the Shader.",
              description = "Update a uniform variable in the Shader.",
              key = "Shader:send",
              module = "lovr.graphics",
              notes = "The shader does not need to be active to update its uniforms.  However, the types must match up. Uniform variables declared as `float`s must be sent a single number, whereas uniforms declared as `vec4`s must be sent a table containing 4 numbers, etc.\n\nAn error is thrown if the uniform does not exist or is not used in the shader.",
              variants = {
                {
                  arguments = {
                    {
                      name = "uniform",
                      type = "string",
                      description = "The name of the uniform to update."
                    },
                    {
                      name = "value",
                      type = "*",
                      description = "The new value of the uniform."
                    }
                  },
                  returns = {}
                }
              },
              examples = {
                {
                  description = "Updating a `vec3` uniform:",
                  code = "function lovr.load()\n  shader = lovr.graphics.newShader [[\n    uniform vec3 offset;\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      vertex.xyz += offset;\n      return projection * transform * vertex;\n    }\n  ]]\n\n  shader:send('offset', { .3, .7, 0 })\nend"
                }
              }
            }
          },
          examples = {
            {
              description = "Set a simple shader that colors pixels based on vertex normals.",
              code = "function lovr.load()\n  lovr.graphics.setShader(lovr.graphics.newShader([[\n    out vec3 vNormal; // This gets passed to the fragment shader\n\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      vNormal = lovrNormal;\n      return projection * transform * vertex;\n    }\n  ]], [[\n    in vec3 vNormal; // This gets passed from the vertex shader\n\n    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {\n      return vec4(vNormal * .5 + .5, 1.0);\n    }\n  ]]))\n\n  model = lovr.graphics.newModel('model.fbx')\nend\n\nfunction lovr.draw()\n  model:draw(x, y, z, 1)\nend"
            }
          }
        },
        {
          name = "Skybox",
          summary = "A cube wrapped around the camera, used as a 3D background.",
          description = "A Skybox is a collection of six images used to apply a background to a three dimensional scene. Each image is used to texture the face of a cube, and the cube is drawn around the camera, giving an illusion of a 360-degree background.",
          key = "Skybox",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newSkybox"
          },
          notes = "To prevent problems with the depth test, make sure you draw Skyboxes before drawing other things, or disable the depth test while drawing them.",
          methods = {
            {
              name = "draw",
              summary = "Draw the Skybox.",
              description = "Draws the Skybox at a specified angle.",
              key = "Skybox:draw",
              module = "lovr.graphics",
              notes = "To prevent problems with the depth test, make sure you draw Skyboxes before drawing other things, or disable the depth test while drawing them.",
              variants = {
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians to rotate the skybox around its axis of rotation"
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          examples = {
            {
              description = "Drawing a Skybox in VR:",
              code = "function lovr.load()\n  skybox = lovr.graphics.newSkybox({\n    '1.png',\n    '2.png',\n    '3.png',\n    '4.png',\n    '5.png',\n    '6.png'\n  })\nend\n\nfunction lovr.draw()\n  lovr.graphics.setColor(255, 255, 255)\n  skybox:draw(lovr.headset.getOrientation())\n\n  -- Draw everything else\nend"
            }
          }
        },
        {
          name = "Texture",
          summary = "An image that can be applied to Meshes and Models.",
          description = "A Texture is an image that can be applied to `Model`s and `Mesh`s.  Supported file formats include `.png`, `.jpg`, `.tga`, and `.bmp`.",
          key = "Texture",
          module = "lovr.graphics",
          methods = {
            {
              name = "getDimensions",
              summary = "Get the dimensions of the Texture.",
              description = "Returns the dimensions of the Texture.",
              key = "Texture:getDimensions",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the Texture, in pixels."
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the Texture, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getFilter",
              summary = "Get the FilterMode for the Texture.",
              description = "Returns the current FilterMode for the Texture.",
              key = "Texture:getFilter",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "min",
                      type = "FilterMode",
                      description = "The filter mode used for minification."
                    },
                    {
                      name = "mag",
                      type = "FilterMode",
                      description = "The filter mode used for magnification."
                    }
                  }
                }
              }
            },
            {
              name = "getHeight",
              summary = "Get the height of the Texture.",
              description = "Returns the height of the Texture.",
              key = "Texture:getHeight",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the Texture, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getWidth",
              summary = "Get the width of the Texture.",
              description = "Returns the width of the Texture.",
              key = "Texture:getWidth",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the Texture, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getWrap",
              summary = "Get the WrapMode for the Texture.",
              description = "Returns the current WrapMode for the Texture.",
              key = "Texture:getWrap",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "horizontal",
                      type = "WrapMode",
                      description = "How the texture wraps horizontally."
                    },
                    {
                      name = "vertical",
                      type = "WrapMode",
                      description = "How the texture wraps vertically."
                    }
                  }
                }
              }
            },
            {
              name = "renderTo",
              summary = "Render to a Texture.",
              description = "Renders to a Texture using a function.  The Texture must be created as a framebuffer by passing a width and height to `lovr.graphics.newTexture` instead of a filename.",
              key = "Texture:renderTo",
              module = "lovr.graphics",
              notes = "Make sure you clear the contents of the Texture before rendering to it to clear any previous contents.",
              variants = {
                {
                  arguments = {
                    {
                      name = "callback",
                      type = "function",
                      description = "A function that calls drawing commands to render to the Texture."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setFilter",
              summary = "Set the FilterMode for the Texture.",
              description = "Sets the `FilterMode` used by the texture when upsampling or downsampling.  The default mode is `linear`.",
              key = "Texture:setFilter",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "min",
                      type = "FilterMode",
                      description = "The filter mode used for minification."
                    },
                    {
                      name = "mag",
                      type = "FilterMode",
                      description = "The filter mode used for magnification.",
                      default = "min"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setWrap",
              summary = "Set the WrapMode for the Texture.",
              description = "Sets the wrap mode of a texture.  The wrap mode controls how the texture is sampled when texture coordinates lie outside the usual 0 - 1 range.  The default for both directions is `repeat`.",
              key = "Texture:setWrap",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "horizontal",
                      type = "WrapMode",
                      description = "How the texture should wrap horizontally."
                    },
                    {
                      name = "vertical",
                      type = "WrapMode",
                      description = "How the texture should wrap vertically.",
                      default = "horizontal"
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          constructors = {
            "lovr.graphics.newTexture"
          }
        }
      }
    },
    {
      name = "headset",
      tag = "modules",
      summary = "Connects to VR hardware.",
      description = "The `lovr.headset` module is where all the magical VR functionality is.  With it, you can access connected VR hardware and get information about the available space the player has.  Note that all units are reported in meters.  Position `(0, 0, 0)` is the center of the play area.",
      key = "lovr.headset",
      sections = {
        {
          name = "Headset",
          tag = "headset",
          description = "Functions that return information about the head mounted display (HMD) currently strapped to the player's face."
        },
        {
          name = "Play area",
          tag = "playArea",
          description = "Retrieve information about the size and shape of the room the player is in, and provides information about the \"chaperone\", a visual indicator that appears whenever a player is about to run into a wall."
        },
        {
          name = "Controllers",
          tag = "controllers",
          description = "Get a list of connected `Controller`s.  Also see `lovr.controlleradded` and `lovr.controllerremoved`."
        }
      },
      enums = {
        {
          name = "ControllerAxis",
          description = "Axes on a Controller.",
          key = "ControllerAxis",
          module = "headset",
          values = {
            {
              name = "trigger",
              description = "The trigger."
            },
            {
              name = "touchx",
              description = "The x axis of the touchpad.  Positive values are to the right."
            },
            {
              name = "touchy",
              description = "The y axis of the touchpad.  Positive values are upwards."
            }
          }
        },
        {
          name = "ControllerButton",
          description = "Buttons on a Controller.",
          key = "ControllerButton",
          module = "headset",
          values = {
            {
              name = "system",
              description = "The system button."
            },
            {
              name = "menu",
              description = "The menu button."
            },
            {
              name = "grip",
              description = "The grip button."
            },
            {
              name = "touchpad",
              description = "The button on the touchpad."
            }
          }
        },
        {
          name = "HeadsetEye",
          summary = "The two different eyes.",
          description = "Represents either the left eye or the right eye.",
          key = "HeadsetEye",
          module = "headset",
          values = {
            {
              name = "left",
              description = "The left eye."
            },
            {
              name = "right",
              description = "The right eye."
            }
          }
        }
      },
      functions = {
        {
          name = "getAngularVelocity",
          tag = "headset",
          summary = "Get the angular velocity of the headset.",
          description = "Returns the current angular velocity of the headset.",
          key = "lovr.headset.getAngularVelocity",
          module = "lovr.headset",
          related = {
            "lovr.headset.getOrientation",
            "lovr.headset.getVelocity",
            "lovr.headset.getPosition"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x component of the angular velocity."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y component of the angular velocity."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z component of the angular velocity."
                }
              }
            }
          }
        },
        {
          name = "getBoundsDepth",
          tag = "playArea",
          summary = "Get the depth of the play area.",
          description = "Returns the depth of the play area, in meters.",
          key = "lovr.headset.getBoundsDepth",
          module = "lovr.headset",
          related = {
            "lovr.headset.getBoundsWidth",
            "lovr.headset.getBoundsDimensions"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "depth",
                  type = "number",
                  description = "The depth of the play area, in meters."
                }
              }
            }
          }
        },
        {
          name = "getBoundsDimensions",
          tag = "playArea",
          summary = "Get the size of the play area.",
          description = "Returns the size of the play area, in meters.",
          key = "lovr.headset.getBoundsDimensions",
          module = "lovr.headset",
          related = {
            "lovr.headset.getBoundsWidth",
            "lovr.headset.getBoundsDepth"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the play area, in meters."
                },
                {
                  name = "depth",
                  type = "number",
                  description = "The depth of the play area, in meters."
                }
              }
            }
          }
        },
        {
          name = "getBoundsGeometry",
          tag = "playArea",
          summary = "Get a list of points that make up the play area boundary.",
          description = "Returns a list of points representing the boundaries of the play area.",
          key = "lovr.headset.getBoundsGeometry",
          module = "lovr.headset",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "points",
                  type = "table",
                  description = "A list of points representing the play area.  Each point is a table consisting of an x, y, and z coordinate."
                }
              }
            }
          }
        },
        {
          name = "getBoundsWidth",
          tag = "playArea",
          summary = "Get the width of the play area.",
          description = "Returns the width of the play area, in meters.",
          key = "lovr.headset.getBoundsWidth",
          module = "lovr.headset",
          related = {
            "lovr.headset.getBoundsDepth",
            "lovr.headset.getBoundsDimensions"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the play area, in meters."
                }
              }
            }
          }
        },
        {
          name = "getClipDistance",
          tag = "headset",
          summary = "Get the near and far clipping planes of the headset.",
          description = "Returns the near and far clipping planes used to render to the headset.  Objects closer than the near clipping plane or further than the far clipping plane will be clipped out of view.",
          key = "lovr.headset.getClipDistance",
          module = "lovr.headset",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "near",
                  type = "number",
                  description = "The distance to the near clipping plane, in meters."
                },
                {
                  name = "far",
                  type = "number",
                  description = "The distance to the far clipping plane, in meters."
                }
              }
            }
          }
        },
        {
          name = "getControllerCount",
          tag = "controllers",
          summary = "Get the number of currently connected controller objects.",
          description = "Returns the number of currently connected controllers.",
          key = "lovr.headset.getControllerCount",
          module = "lovr.headset",
          related = {
            "lovr.headset.getControllers"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "count",
                  type = "number",
                  description = "The number of currently connected controllers."
                }
              }
            }
          }
        },
        {
          name = "getControllers",
          tag = "controllers",
          summary = "Get a list of currently connected controller objects.",
          description = "Returns a list of currently connected controllers.",
          key = "lovr.headset.getControllers",
          module = "lovr.headset",
          related = {
            "lovr.headset.getControllerCount"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "controllers",
                  type = "table",
                  description = "A list of Controller objects."
                }
              }
            }
          }
        },
        {
          name = "getDisplayDimensions",
          tag = "headset",
          summary = "Get the dimensions of the headset display.",
          description = "Returns the dimensions of the display for each lens of the headset, in pixels.",
          key = "lovr.headset.getDisplayDimensions",
          module = "lovr.headset",
          related = {
            "lovr.headset.getDisplayWidth",
            "lovr.headset.getDisplayHeight"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of each lens."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of each lens."
                }
              }
            }
          }
        },
        {
          name = "getDisplayHeight",
          tag = "headset",
          summary = "Get the height of the headset display.",
          description = "Returns the height of the display for each lens of the headset, in pixels.",
          key = "lovr.headset.getDisplayHeight",
          module = "lovr.headset",
          related = {
            "lovr.headset.getDisplayWidth",
            "lovr.headset.getDisplayDimensions"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "height",
                  type = "number",
                  description = "The height of each lens."
                }
              }
            }
          }
        },
        {
          name = "getDisplayWidth",
          tag = "headset",
          summary = "Get the width of the headset display.",
          description = "Returns the width of the display for each lens of the headset, in pixels.",
          key = "lovr.headset.getDisplayWidth",
          module = "lovr.headset",
          related = {
            "lovr.headset.getDisplayHeight",
            "lovr.headset.getDisplayDimensions"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of each lens."
                }
              }
            }
          }
        },
        {
          name = "getEyePosition",
          tag = "headset",
          summary = "Get the position of an eye.",
          description = "Returns the current position of one of the eyes in 3D space.",
          key = "lovr.headset.getEyePosition",
          module = "lovr.headset",
          related = {
            "lovr.headset.getPosition"
          },
          variants = {
            {
              arguments = {
                {
                  name = "eye",
                  type = "HeadsetEye",
                  description = "The eye to get the position of."
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the eye."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the eye."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the eye."
                }
              }
            }
          }
        },
        {
          name = "getOrientation",
          tag = "headset",
          summary = "Get the orientation of the headset.",
          description = "Returns the current orientation of the headset.",
          key = "lovr.headset.getOrientation",
          module = "lovr.headset",
          related = {
            "lovr.headset.getPosition",
            "lovr.headset.getVelocity",
            "lovr.headset.getAngularVelocity"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians the headset is rotated around its axis of rotation."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation."
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation."
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation."
                }
              }
            }
          }
        },
        {
          name = "getPosition",
          tag = "headset",
          summary = "Get the position of the headset.",
          description = "Returns the current position of the headset.",
          key = "lovr.headset.getPosition",
          module = "lovr.headset",
          related = {
            "lovr.headset.getOrientation",
            "lovr.headset.getVelocity",
            "lovr.headset.getAngularVelocity"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the headset."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the headset."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the headset."
                }
              }
            }
          }
        },
        {
          name = "getType",
          tag = "headset",
          summary = "Get the type of connected headset.",
          description = "Get the type of headset.  Currently only the HTC Vive is supported, though support for the Oculus Rift and other devices is planned.",
          key = "lovr.headset.getType",
          module = "lovr.headset",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "type",
                  type = "string",
                  description = "The type of the headset as a string, e.g. \"Vive\" for the HTC Vive."
                }
              }
            }
          }
        },
        {
          name = "getVelocity",
          tag = "headset",
          summary = "Get the linear velocity of the headset.",
          description = "Returns the current linear velocity of the headset, in meters per second",
          key = "lovr.headset.getVelocity",
          module = "lovr.headset",
          related = {
            "lovr.headset.getPosition",
            "lovr.headset.getOrientation",
            "lovr.headset.getAngularVelocity"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "vx",
                  type = "number",
                  description = "The x component of the linear velocity."
                },
                {
                  name = "vy",
                  type = "number",
                  description = "The y component of the linear velocity."
                },
                {
                  name = "vz",
                  type = "number",
                  description = "The z component of the linear velocity."
                }
              }
            }
          }
        },
        {
          name = "isMirrored",
          tag = "headset",
          summary = "Check if the headset is mirrored to the desktop.",
          description = "Returns whether or not the headset display is mirrored to the desktop window.",
          key = "lovr.headset.isMirrored",
          module = "lovr.headset",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "mirrored",
                  type = "boolean",
                  description = "Whether or not the headset is mirrored to the desktop."
                }
              }
            }
          }
        },
        {
          name = "isPresent",
          tag = "headset",
          summary = "Get whether or not a headset is connected.",
          description = "Determine if a headset is present and ready to use.",
          key = "lovr.headset.isPresent",
          module = "lovr.headset",
          related = {
            "Controller:isPresent"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "isPresent",
                  type = "boolean",
                  description = "Whether or not a headset is present."
                }
              }
            }
          }
        },
        {
          name = "renderTo",
          tag = "headset",
          summary = "Render to the headset using a function.",
          description = "Renders to each eye of the headset using a function.\n\nThis function takes care of setting the appropriate graphics transformations to ensure that the scene is rendered as though it is being viewed through each eye of the player.  It also takes care of setting the correct projection for the headset lenses.\n\nIf the headset module is enabled, this function is called automatically by `lovr.step` with `lovr.draw` as the callback.",
          key = "lovr.headset.renderTo",
          module = "lovr.headset",
          variants = {
            {
              arguments = {
                {
                  name = "callback",
                  type = "function",
                  description = "The function used to render.  It will be passed a string representing the current eye that is being rendered to, either \"left\" or \"right\".",
                  arguments = {
                    {
                      name = "eye",
                      type = "HeadsetEye"
                    }
                  },
                  returns = {}
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setClipDistance",
          tag = "headset",
          summary = "Set the near and far clipping planes of the headset.",
          description = "Sets the near and far clipping planes used to render to the headset.  Objects closer than the near clipping plane or further than the far clipping plane will be clipped out of view.",
          key = "lovr.headset.setClipDistance",
          module = "lovr.headset",
          variants = {
            {
              arguments = {
                {
                  name = "near",
                  type = "number",
                  description = "The distance to the near clipping plane, in meters."
                },
                {
                  name = "far",
                  type = "number",
                  description = "The distance to the far clipping plane, in meters."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setMirrored",
          tag = "headset",
          summary = "Set whether the headset is mirrored to the desktop.",
          description = "Returns whether or not the headset display is mirrored to the desktop window.",
          key = "lovr.headset.setMirrored",
          module = "lovr.headset",
          variants = {
            {
              arguments = {
                {
                  name = "mirror",
                  type = "boolean",
                  description = "Whether or not the headset should be mirrored to the desktop."
                }
              },
              returns = {}
            }
          }
        }
      },
      objects = {
        {
          name = "Controller",
          summary = "An object used to interact with connected VR controllers.",
          description = "Controller objects represent the controllers held in players' hands.  To obtain a list of currently connected controllers, use `lovr.headset.getControllers`.  To determine when controllers are added and removed, use `lovr.controlleradded` and `lovr.controllerremoved`. Often Controllers won't be considered \"active\" until they are moved around a bit.",
          key = "Controller",
          module = "lovr.headset",
          examples = {
            {
              description = "Draw cubes for the controllers and vibrate them if the trigger is pressed.",
              code = "function lovr.update(dt)\n  for i, controller in ipairs(lovr.headset.getControllers()) do\n    if controller:getAxis('trigger') > .9 then\n      controller:vibrate(.004)\n    end\n  end\nend\n\nfunction lovr.draw()\n  for i, controller in ipairs(lovr.headset.getControllers()) do\n    local x, y, z = controller:getPosition()\n    local angle, ax, ay, az = controller:getOrientation()\n    lovr.graphics.cube('fill', x, y, z, .08, angle, ax, ay, az)\n  end\nend"
            }
          },
          methods = {
            {
              name = "getAxis",
              summary = "Get the state of an axis on the Controller.",
              description = "Get the current state of an axis on the Controller.  Axis values are from 0 to 1.",
              key = "Controller:getAxis",
              module = "lovr.headset",
              related = {
                "ControllerAxis",
                "Controller:isDown"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "axis",
                      type = "ControllerAxis",
                      description = "The axis to query."
                    }
                  },
                  returns = {
                    {
                      name = "value",
                      type = "number",
                      description = "The current state of the axis."
                    }
                  }
                }
              }
            },
            {
              name = "getOrientation",
              summary = "Get the orientation of the Controller.",
              description = "Returns the current orientation of the Controller.",
              key = "Controller:getOrientation",
              module = "lovr.headset",
              related = {
                "lovr.headset.getOrientation",
                "Controller:getPosition"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Controller is rotated around its axis of rotation."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation."
                    }
                  }
                }
              }
            },
            {
              name = "getPosition",
              summary = "Get the position of the Controller.",
              description = "Returns the current position of the Controller.",
              key = "Controller:getPosition",
              module = "lovr.headset",
              related = {
                "lovr.headset.getPosition",
                "Controller:getOrientation"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Controller."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the Controller."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the Controller."
                    }
                  }
                }
              },
              notes = "Units are in meters."
            },
            {
              name = "isDown",
              summary = "Get the state of a button on the Controller.",
              description = "Check if a button on the Controller is currently pressed.",
              key = "Controller:isDown",
              module = "lovr.headset",
              related = {
                "ControllerButton",
                "Controller:getAxis"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "button",
                      type = "ControllerButton",
                      description = "The button to query."
                    }
                  },
                  returns = {
                    {
                      name = "down",
                      type = "boolean",
                      description = "The current state of the button."
                    }
                  }
                }
              }
            },
            {
              name = "isPresent",
              summary = "Determine if the Controller is still connected.",
              description = "Determine if the Controller is still connected.",
              key = "Controller:isPresent",
              module = "lovr.headset",
              related = {
                "lovr.headset.isPresent"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "isPresent",
                      type = "boolean",
                      description = "Whether or not the Controller is connected."
                    }
                  }
                }
              }
            },
            {
              name = "newModel",
              summary = "Get a Model for the Controller.",
              description = "Returns a new Model for the Controller.",
              key = "Controller:newModel",
              module = "lovr.headset",
              notes = "The Model will have a Texture applied.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "model",
                      type = "Model",
                      description = "The new Model, or nil if a model could not be loaded."
                    }
                  }
                }
              },
              examples = {
                {
                  code = "local models = {}\n\nfunction lovr.draw()\n  for _, controller in ipairs(lovr.headset.getControllers()) do\n    local x, y, z = controller:getPosition()\n    local angle, ax, ay, az = controller:getOrientation()\n    models[controller] = models[controller] or controller:newModel()\n    models[controller]:draw(x, y, z, 1, angle, ax, ay, az)\n  end\nend"
                }
              }
            },
            {
              name = "vibrate",
              summary = "Make the Controller go BZZZ!",
              description = "Causes the Controller to vibrate for a specified duration.",
              key = "Controller:vibrate",
              module = "lovr.headset",
              notes = "On the HTC Vive, the value for the `duration` currently must be less than .004 seconds.  Call this function several frames in a row for stronger or prolonged vibration patterns.",
              variants = {
                {
                  arguments = {
                    {
                      name = "duration",
                      type = "number",
                      description = "The amount of time to vibrate the Controller, in seconds."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        }
      }
    },
    {
      name = "math",
      tag = "modules",
      summary = "Contains useful math helpers.",
      description = "The `lovr.math` module provides math helpers commonly used for 3D applications.  Currently, only `Transform` objects are exposed.",
      key = "lovr.math",
      functions = {
        {
          name = "newTransform",
          summary = "Create a new Transform.",
          description = "A transform is a 4x4, column major matrix that can be used to represent the 3D transform of an object.  Most graphics primitives accept a Transform instead of the usual coordinate arguments. Transforms provide a convenient way to represent translation, rotation, and scale in a single object.",
          key = "lovr.math.newTransform",
          module = "lovr.math",
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the Transform."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The x position of the Transform."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The x position of the Transform."
                },
                {
                  name = "sx",
                  type = "number",
                  description = "The x scale of the Transform."
                },
                {
                  name = "sy",
                  type = "number",
                  description = "The y scale of the Transform."
                },
                {
                  name = "sz",
                  type = "number",
                  description = "The z scale of the Transform."
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians the Transform is rotated around its axis of rotation."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the axis of rotation."
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the axis of rotation."
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the axis of rotation."
                }
              },
              returns = {
                {
                  name = "transform",
                  type = "Transform",
                  description = "The new Transform."
                }
              }
            }
          }
        }
      },
      enums = {},
      objects = {
        {
          name = "Transform",
          summary = "A 3D transform.",
          description = "A Transform represents a translation, rotation, and scale in 3D space.  They're commonly used to describe how entities are arranged in a scene or how a camera is positioned.",
          key = "Transform",
          module = "lovr.math",
          methods = {
            {
              name = "apply",
              summary = "Combine two Transforms.",
              description = "Applies a Transform onto this Transform.",
              key = "Transform:apply",
              module = "lovr.math",
              variants = {
                {
                  arguments = {
                    {
                      name = "other",
                      type = "Transform",
                      description = "Combine two Transforms together.  Order matters, so applying Transforms in different orders will yield different results."
                    }
                  },
                  returns = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The original Transform."
                    }
                  }
                }
              }
            },
            {
              name = "clone",
              summary = "Clone the Transform.",
              description = "Returns a copy of the Transform.",
              key = "Transform:clone",
              module = "lovr.math",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "copy",
                      type = "Transform",
                      description = "The copy of the original."
                    }
                  }
                }
              }
            },
            {
              name = "inverse",
              summary = "Get the inverse of the Transform.",
              description = "Returns a new Transform representing the inverse of the original.  The inverse \"cancels out\" the effects of the original, so applying one onto the other will result in the origin.",
              key = "Transform:inverse",
              module = "lovr.math",
              related = {
                "Transform:inverseTransformPoint"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "inverse",
                      type = "Transform",
                      description = "The inverse transform."
                    }
                  }
                }
              }
            },
            {
              name = "inverseTransformPoint",
              summary = "Apply the inverse of the Transform to a point.",
              description = "Applies the inverse of the Transform to a point, returning the transformed point.",
              key = "Transform:inverseTransformPoint",
              module = "lovr.math",
              related = {
                "Transform:transformPoint"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the point."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the point."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the point."
                    }
                  },
                  returns = {
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the transformed point."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the transformed point."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the transformed point."
                    }
                  }
                }
              }
            },
            {
              name = "origin",
              summary = "Reset the Transform.",
              description = "Resets the Transform to the origin.",
              key = "Transform:origin",
              module = "lovr.math",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The original Transform."
                    }
                  }
                }
              },
              examples = {
                {
                  code = "transform = lovr.math.newTransform(3, 4, 5)\nprint(transform:transformPoint(1, 2, 2)) -- Prints 4, 6, 7\ntransform:origin()\nprint(transform:transformPoint(1, 2, 3)) -- Prints 1, 2, 3"
                }
              }
            },
            {
              name = "rotate",
              summary = "Rotate the Transform.",
              description = "Rotates the Transform using an angle/axis rotation.",
              key = "Transform:rotate",
              module = "lovr.math",
              variants = {
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians to rotate around the axis of rotation."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation."
                    }
                  },
                  returns = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The original Transform."
                    }
                  }
                }
              }
            },
            {
              name = "scale",
              summary = "Scale the Transform.",
              description = "Scales the Transform.",
              key = "Transform:scale",
              module = "lovr.math",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The scale factor for the x axis."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The scale factor for the y axis.",
                      default = "x"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The scale factor for the z axis.",
                      default = "x"
                    }
                  },
                  returns = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The original Transform."
                    }
                  }
                }
              }
            },
            {
              name = "setTransformation",
              summary = "Set the position, rotation, and scale of the Transform.",
              description = "Sets the translation, rotation, and scale of the Transform.  This will override the current values in the Transform.",
              key = "Transform:setTransformation",
              module = "lovr.math",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Transform."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The x position of the Transform."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The x position of the Transform."
                    },
                    {
                      name = "sx",
                      type = "number",
                      description = "The x scale of the Transform."
                    },
                    {
                      name = "sy",
                      type = "number",
                      description = "The y scale of the Transform."
                    },
                    {
                      name = "sz",
                      type = "number",
                      description = "The z scale of the Transform."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Transform is rotated around its axis of rotation."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation."
                    }
                  },
                  returns = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The original Transform."
                    }
                  }
                }
              }
            },
            {
              name = "transformPoint",
              summary = "Apply the Transform to a point.",
              description = "Applies the Transform to a point, returning the new position.",
              key = "Transform:transformPoint",
              module = "lovr.math",
              related = {
                "Transform:inverseTransformPoint"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the point."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the point."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the point."
                    }
                  },
                  returns = {
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the transformed point."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the transformed point."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the transformed point."
                    }
                  }
                }
              }
            },
            {
              name = "translate",
              summary = "Translate the Transform.",
              description = "Translates the Transform.",
              key = "Transform:translate",
              module = "lovr.math",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the translation."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the translation."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the translation."
                    }
                  },
                  returns = {
                    {
                      name = "transform",
                      type = "Transform",
                      description = "The original Transform."
                    }
                  }
                }
              }
            }
          },
          constructors = {
            "lovr.math.newTransform"
          }
        }
      }
    },
    {
      name = "physics",
      tag = "modules",
      summary = "Simulates 3D physics.",
      description = "The `lovr.physics` module simulates 3D rigid body physics.",
      key = "lovr.physics",
      sections = {
        {
          name = "Worlds",
          tag = "world",
          description = "A physics World holds all of the colliders and joints in the simulation.  It must be updated every frame using `World:update`, during which it will move all the colliders and resolve collisions between them."
        },
        {
          name = "Colliders",
          tag = "colliders",
          description = "Colliders are objects that represent a single rigid body in the physics simulation. They can have forces applied to them and collide with other colliders."
        },
        {
          name = "Shapes",
          tag = "shapes",
          description = "Shapes are 3D physics shapes that can be attached to colliders.  Shapes define, well, the shape of a Collider and how it collides with other objects.  Without any Shapes, a collider wouldn't collide with anything.\n\nNormally, you don't need to create Shapes yourself, as there are convenience functions on the World that will create colliders with shapes already attached.  However, you can attach multiple Shapes to a collider to create more complicated objects, and sometimes it can be useful to access the individual Shapes on a collider."
        },
        {
          name = "Joints",
          tag = "joints",
          description = "Joints are objects that constrain the movement of colliders in various ways.  Joints are attached to two colliders when they're created and usually have a concept of an \"anchor\", which is where the Joint is attached to relative to the colliders.  Joints can be used to create all sorts of neat things like doors, drawers, buttons, levers, or pendulums."
        }
      },
      enums = {
        {
          name = "JointType",
          summary = "Types of physics joints.",
          description = "Represents the different types of physics Joints available.",
          key = "JointType",
          module = "physics",
          values = {
            {
              name = "ball",
              description = "A BallJoint."
            },
            {
              name = "distance",
              description = "A DistanceJoint."
            },
            {
              name = "hinge",
              description = "A HingeJoint."
            },
            {
              name = "slider",
              description = "A SliderJoint."
            }
          },
          related = {
            "Joint",
            "BallJoint",
            "DistanceJoint",
            "HingeJoint",
            "SliderJoint"
          }
        },
        {
          name = "ShapeType",
          summary = "Types of physics shapes.",
          description = "Represents the different types of physics Shapes available.",
          key = "ShapeType",
          module = "physics",
          values = {
            {
              name = "box",
              description = "A BoxShape."
            },
            {
              name = "capsule",
              description = "A CapsuleShape."
            },
            {
              name = "cylinder",
              description = "A CylinderShape."
            },
            {
              name = "sphere",
              description = "A SphereShape."
            }
          },
          related = {
            "Shape",
            "BoxShape",
            "CapsuleShape",
            "CylinderShape",
            "SphereShape"
          }
        }
      },
      functions = {
        {
          name = "newBallJoint",
          tag = "joints",
          summary = "Create a new BallJoint.",
          description = "Creates a new BallJoint.",
          key = "lovr.physics.newBallJoint",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "colliderA",
                  type = "Collider",
                  description = "The first collider to attach the Joint to."
                },
                {
                  name = "colliderB",
                  type = "Collider",
                  description = "The second collider to attach the Joint to."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the joint anchor point, in world coordinates."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the joint anchor point, in world coordinates."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the joint anchor point, in world coordinates."
                }
              },
              returns = {
                {
                  name = "ball",
                  type = "BallJoint",
                  description = "The new BallJoint."
                }
              }
            }
          },
          related = {
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newHingeJoint",
            "lovr.physics.newSliderJoint"
          },
          notes = "A ball joint is like a ball and socket between the two colliders.  It tries to keep the distance between the colliders and the anchor position the same, but does not constrain the angle between them."
        },
        {
          name = "newBoxShape",
          tag = "shapes",
          summary = "Create a new BoxShape.",
          description = "Creates a new BoxShape.",
          key = "lovr.physics.newBoxShape",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the box, in meters.",
                  default = "1"
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the box, in meters.",
                  default = "width"
                },
                {
                  name = "depth",
                  type = "number",
                  description = "The depth of the box, in meters.",
                  default = "width"
                }
              },
              returns = {
                {
                  name = "box",
                  type = "BoxShape",
                  description = "The new BoxShape."
                }
              }
            }
          },
          related = {
            "BoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newCylinderShape",
            "lovr.physics.newSphereShape"
          },
          notes = "A Shape can be attached to a Collider using `Collider:addShape`."
        },
        {
          name = "newCapsuleShape",
          tag = "shapes",
          summary = "Create a new CapsuleShape.",
          description = "Creates a new CapsuleShape.  Capsules are cylinders with hemispheres on each end.",
          key = "lovr.physics.newCapsuleShape",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the capsule, in meters.",
                  default = "1"
                },
                {
                  name = "length",
                  type = "number",
                  description = "The length of the capsule, not including the caps, in meters.",
                  default = "1"
                }
              },
              returns = {
                {
                  name = "capsule",
                  type = "CapsuleShape",
                  description = "The new CapsuleShape."
                }
              }
            }
          },
          related = {
            "CapsuleShape",
            "lovr.physics.newBoxShape",
            "lovr.physics.newCylinderShape",
            "lovr.physics.newSphereShape"
          },
          notes = "A Shape can be attached to a Collider using `Collider:addShape`."
        },
        {
          name = "newCylinderShape",
          tag = "shapes",
          summary = "Create a new CylinderShape.",
          description = "Creates a new CylinderShape.",
          key = "lovr.physics.newCylinderShape",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the cylinder, in meters.",
                  default = "1"
                },
                {
                  name = "length",
                  type = "number",
                  description = "The length of the cylinder, in meters.",
                  default = "1"
                }
              },
              returns = {
                {
                  name = "cylinder",
                  type = "CylinderShape",
                  description = "The new CylinderShape."
                }
              }
            }
          },
          related = {
            "CylinderShape",
            "lovr.physics.newBoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newSphereShape"
          },
          notes = "A Shape can be attached to a Collider using `Collider:addShape`."
        },
        {
          name = "newDistanceJoint",
          tag = "joints",
          summary = "Create a new DistanceJoint.",
          description = "Creates a new DistanceJoint.",
          key = "lovr.physics.newDistanceJoint",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "colliderA",
                  type = "Collider",
                  description = "The first collider to attach the Joint to."
                },
                {
                  name = "colliderB",
                  type = "Collider",
                  description = "The second collider to attach the Joint to."
                },
                {
                  name = "x1",
                  type = "number",
                  description = "The x position of the first anchor point, in world coordinates."
                },
                {
                  name = "y1",
                  type = "number",
                  description = "The y position of the first anchor point, in world coordinates."
                },
                {
                  name = "z1",
                  type = "number",
                  description = "The z position of the first anchor point, in world coordinates."
                },
                {
                  name = "x2",
                  type = "number",
                  description = "The x position of the second anchor point, in world coordinates."
                },
                {
                  name = "y2",
                  type = "number",
                  description = "The y position of the second anchor point, in world coordinates."
                },
                {
                  name = "z2",
                  type = "number",
                  description = "The z position of the second anchor point, in world coordinates."
                }
              },
              returns = {
                {
                  name = "joint",
                  type = "DistanceJoint",
                  description = "The new DistanceJoint."
                }
              }
            }
          },
          related = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newHingeJoint",
            "lovr.physics.newSliderJoint"
          },
          notes = "A distance joint tries to keep the two colliders a fixed distance apart.  The distance is determined by the initial distance between the anchor points.  The joint allows for rotation on the anchor points."
        },
        {
          name = "newHingeJoint",
          tag = "joints",
          summary = "Create a new HingeJoint.",
          description = "Creates a new HingeJoint.",
          key = "lovr.physics.newHingeJoint",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "colliderA",
                  type = "Collider",
                  description = "The first collider to attach the Joint to."
                },
                {
                  name = "colliderB",
                  type = "Collider",
                  description = "The second collider to attach the Joint to."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the hinge anchor, in world coordinates."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the hinge anchor, in world coordinates."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the hinge anchor, in world coordinates."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the hinge axis."
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the hinge axis."
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the hinge axis."
                }
              },
              returns = {
                {
                  name = "hinge",
                  type = "HingeJoint",
                  description = "The new HingeJoint."
                }
              }
            }
          },
          related = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newSliderJoint"
          },
          notes = "A hinge joint constrains two colliders to allow rotation only around the hinge's axis."
        },
        {
          name = "newSliderJoint",
          tag = "joints",
          summary = "Create a new SliderJoint.",
          description = "Creates a new SliderJoint.",
          key = "lovr.physics.newSliderJoint",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "colliderA",
                  type = "Collider",
                  description = "The first collider to attach the Joint to."
                },
                {
                  name = "colliderB",
                  type = "Collider",
                  description = "The second collider to attach the Joint to."
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the slider axis."
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the slider axis."
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the slider axis."
                }
              },
              returns = {
                {
                  name = "slider",
                  type = "SliderJoint",
                  description = "The new SliderJoint."
                }
              }
            }
          },
          related = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newHingeJoint"
          },
          notes = "A slider joint constrains two colliders to only allow movement along the slider's axis."
        },
        {
          name = "newSphereShape",
          tag = "shapes",
          summary = "Create a new SphereShape.",
          description = "Creates a new SphereShape.",
          key = "lovr.physics.newSphereShape",
          module = "lovr.physics",
          variants = {
            {
              arguments = {
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the sphere, in meters.",
                  default = "1"
                }
              },
              returns = {
                {
                  name = "sphere",
                  type = "SphereShape",
                  description = "The new SphereShape."
                }
              }
            }
          },
          related = {
            "SphereShape",
            "lovr.physics.newBoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newCylinderShape"
          },
          notes = "A Shape can be attached to a Collider using `Collider:addShape`."
        },
        {
          name = "newWorld",
          tag = "world",
          summary = "Create a new World.",
          description = "Creates a new physics World, which tracks the overall physics simulation, holds collider objects, and resolves collisions between them.",
          key = "lovr.physics.newWorld",
          module = "lovr.physics",
          notes = "A World must be updated with `World:update` in `lovr.update` for the physics simulation to advance.",
          variants = {
            {
              arguments = {
                {
                  name = "xg",
                  type = "number",
                  description = "The x component of the gravity force.",
                  default = "0"
                },
                {
                  name = "yg",
                  type = "number",
                  description = "The y component of the gravity force.",
                  default = "-9.81"
                },
                {
                  name = "zg",
                  type = "number",
                  description = "The z component of the gravity force.",
                  default = "0"
                },
                {
                  name = "allowSleep",
                  type = "boolean",
                  description = "Whether or not colliders will automatically be put to sleep.",
                  default = "true"
                },
                {
                  name = "tags",
                  type = "table",
                  description = "A list of collision tags colliders can be assigned to.",
                  default = "{}"
                }
              },
              returns = {
                {
                  name = "world",
                  type = "World",
                  description = "A whole new World."
                }
              }
            }
          },
          examples = {
            {
              description = "Create a new world, add a collider to it, and update it, printing out its position as it falls.",
              code = "function lovr.load()\n  world = lovr.physics.newWorld()\n  box = world:newBoxCollider()\nend\n\nfunction lovr.update(dt)\n  world:update(dt)\n  print(box:getPosition())\nend"
            }
          }
        }
      },
      objects = {
        {
          name = "BallJoint",
          summary = "A ball and socket joint.",
          description = "A BallJoint is a type of `Joint` that acts like a ball and socket between two colliders.  It allows the colliders to rotate freely around an anchor point, but does not allow the colliders' distance from the anchor point to change.",
          key = "BallJoint",
          module = "lovr.physics",
          related = {
            "Collider"
          },
          constructors = {
            "lovr.physics.newBallJoint"
          },
          methods = {
            {
              name = "getAnchors",
              summary = "Get the anchor points of the BallJoint.",
              description = "Returns the anchor points of the BallJoint, in world coordinates.  The first point is the anchor on the first collider, and the second point is on the second collider.  The joint tries to keep these points the same, but they may be different if the joint is forced apart by some other means.",
              key = "BallJoint:getAnchors",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x1",
                      type = "number",
                      description = "The x coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "y1",
                      type = "number",
                      description = "The y coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "z1",
                      type = "number",
                      description = "The z coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the second anchor point, in world coordinates."
                    }
                  }
                }
              }
            },
            {
              name = "setAnchor",
              summary = "Set the anchor point of the BallJoint.",
              description = "Sets a new anchor point for the BallJoint.",
              key = "BallJoint:setAnchor",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the anchor point, in world coordinates."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the anchor point, in world coordinates."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the anchor point, in world coordinates."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          extends = "Joint"
        },
        {
          name = "BoxShape",
          summary = "A box Shape.",
          description = "A type of `Shape` that can be used for cubes or boxes.",
          key = "BoxShape",
          module = "lovr.physics",
          extends = "Shape",
          constructors = {
            "lovr.physics.newBoxShape",
            "World:newBoxCollider"
          },
          methods = {
            {
              name = "getDimensions",
              summary = "Get the dimensions of the BoxShape.",
              description = "Returns the width, height, and depth of the BoxShape.",
              key = "BoxShape:getDimensions",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the box, in meters."
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the box, in meters."
                    },
                    {
                      name = "depth",
                      type = "number",
                      description = "The depth of the box, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "setDimensions",
              summary = "Set the dimensions of the BoxShape.",
              description = "Sets the width, height, and depth of the BoxShape.",
              key = "BoxShape:setDimensions",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the box, in meters."
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the box, in meters."
                    },
                    {
                      name = "depth",
                      type = "number",
                      description = "The depth of the box, in meters."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "CapsuleShape",
          summary = "A capsule Shape.",
          description = "A type of `Shape` that can be used for capsule-shaped things.",
          key = "CapsuleShape",
          module = "lovr.physics",
          extends = "Shape",
          constructors = {
            "lovr.physics.newCapsuleShape",
            "World:newCapsuleCollider"
          },
          methods = {
            {
              name = "getLength",
              summary = "Get the length of the CapsuleShape.",
              description = "Returns the length of the CapsuleShape, not including the caps.",
              key = "CapsuleShape:getLength",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the capsule, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "getRadius",
              summary = "Get the radius of the CapsuleShape.",
              description = "Returns the radius of the CapsuleShape.",
              key = "CapsuleShape:getRadius",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the capsule, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "setLength",
              summary = "Set the length of the CapsuleShape.",
              description = "Sets the length of the CapsuleShape.",
              key = "CapsuleShape:setLength",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "length",
                      type = "number",
                      description = "The new length, in meters, not including the caps."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setRadius",
              summary = "Set the radius of the CapsuleShape.",
              description = "Sets the radius of the CapsuleShape.",
              key = "CapsuleShape:setRadius",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The new radius, in meters."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Collider",
          summary = "A single entity in a physics simulation.",
          description = "Colliders are objects that represent a single rigid body in a physics simulation.  They can have forces applied to them and collide with other colliders.",
          key = "Collider",
          module = "lovr.physics",
          methods = {
            {
              name = "addShape",
              summary = "Add a Shape to the Collider.",
              description = "Attaches a Shape to the collider.  Attached shapes will collide with other shapes in the world.",
              key = "Collider:addShape",
              module = "lovr.physics",
              related = {
                "Collider:removeShape",
                "Collider:getShapeList",
                "Shape"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "shape",
                      type = "Shape",
                      description = "The Shape to attach."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "applyForce",
              summary = "Apply a force to the Collider.",
              description = "Applies a force to the Collider.",
              key = "Collider:applyForce",
              module = "lovr.physics",
              related = {
                "Collider:applyTorque"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the force to apply."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the force to apply."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the force to apply."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the force to apply."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the force to apply."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the force to apply."
                    },
                    {
                      name = "px",
                      type = "number",
                      description = "The x position to apply the force at, in world coordinates."
                    },
                    {
                      name = "py",
                      type = "number",
                      description = "The y position to apply the force at, in world coordinates."
                    },
                    {
                      name = "pz",
                      type = "number",
                      description = "The z position to apply the force at, in world coordinates."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "applyTorque",
              summary = "Apply torque to the Collider.",
              description = "Applies torque to the Collider.",
              key = "Collider:applyTorque",
              module = "lovr.physics",
              related = {
                "Collider:applyForce"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the torque."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the torque."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the torque."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "destroy",
              summary = "Destroy the Collider.",
              description = "Destroy the Collider, removing it from the World.",
              key = "Collider:destroy",
              module = "lovr.physics",
              related = {
                "World:destroy",
                "Shape:destroy",
                "Joint:destroy"
              },
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              notes = "Calling functions on the collider after destroying it is a bad idea."
            },
            {
              name = "getAABB",
              summary = "Get the Collider's axis aligned bounding box.",
              description = "Returns the bounding box for the Collider, computed from attached shapes.",
              key = "Collider:getAABB",
              module = "lovr.physics",
              related = {
                "Shape:getAABB"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "minx",
                      type = "number",
                      description = "The minimum x coordinate of the box."
                    },
                    {
                      name = "maxx",
                      type = "number",
                      description = "The maximum x coordinate of the box."
                    },
                    {
                      name = "miny",
                      type = "number",
                      description = "The minimum y coordinate of the box."
                    },
                    {
                      name = "maxy",
                      type = "number",
                      description = "The maximum y coordinate of the box."
                    },
                    {
                      name = "minz",
                      type = "number",
                      description = "The minimum z coordinate of the box."
                    },
                    {
                      name = "maxz",
                      type = "number",
                      description = "The maximum z coordinate of the box."
                    }
                  }
                }
              }
            },
            {
              name = "getAngularDamping",
              summary = "Get the angular damping of the Collider.",
              description = "Returns the angular damping of the Collider.  Angular damping makes things less \"spinny\", causing them them slow down their angular velocity over time.",
              key = "Collider:getAngularDamping",
              module = "lovr.physics",
              related = {
                "World:getAngularDamping",
                "World:setAngularDamping"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    }
                  }
                }
              },
              notes = "Angular damping can also be set on the World."
            },
            {
              name = "getAngularVelocity",
              summary = "Get the angular velocity of the Collider.",
              description = "Returns the angular velocity of the Collider.",
              key = "Collider:getAngularVelocity",
              module = "lovr.physics",
              related = {
                "Collider:getLinearVelocity",
                "Collider:setLinearVelocity",
                "Collider:applyTorque",
                "Collider:getOrientation",
                "Collider:setOrientation"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "vx",
                      type = "number",
                      description = "The x component of the angular velocity."
                    },
                    {
                      name = "vy",
                      type = "number",
                      description = "The y component of the angular velocity."
                    },
                    {
                      name = "vz",
                      type = "number",
                      description = "The z component of the angular velocity."
                    }
                  }
                }
              }
            },
            {
              name = "getFriction",
              summary = "Get the friction of the Collider.",
              description = "Returns the friction of the Collider.  By default, the friction of two Colliders is combined (multiplied) when they collide to generate a friction force.  The initial friction is 0.",
              key = "Collider:getFriction",
              module = "lovr.physics",
              related = {
                "Collider:getRestitution",
                "Collider:setRestitution",
                "World:collide"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "friction",
                      type = "number",
                      description = "The friction of the Collider."
                    }
                  }
                }
              }
            },
            {
              name = "getLinearDamping",
              summary = "Get the linear damping of the Collider.",
              description = "Returns the Collider's linear damping parameter.  Linear damping is similar to drag or air resistance, slowing the Collider down over time.",
              key = "Collider:getLinearDamping",
              module = "lovr.physics",
              related = {
                "World:getLinearDamping",
                "World:setLinearDamping"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    }
                  }
                }
              },
              notes = "A linear damping of 0 means the Collider won't slow down over time.\n\nLinear damping can also be set on the World using `World:setLinearDamping`, which will affect all new colliders."
            },
            {
              name = "getLinearVelocity",
              summary = "Get the linear velocity of the Collider.",
              description = "Returns the linear velocity of the Collider.  This is how fast the Collider is moving.  There is also angular velocity, which is how fast the Collider is spinning.",
              key = "Collider:getLinearVelocity",
              module = "lovr.physics",
              related = {
                "Collider:getLinearVelocityFromLocalPoint",
                "Collider:getLinearVelocityFromWorldPoint",
                "Collider:getAngularVelocity",
                "Collider:setAngularVelocity",
                "Collider:applyForce",
                "Collider:getPosition",
                "Collider:setPosition"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "vx",
                      type = "number",
                      description = "The x velocity of the Collider, in meters per second."
                    },
                    {
                      name = "vy",
                      type = "number",
                      description = "The y velocity of the Collider, in meters per second."
                    },
                    {
                      name = "vz",
                      type = "number",
                      description = "The z velocity of the Collider, in meters per second."
                    }
                  }
                }
              }
            },
            {
              name = "getLinearVelocityFromLocalPoint",
              summary = "Get the linear velocity of the Collider at a point.",
              description = "Returns the linear velocity of a point relative to the Collider.",
              key = "Collider:getLinearVelocityFromLocalPoint",
              module = "lovr.physics",
              related = {
                "Collider:getLinearVelocity",
                "Collider:getLinearVelocityFromWorldPoint"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate."
                    }
                  },
                  returns = {
                    {
                      name = "vx",
                      type = "number",
                      description = "The x component of the velocity of the point."
                    },
                    {
                      name = "vy",
                      type = "number",
                      description = "The y component of the velocity of the point."
                    },
                    {
                      name = "vz",
                      type = "number",
                      description = "The z component of the velocity of the point."
                    }
                  }
                }
              }
            },
            {
              name = "getLinearVelocityFromWorldPoint",
              summary = "Get the linear velocity of the Collider at a world space point.",
              description = "Returns the linear velocity of a point on the Collider specified in world space.",
              key = "Collider:getLinearVelocityFromWorldPoint",
              module = "lovr.physics",
              related = {
                "Collider:getLinearVelocity",
                "Collider:getLinearVelocityFromLocalPoint"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate in world space."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate in world space."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate in world space."
                    }
                  },
                  returns = {
                    {
                      name = "vx",
                      type = "number",
                      description = "The x component of the velocity of the point."
                    },
                    {
                      name = "vy",
                      type = "number",
                      description = "The y component of the velocity of the point."
                    },
                    {
                      name = "vz",
                      type = "number",
                      description = "The z component of the velocity of the point."
                    }
                  }
                }
              }
            },
            {
              name = "getLocalCenter",
              summary = "Get the Collider's center of mass.",
              description = "Returns the Collider's center of mass.",
              key = "Collider:getLocalCenter",
              module = "lovr.physics",
              related = {
                "Collider:getLocalPoint",
                "Collider:getMassData",
                "Collider:setMassData"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "cx",
                      type = "number",
                      description = "The x position of the center of mass."
                    },
                    {
                      name = "cy",
                      type = "number",
                      description = "The y position of the center of mass."
                    },
                    {
                      name = "cz",
                      type = "number",
                      description = "The z position of the center of mass."
                    }
                  }
                }
              }
            },
            {
              name = "getLocalPoint",
              summary = "Convert a point from world space to collider space.",
              description = "Converts a point from world coordinates into local coordinates relative to the Collider.",
              key = "Collider:getLocalPoint",
              module = "lovr.physics",
              related = {
                "Collider:getWorldPoint",
                "Collider:getLocalVector",
                "Collider:getWorldVector"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "wx",
                      type = "number",
                      description = "The x coordinate of the world point."
                    },
                    {
                      name = "wy",
                      type = "number",
                      description = "The y coordinate of the world point."
                    },
                    {
                      name = "wz",
                      type = "number",
                      description = "The z coordinate of the world point."
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the local-space point."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the local-space point."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the local-space point."
                    }
                  }
                }
              }
            },
            {
              name = "getLocalVector",
              summary = "Convert a vector from world space to local space.",
              description = "Converts a direction vector from world space to local space.",
              key = "Collider:getLocalVector",
              module = "lovr.physics",
              related = {
                "Collider:getWorldVector",
                "Collider:getLocalPoint",
                "Collider:getWorldPoint"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "wx",
                      type = "number",
                      description = "The x component of the world vector."
                    },
                    {
                      name = "wy",
                      type = "number",
                      description = "The y component of the world vector."
                    },
                    {
                      name = "wz",
                      type = "number",
                      description = "The z component of the world vector."
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the local vector."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the local vector."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the local vector."
                    }
                  }
                }
              }
            },
            {
              name = "getMass",
              summary = "Get the total mass of the Collider.",
              description = "Returns the total mass of the Collider.  The mass of a Collider depends on its attached shapes.",
              key = "Collider:getMass",
              module = "lovr.physics",
              related = {
                "Collider:getMassData",
                "Collider:setMassData",
                "Shape:getMass"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "mass",
                      type = "number",
                      description = "The mass of the Collider, in kilograms."
                    }
                  }
                }
              }
            },
            {
              name = "getMassData",
              summary = "Compute mass properties for the Collider.",
              description = "Computes mass properties for the Collider.",
              key = "Collider:getMassData",
              module = "lovr.physics",
              related = {
                "Collider:getMass",
                "Collider:setMass",
                "Shape:getMass"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "cx",
                      type = "number",
                      description = "The x position of the center of mass."
                    },
                    {
                      name = "cy",
                      type = "number",
                      description = "The y position of the center of mass."
                    },
                    {
                      name = "cz",
                      type = "number",
                      description = "The z position of the center of mass."
                    },
                    {
                      name = "mass",
                      type = "number",
                      description = "The computed mass of the Collider."
                    },
                    {
                      name = "inertia",
                      type = "table",
                      description = "A table containing 6 values of the rotational inertia tensor matrix.  The table contains the 3 diagonal elements of the matrix (upper left to bottom right), followed by the 3 elements of the upper right portion of the 3x3 matrix."
                    }
                  }
                }
              }
            },
            {
              name = "getOrientation",
              summary = "Get the orientation of the Collider.",
              description = "Returns the orientation of the Collider in angle/axis representation.",
              key = "Collider:getOrientation",
              module = "lovr.physics",
              related = {
                "Collider:applyTorque",
                "Collider:getAngularVelocity",
                "Collider:setAngularVelocity",
                "Collider:getPosition",
                "Collider:setPosition"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Collider is rotated around its axis of rotation."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation."
                    }
                  }
                }
              }
            },
            {
              name = "getPosition",
              summary = "Get the position of the Collider.",
              description = "Returns the position of the Collider.",
              key = "Collider:getPosition",
              module = "lovr.physics",
              related = {
                "Collider:applyForce",
                "Collider:getLinearVelocity",
                "Collider:setLinearVelocity",
                "Collider:getOrientation",
                "Collider:setOrientation"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Collider, in meters."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the Collider, in meters."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the Collider, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "getRestitution",
              summary = "Get the bounciness of the Collider.",
              description = "Returns the restitution (bounciness) of the Collider.  By default, the restitution of two Colliders is combined (the max is used) when they collide to cause them to bounce away from each other.  The initial restitution is 0.",
              key = "Collider:getRestitution",
              module = "lovr.physics",
              related = {
                "Collider:getFriction",
                "Collider:setFriction",
                "World:collide"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "restitution",
                      type = "number",
                      description = "The restitution of the Collider."
                    }
                  }
                }
              }
            },
            {
              name = "getShapeList",
              summary = "Get a list of Shapes attached to the Collider.",
              description = "Returns a list of Shapes attached to the Collider.",
              key = "Collider:getShapeList",
              module = "lovr.physics",
              related = {
                "Collider:addShape",
                "Collider:removeShape",
                "Shape"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "shapes",
                      type = "table",
                      description = "A list of Shapes attached to the Collider."
                    }
                  }
                }
              }
            },
            {
              name = "getTag",
              summary = "Get the Collider's tag.",
              description = "Returns the Collider's tag.",
              key = "Collider:getTag",
              module = "lovr.physics",
              related = {
                "World:disableCollisionBetween",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween",
                "lovr.physics.newWorld"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "tag",
                      type = "string",
                      description = "The Collider's collision tag."
                    }
                  }
                }
              },
              notes = "Collision between tags can be enabled and disabled using `World:enableCollisionBetween` and `World:disableCollisionBetween`."
            },
            {
              name = "getUserData",
              summary = "Get the Collider's user data.",
              description = "Returns the user data associated with the Collider.",
              key = "Collider:getUserData",
              module = "lovr.physics",
              notes = "User data can be useful to identify the Collider in callbacks.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "data",
                      type = "*",
                      description = "The custom value associated with the Collider."
                    }
                  }
                }
              }
            },
            {
              name = "getWorld",
              summary = "Get the World the Collider is in.",
              description = "Returns the World the Collider is in.",
              key = "Collider:getWorld",
              module = "lovr.physics",
              related = {
                "World"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "world",
                      type = "World",
                      description = "The World the Collider is in."
                    }
                  }
                }
              },
              notes = "Colliders can only be in one World at a time."
            },
            {
              name = "getWorldPoint",
              summary = "Convert a point from local space to world space.",
              description = "Convert a point relative to the collider to a point in world coordinates.",
              key = "Collider:getWorldPoint",
              module = "lovr.physics",
              related = {
                "Collider:getLocalPoint",
                "Collider:getLocalVector",
                "Collider:getWorldVector"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the point."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the point."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the point."
                    }
                  },
                  returns = {
                    {
                      name = "wx",
                      type = "number",
                      description = "The x coordinate of the world point."
                    },
                    {
                      name = "wy",
                      type = "number",
                      description = "The y coordinate of the world point."
                    },
                    {
                      name = "wz",
                      type = "number",
                      description = "The z coordinate of the world point."
                    }
                  }
                }
              }
            },
            {
              name = "getWorldVector",
              summary = "Convert a vector from local space to world space.",
              description = "Converts a direction vector from local space to world space.",
              key = "Collider:getWorldVector",
              module = "lovr.physics",
              related = {
                "Collider:getLocalVector",
                "Collider:getLocalPoint",
                "Collider:getWorldPoint"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the local vector."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the local vector."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the local vector."
                    }
                  },
                  returns = {
                    {
                      name = "wx",
                      type = "number",
                      description = "The x component of the world vector."
                    },
                    {
                      name = "wy",
                      type = "number",
                      description = "The y component of the world vector."
                    },
                    {
                      name = "wz",
                      type = "number",
                      description = "The z component of the world vector."
                    }
                  }
                }
              }
            },
            {
              name = "isAwake",
              summary = "Check if the Collider is awake.",
              description = "Returns whether the Collider is currently awake.",
              key = "Collider:isAwake",
              module = "lovr.physics",
              related = {
                "World:isSleepingAllowed",
                "World:setSleepingAllowed",
                "Collider:isSleepingAllowed",
                "Collider:setSleepingAllowed"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "awake",
                      type = "boolean",
                      description = "Whether the Collider is awake."
                    }
                  }
                }
              }
            },
            {
              name = "isGravityIgnored",
              summary = "Check if the Collider ignores gravity.",
              description = "Returns whether the Collider is currently ignoring gravity.",
              key = "Collider:isGravityIgnored",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "ignored",
                      type = "boolean",
                      description = "Whether gravity is ignored for this Collider."
                    }
                  }
                }
              }
            },
            {
              name = "isKinematic",
              summary = "Check if the Collider is kinematic.",
              description = "Returns whether the Collider is kinematic.",
              key = "Collider:isKinematic",
              module = "lovr.physics",
              notes = "Kinematic colliders behave as though they have infinite mass, ignoring external forces like gravity, joints, or collisions (though non-kinematic colliders will collide with them). They can be useful for static objects like floors or walls.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "kinematic",
                      type = "boolean",
                      description = "Whether the Collider is kinematic."
                    }
                  }
                }
              }
            },
            {
              name = "isSleepingAllowed",
              summary = "Check if the Collider is allowed to sleep.",
              description = "Returns whether the Collider is allowed to sleep.",
              key = "Collider:isSleepingAllowed",
              module = "lovr.physics",
              related = {
                "World:isSleepingAllowed",
                "World:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "allowed",
                      type = "boolean",
                      description = "Whether the Collider can go to sleep."
                    }
                  }
                }
              },
              notes = "If sleeping is enabled, the simulation will put the Collider to sleep if it hasn't moved in a while. Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nIt is possible to set the default value for new colliders using `World:setSleepingAllowed`.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`."
            },
            {
              name = "removeShape",
              summary = "Remove a Shape from the Collider.",
              description = "Removes a Shape from the Collider.",
              key = "Collider:removeShape",
              module = "lovr.physics",
              related = {
                "Collider:addShape",
                "Collider:getShapeList",
                "Shape"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "shape",
                      type = "Shape",
                      description = "The Shape to remove."
                    }
                  },
                  returns = {}
                }
              },
              notes = "Colliders without any shapes won't collide with anything."
            },
            {
              name = "setAngularDamping",
              summary = "Set the angular damping of the Collider.",
              description = "Sets the angular damping of the Collider.  Angular damping makes things less \"spinny\", causing them them slow down their angular velocity over time.",
              key = "Collider:setAngularDamping",
              module = "lovr.physics",
              related = {
                "World:getAngularDamping",
                "World:setAngularDamping"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    }
                  },
                  returns = {}
                }
              },
              notes = "Angular damping can also be set on the World."
            },
            {
              name = "setAngularVelocity",
              summary = "Set the angular velocity of the Collider.",
              description = "Sets the angular velocity of the Collider.",
              key = "Collider:setAngularVelocity",
              module = "lovr.physics",
              related = {
                "Collider:getLinearVelocity",
                "Collider:setLinearVelocity",
                "Collider:applyTorque",
                "Collider:getOrientation",
                "Collider:setOrientation"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "vx",
                      type = "number",
                      description = "The x component of the angular velocity."
                    },
                    {
                      name = "vy",
                      type = "number",
                      description = "The y component of the angular velocity."
                    },
                    {
                      name = "vz",
                      type = "number",
                      description = "The z component of the angular velocity."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setAwake",
              summary = "Put the Collider to sleep or wake it up.",
              description = "Manually puts the Collider to sleep or wakes it up.  You can do this if you know a Collider won't be touched for a while or if you need to it be active.",
              key = "Collider:setAwake",
              module = "lovr.physics",
              related = {
                "World:isSleepingAllowed",
                "World:setSleepingAllowed",
                "Collider:isSleepingAllowed",
                "Collider:setSleepingAllowed"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "awake",
                      type = "boolean",
                      description = "Whether the Collider should be awake."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setFriction",
              summary = "Set the friction of the Collider.",
              description = "Sets the friction of the Collider.  By default, the friction of two Colliders is combined (multiplied) when they collide to generate a friction force.  The initial friction is 0.",
              key = "Collider:setFriction",
              module = "lovr.physics",
              related = {
                "Collider:getRestitution",
                "Collider:setRestitution",
                "World:collide"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "friction",
                      type = "number",
                      description = "The new friction."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setGravityIgnored",
              summary = "Set whether the Collider ignores gravity.",
              description = "Sets whether the Collider should ignore gravity.",
              key = "Collider:setGravityIgnored",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "ignored",
                      type = "boolean",
                      description = "Whether gravity should be ignored."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setKinematic",
              summary = "Set whether the Collider is kinematic.",
              description = "Sets whether the Collider is kinematic.",
              key = "Collider:setKinematic",
              module = "lovr.physics",
              notes = "Kinematic colliders behave as though they have infinite mass, ignoring external forces like gravity, joints, or collisions (though non-kinematic colliders will collide with them). They can be useful for static objects like floors or walls.",
              variants = {
                {
                  arguments = {
                    {
                      name = "kinematic",
                      type = "boolean",
                      description = "Whether the Collider is kinematic."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLinearDamping",
              summary = "Set the linear damping of the Collider.",
              description = "Sets the Collider's linear damping parameter.  Linear damping is similar to drag or air resistance, slowing the Collider down over time.",
              key = "Collider:setLinearDamping",
              module = "lovr.physics",
              related = {
                "World:getLinearDamping",
                "World:setLinearDamping"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    }
                  },
                  returns = {}
                }
              },
              notes = "A linear damping of 0 means the Collider won't slow down over time.\n\nLinear damping can also be set on the World using `World:setLinearDamping`, which will affect all new colliders."
            },
            {
              name = "setLinearVelocity",
              summary = "Set the linear velocity of the Collider.",
              description = "Sets the linear velocity of the Collider directly.  Usually it's preferred to use `Collider:applyForce` to change velocity since instantaneous velocity changes can lead to weird glitches.",
              key = "Collider:setLinearVelocity",
              module = "lovr.physics",
              related = {
                "Collider:getLinearVelocityFromLocalPoint",
                "Collider:getLinearVelocityFromWorldPoint",
                "Collider:getAngularVelocity",
                "Collider:setAngularVelocity",
                "Collider:applyForce",
                "Collider:getPosition",
                "Collider:setPosition"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "vx",
                      type = "number",
                      description = "The x velocity of the Collider, in meters per second."
                    },
                    {
                      name = "vy",
                      type = "number",
                      description = "The y velocity of the Collider, in meters per second."
                    },
                    {
                      name = "vz",
                      type = "number",
                      description = "The z velocity of the Collider, in meters per second."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setMass",
              summary = "Set the total mass of the Collider.",
              description = "Sets the total mass of the Collider.",
              key = "Collider:setMass",
              module = "lovr.physics",
              related = {
                "Collider:getMassData",
                "Collider:setMassData",
                "Shape:getMass"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "mass",
                      type = "number",
                      description = "The new mass for the Collider, in kilograms."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setMassData",
              summary = "Set mass properties for the Collider.",
              description = "Sets mass properties for the Collider.",
              key = "Collider:setMassData",
              module = "lovr.physics",
              related = {
                "Collider:getMass",
                "Collider:setMass",
                "Shape:getMass"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "cx",
                      type = "number",
                      description = "The x position of the center of mass."
                    },
                    {
                      name = "cy",
                      type = "number",
                      description = "The y position of the center of mass."
                    },
                    {
                      name = "cz",
                      type = "number",
                      description = "The z position of the center of mass."
                    },
                    {
                      name = "mass",
                      type = "number",
                      description = "The computed mass of the Collider."
                    },
                    {
                      name = "inertia",
                      type = "table",
                      description = "A table containing 6 values of the rotational inertia tensor matrix.  The table contains the 3 diagonal elements of the matrix (upper left to bottom right), followed by the 3 elements of the upper right portion of the 3x3 matrix."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setOrientation",
              summary = "Set the orientation of the Collider.",
              description = "Sets the orientation of the Collider in angle/axis representation.",
              key = "Collider:setOrientation",
              module = "lovr.physics",
              related = {
                "Collider:applyTorque",
                "Collider:getAngularVelocity",
                "Collider:setAngularVelocity",
                "Collider:getPosition",
                "Collider:setPosition"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Collider is rotated around its axis of rotation."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the axis of rotation."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the axis of rotation."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setPosition",
              summary = "Set the position of the Collider.",
              description = "Sets the position of the Collider.",
              key = "Collider:setPosition",
              module = "lovr.physics",
              related = {
                "Collider:applyForce",
                "Collider:getLinearVelocity",
                "Collider:setLinearVelocity",
                "Collider:getOrientation",
                "Collider:setOrientation"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Collider, in meters."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the Collider, in meters."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the Collider, in meters."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setRestitution",
              summary = "Set the bounciness of the Collider.",
              description = "Sets the restitution (bounciness) of the Collider.  By default, the restitution of two Colliders is combined (the max is used) when they collide to cause them to bounce away from each other. The initial restitution is 0.",
              key = "Collider:setRestitution",
              module = "lovr.physics",
              related = {
                "Collider:getFriction",
                "Collider:setFriction",
                "World:collide"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "restitution",
                      type = "number",
                      description = "The new restitution."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setSleepingAllowed",
              summary = "Set whether the Collider is allowed to sleep.",
              description = "Sets whether the Collider is allowed to sleep.",
              key = "Collider:setSleepingAllowed",
              module = "lovr.physics",
              related = {
                "World:isSleepingAllowed",
                "World:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "allowed",
                      type = "boolean",
                      description = "Whether the Collider can go to sleep."
                    }
                  },
                  returns = {}
                }
              },
              notes = "If sleeping is enabled, the simulation will put the Collider to sleep if it hasn't moved in a while. Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nIt is possible to set the default value for new colliders using `World:setSleepingAllowed`.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`."
            },
            {
              name = "setTag",
              summary = "Set the Collider's tag.",
              description = "Sets the Collider's tag.",
              key = "Collider:setTag",
              module = "lovr.physics",
              related = {
                "World:disableCollisionBetween",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween",
                "lovr.physics.newWorld"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "tag",
                      type = "string",
                      description = "The Collider's collision tag."
                    }
                  },
                  returns = {}
                }
              },
              notes = "Collision between tags can be enabled and disabled using `World:enableCollisionBetween` and `World:disableCollisionBetween`."
            },
            {
              name = "setUserData",
              summary = "Set the Collider's user data.",
              description = "Associates a custom value with the Collider.",
              key = "Collider:setUserData",
              module = "lovr.physics",
              notes = "User data can be useful to identify the Collider in callbacks.",
              variants = {
                {
                  arguments = {
                    {
                      name = "data",
                      type = "*",
                      description = "The custom value to associate with the Collider."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          constructors = {
            "World:newCollider",
            "World:newBoxCollider",
            "World:newCapsuleCollider",
            "World:newCylinderCollider",
            "World:newSphereCollider"
          }
        },
        {
          name = "CylinderShape",
          summary = "A cylinder Shape.",
          description = "A type of `Shape` that can be used for cylinder-shaped things.",
          key = "CylinderShape",
          module = "lovr.physics",
          extends = "Shape",
          constructors = {
            "lovr.physics.newCylinderShape",
            "World:newCylinderCollider"
          },
          methods = {
            {
              name = "getLength",
              summary = "Get the length of the CylinderShape.",
              description = "Returns the length of the CylinderShape.",
              key = "CylinderShape:getLength",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the cylinder, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "getRadius",
              summary = "Get the radius of the CylinderShape.",
              description = "Returns the radius of the CylinderShape.",
              key = "CylinderShape:getRadius",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the cylinder, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "setLength",
              summary = "Set the length of the CylinderShape.",
              description = "Sets the length of the CylinderShape.",
              key = "CylinderShape:setLength",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "length",
                      type = "number",
                      description = "The new length, in meters."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setRadius",
              summary = "Set the radius of the CylinderShape.",
              description = "Sets the radius of the CylinderShape.",
              key = "CylinderShape:setRadius",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The new radius, in meters."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "DistanceJoint",
          summary = "A fixed distance joint.",
          description = "A DistanceJoint is a type of `Joint` that tries to keep two colliders a fixed distance apart. The distance is determined by the initial distance between the anchor points.  The joint allows for rotation on the anchor points.",
          key = "DistanceJoint",
          module = "lovr.physics",
          related = {
            "Collider"
          },
          constructors = {
            "lovr.physics.newDistanceJoint"
          },
          methods = {
            {
              name = "getAnchors",
              summary = "Get the anchor points of the DistanceJoint.",
              description = "Returns the anchor points of the DistanceJoint.",
              key = "DistanceJoint:getAnchors",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x1",
                      type = "number",
                      description = "The x coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "y1",
                      type = "number",
                      description = "The y coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "z1",
                      type = "number",
                      description = "The z coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the second anchor point, in world coordinates."
                    }
                  }
                }
              }
            },
            {
              name = "getDistance",
              summary = "Get the target distance of the DistanceJoint.",
              description = "Returns the target distance for the DistanceJoint.  The joint tries to keep the Colliders this far apart.",
              key = "DistanceJoint:getDistance",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "distance",
                      type = "number",
                      description = "The target distance."
                    }
                  }
                }
              }
            },
            {
              name = "setAnchors",
              summary = "Set the anchor points of the DistanceJoint.",
              description = "Sets the anchor points of the DistanceJoint.",
              key = "DistanceJoint:setAnchors",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x1",
                      type = "number",
                      description = "The x coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "y1",
                      type = "number",
                      description = "The y coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "z1",
                      type = "number",
                      description = "The z coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the second anchor point, in world coordinates."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setDistance",
              summary = "Set the target distance of the DistanceJoint.",
              description = "Sets the target distance for the DistanceJoint.  The joint tries to keep the Colliders this far apart.",
              key = "DistanceJoint:setDistance",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "distance",
                      type = "number",
                      description = "The new target distance."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          extends = "Joint"
        },
        {
          name = "HingeJoint",
          summary = "A hinge joint.",
          description = "A HingeJoint is a type of `Joint` that only allows colliders to rotate on a single axis.",
          key = "HingeJoint",
          module = "lovr.physics",
          related = {
            "Collider"
          },
          constructors = {
            "lovr.physics.newHingeJoint"
          },
          methods = {
            {
              name = "getAnchors",
              summary = "Get the anchor points of the HingeJoint.",
              description = "Returns the anchor points of the HingeJoint.",
              key = "HingeJoint:getAnchors",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x1",
                      type = "number",
                      description = "The x coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "y1",
                      type = "number",
                      description = "The y coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "z1",
                      type = "number",
                      description = "The z coordinate of the first anchor point, in world coordinates."
                    },
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the second anchor point, in world coordinates."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the second anchor point, in world coordinates."
                    }
                  }
                }
              }
            },
            {
              name = "getAngle",
              summary = "Get the angle of the HingeJoint.",
              description = "Get the angle between the two colliders attached to the HingeJoint.  When the joint is created or when the anchor or axis is set, the current angle is the new \"zero\" angle.",
              key = "HingeJoint:getAngle",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The hinge angle."
                    }
                  }
                }
              }
            },
            {
              name = "getAxis",
              summary = "Get the HingeJoint's axis.",
              description = "Returns the axis of the hinge.",
              key = "HingeJoint:getAxis",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the axis."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the axis."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the axis."
                    }
                  }
                }
              }
            },
            {
              name = "getLimits",
              summary = "Get the HingeJoint's angle limits.",
              description = "Returns the upper and lower limits of the hinge angle.  These will be between -π and π.",
              key = "HingeJoint:getLimits",
              module = "lovr.physics",
              related = {
                "HingeJoint:getAngle",
                "HingeJoint:getLowerLimit",
                "HingeJoint:setLowerLimit",
                "HingeJoint:getUpperLimit",
                "HingeJoint:setUpperLimit"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "lower",
                      type = "number",
                      description = "The lower limit."
                    },
                    {
                      name = "upper",
                      type = "number",
                      description = "The upper limit."
                    }
                  }
                }
              }
            },
            {
              name = "getLowerLimit",
              summary = "Get the HingeJoint's lower angle limit.",
              description = "Returns the lower limit of the hinge angle.  This will be greater than -π.",
              key = "HingeJoint:getLowerLimit",
              module = "lovr.physics",
              related = {
                "HingeJoint:getAngle",
                "HingeJoint:getUpperLimit",
                "HingeJoint:setUpperLimit",
                "HingeJoint:getLimits",
                "HingeJoint:setLimits"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The lower limit."
                    }
                  }
                }
              }
            },
            {
              name = "getUpperLimit",
              summary = "Get the HingeJoint's upper angle limit.",
              description = "Returns the upper limit of the hinge angle.  This will be less than π.",
              key = "HingeJoint:getUpperLimit",
              module = "lovr.physics",
              related = {
                "HingeJoint:getAngle",
                "HingeJoint:getLowerLimit",
                "HingeJoint:setLowerLimit",
                "HingeJoint:getLimits",
                "HingeJoint:setLimits"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The upper limit."
                    }
                  }
                }
              }
            },
            {
              name = "setAnchor",
              summary = "Set the anchor point of the HingeJoint.",
              description = "Sets a new anchor point for the HingeJoint.",
              key = "HingeJoint:setAnchor",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the anchor point, in world coordinates."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the anchor point, in world coordinates."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the anchor point, in world coordinates."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setAxis",
              summary = "Set the HingeJoint's axis.",
              description = "Sets the axis of the hinge.",
              key = "HingeJoint:setAxis",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the axis."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the axis."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the axis."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLimits",
              summary = "Set the HingeJoint's angle limits.",
              description = "Sets the upper and lower limits of the hinge angle.  These should be between -π and π.",
              key = "HingeJoint:setLimits",
              module = "lovr.physics",
              related = {
                "HingeJoint:getAngle",
                "HingeJoint:getLowerLimit",
                "HingeJoint:setLowerLimit",
                "HingeJoint:getUpperLimit",
                "HingeJoint:setUpperLimit"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "lower",
                      type = "number",
                      description = "The lower limit."
                    },
                    {
                      name = "upper",
                      type = "number",
                      description = "The upper limit."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLowerLimit",
              summary = "Set the HingeJoint's lower angle limit.",
              description = "Sets the lower limit of the hinge angle.  This should be greater than -π.",
              key = "HingeJoint:setLowerLimit",
              module = "lovr.physics",
              related = {
                "HingeJoint:getAngle",
                "HingeJoint:getUpperLimit",
                "HingeJoint:setUpperLimit",
                "HingeJoint:getLimits",
                "HingeJoint:setLimits"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The lower limit."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setUpperLimit",
              summary = "Set the HingeJoint's upper angle limit.",
              description = "Sets the upper limit of the hinge angle.  This should be less than π.",
              key = "HingeJoint:setUpperLimit",
              module = "lovr.physics",
              related = {
                "HingeJoint:getAngle",
                "HingeJoint:getLowerLimit",
                "HingeJoint:setLowerLimit",
                "HingeJoint:getLimits",
                "HingeJoint:setLimits"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The upper limit."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          extends = "Joint"
        },
        {
          name = "Joint",
          summary = "Joins two Colliders together.",
          description = "A Joint is a physics object that constrains the movement of two Colliders.",
          key = "Joint",
          module = "lovr.physics",
          methods = {
            {
              name = "destroy",
              summary = "Destroy the Joint.",
              description = "Destroy the Joint, removing it from Colliders it's attached to.",
              key = "Joint:destroy",
              module = "lovr.physics",
              related = {
                "Collider:destroy",
                "Shape:destroy",
                "World:destroy"
              },
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              notes = "Calling functions on the Joint after destroying it is a bad idea."
            },
            {
              name = "getColliders",
              summary = "Get the Colliders the Joint is attached to.",
              description = "Returns the Colliders the Joint is attached to.  All Joints are attached to two colliders.",
              key = "Joint:getColliders",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "colliderA",
                      type = "Collider",
                      description = "The first Collider."
                    },
                    {
                      name = "colliderB",
                      type = "Collider",
                      description = "The second Collider."
                    }
                  }
                }
              }
            },
            {
              name = "getType",
              summary = "Get the type of the Joint.",
              description = "Returns the type of the Joint.",
              key = "Joint:getType",
              module = "lovr.physics",
              related = {
                "JointType"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "type",
                      type = "JointType",
                      description = "The type of the Joint."
                    }
                  }
                }
              }
            },
            {
              name = "getUserData",
              summary = "Get the Joint's user data.",
              description = "Returns the user data associated with the Joint.",
              key = "Joint:getUserData",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "data",
                      type = "*",
                      description = "The custom value associated with the Joint."
                    }
                  }
                }
              }
            },
            {
              name = "setUserData",
              summary = "Set the Joint's user data.",
              description = "Sets the user data associated with the Joint.",
              key = "Joint:setUserData",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "data",
                      type = "*",
                      description = "The custom value associated with the Joint."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          constructors = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newHingeJoint",
            "lovr.physics.newSliderJoint"
          },
          related = {
            "Collider"
          }
        },
        {
          name = "Shape",
          summary = "Defines the shape of Colliders.",
          description = "A Shape is a physics object that can be attached to colliders to define their shape.",
          key = "Shape",
          module = "lovr.physics",
          methods = {
            {
              name = "destroy",
              summary = "Destroy the Shape.",
              description = "Destroy the Shape, removing it from Colliders it's attached to.",
              key = "Shape:destroy",
              module = "lovr.physics",
              related = {
                "Collider:destroy",
                "Joint:destroy",
                "World:destroy"
              },
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              notes = "Calling functions on the Shape after destroying it is a bad idea."
            },
            {
              name = "getAABB",
              summary = "Get the Shape's axis aligned bounding box.",
              description = "Returns the bounding box for the Shape.",
              key = "Shape:getAABB",
              module = "lovr.physics",
              related = {
                "Collider:getAABB"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "minx",
                      type = "number",
                      description = "The minimum x coordinate of the box."
                    },
                    {
                      name = "maxx",
                      type = "number",
                      description = "The maximum x coordinate of the box."
                    },
                    {
                      name = "miny",
                      type = "number",
                      description = "The minimum y coordinate of the box."
                    },
                    {
                      name = "maxy",
                      type = "number",
                      description = "The maximum y coordinate of the box."
                    },
                    {
                      name = "minz",
                      type = "number",
                      description = "The minimum z coordinate of the box."
                    },
                    {
                      name = "maxz",
                      type = "number",
                      description = "The maximum z coordinate of the box."
                    }
                  }
                }
              }
            },
            {
              name = "getCollider",
              summary = "Get the Collider the Shape is attached to.",
              description = "Returns the Collider the Shape is attached to.",
              key = "Shape:getCollider",
              module = "lovr.physics",
              related = {
                "Collider",
                "Collider:addShape",
                "Collider:removeShape"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The Collider the Shape is attached to."
                    }
                  }
                }
              },
              notes = "A Shape can only be attached to one Collider at a time."
            },
            {
              name = "getMass",
              summary = "Compute mass properties of the Shape.",
              description = "Computes mass properties of the Shape.",
              key = "Shape:getMass",
              module = "lovr.physics",
              related = {
                "Collider:getMass",
                "Collider:setMass",
                "Collider:getMassData",
                "Collider:setMassData"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "density",
                      type = "number",
                      description = "The density to use, in kilograms per cubic meter."
                    }
                  },
                  returns = {
                    {
                      name = "cx",
                      type = "number",
                      description = "The x position of the center of mass."
                    },
                    {
                      name = "cy",
                      type = "number",
                      description = "The y position of the center of mass."
                    },
                    {
                      name = "cz",
                      type = "number",
                      description = "The z position of the center of mass."
                    },
                    {
                      name = "mass",
                      type = "number",
                      description = "The mass of the Shape."
                    },
                    {
                      name = "inertia",
                      type = "table",
                      description = "A table containing 6 values of the rotational inertia tensor matrix.  The table contains the 3 diagonal elements of the matrix (upper left to bottom right), followed by the 3 elements of the upper right portion of the 3x3 matrix."
                    }
                  }
                }
              }
            },
            {
              name = "getOrientation",
              summary = "Get the Shape's orientation.",
              description = "Get the orientation of the Shape relative to its Collider.",
              key = "Shape:getOrientation",
              module = "lovr.physics",
              related = {
                "Shape:getPosition",
                "Shape:setPosition"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Shape is rotated."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the rotation axis."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the rotation axis."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the rotation axis."
                    }
                  }
                }
              }
            },
            {
              name = "getPosition",
              summary = "Get the Shape's position.",
              description = "Get the position of the Shape relative to its Collider.",
              key = "Shape:getPosition",
              module = "lovr.physics",
              related = {
                "Shape:getOrientation",
                "Shape:setOrientation"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x offset."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y offset."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z offset."
                    }
                  }
                }
              }
            },
            {
              name = "getType",
              summary = "Get the type of the Shape.",
              description = "Returns the type of the Shape.",
              key = "Shape:getType",
              module = "lovr.physics",
              related = {
                "ShapeType"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "type",
                      type = "ShapeType",
                      description = "The type of the Shape."
                    }
                  }
                }
              }
            },
            {
              name = "getUserData",
              summary = "Get the Shape's user data.",
              description = "Returns the user data associated with the Shape.",
              key = "Shape:getUserData",
              module = "lovr.physics",
              notes = "User data can be useful to identify the Shape in callbacks.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "data",
                      type = "*",
                      description = "The custom value associated with the Shape."
                    }
                  }
                }
              }
            },
            {
              name = "isEnabled",
              summary = "Check if the Shape is enabled.",
              description = "Returns whether the Shape is enabled.",
              key = "Shape:isEnabled",
              module = "lovr.physics",
              notes = "Disabled shapes won't collide with anything.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether the Shape is enabled."
                    }
                  }
                }
              }
            },
            {
              name = "setEnabled",
              summary = "Enable or disable the Shape.",
              description = "Enable or disable the Shape.",
              key = "Shape:setEnabled",
              module = "lovr.physics",
              notes = "Disabled shapes won't collide with anything.",
              variants = {
                {
                  arguments = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether the Shape should be enabled."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setOrientation",
              summary = "Set the Shape's orientation.",
              description = "Set the orientation of the Shape relative to its Collider.",
              key = "Shape:setOrientation",
              module = "lovr.physics",
              related = {
                "Shape:getPosition",
                "Shape:setPosition"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Shape is rotated."
                    },
                    {
                      name = "ax",
                      type = "number",
                      description = "The x component of the rotation axis."
                    },
                    {
                      name = "ay",
                      type = "number",
                      description = "The y component of the rotation axis."
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the rotation axis."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setPosition",
              summary = "Set the Shape's position.",
              description = "Set the position of the Shape relative to its Collider.",
              key = "Shape:setPosition",
              module = "lovr.physics",
              related = {
                "Shape:getOrientation",
                "Shape:setOrientation"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x offset."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y offset."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z offset."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setUserData",
              summary = "Set the Shape's user data.",
              description = "Sets the user data associated with the Shape.",
              key = "Shape:setUserData",
              module = "lovr.physics",
              notes = "User data can be useful to identify the Shape in callbacks.",
              variants = {
                {
                  arguments = {
                    {
                      name = "data",
                      type = "*",
                      description = "The custom value associated with the Shape."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          constructors = {
            "lovr.physics.newBoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newCylinderShape",
            "lovr.physics.newSphereShape",
            "World:newBoxCollider",
            "World:newCapsuleCollider",
            "World:newCylinderCollider",
            "World:newSphereCollider"
          }
        },
        {
          name = "SliderJoint",
          summary = "A slider joint.",
          description = "A SliderJoint is a type of `Joint` that only allows colliders to move on a single axis.",
          key = "SliderJoint",
          module = "lovr.physics",
          related = {
            "Collider"
          },
          constructors = {
            "lovr.physics.newSliderJoint"
          },
          methods = {
            {
              name = "getAxis",
              summary = "Get the SliderJoint's axis.",
              description = "Returns the axis of the slider.",
              key = "SliderJoint:getAxis",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the axis."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the axis."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the axis."
                    }
                  }
                }
              }
            },
            {
              name = "getLimits",
              summary = "Get the SliderJoint's limits.",
              description = "Returns the upper and lower limits of the slider position.",
              key = "SliderJoint:getLimits",
              module = "lovr.physics",
              related = {
                "SliderJoint:getPosition",
                "SliderJoint:getLowerLimit",
                "SliderJoint:setLowerLimit",
                "SliderJoint:getUpperLimit",
                "SliderJoint:setUpperLimit"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "lower",
                      type = "number",
                      description = "The lower limit."
                    },
                    {
                      name = "upper",
                      type = "number",
                      description = "The upper limit."
                    }
                  }
                }
              }
            },
            {
              name = "getLowerLimit",
              summary = "Get the SliderJoint's lower limit.",
              description = "Returns the lower limit of the slider position.",
              key = "SliderJoint:getLowerLimit",
              module = "lovr.physics",
              related = {
                "SliderJoint:getPosition",
                "SliderJoint:getUpperLimit",
                "SliderJoint:setUpperLimit",
                "SliderJoint:getLimits",
                "SliderJoint:setLimits"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The lower limit."
                    }
                  }
                }
              }
            },
            {
              name = "getUpperLimit",
              summary = "Get the SliderJoint's upper limit.",
              description = "Returns the upper limit of the slider position.",
              key = "SliderJoint:getUpperLimit",
              module = "lovr.physics",
              related = {
                "SliderJoint:getPosition",
                "SliderJoint:getLowerLimit",
                "SliderJoint:setLowerLimit",
                "SliderJoint:getLimits",
                "SliderJoint:setLimits"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The upper limit."
                    }
                  }
                }
              }
            },
            {
              name = "setAxis",
              summary = "Set the SliderJoint's axis.",
              description = "Sets the axis of the slider.",
              key = "SliderJoint:setAxis",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x component of the axis."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y component of the axis."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z component of the axis."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLimits",
              summary = "Set the SliderJoint's limits.",
              description = "Sets the upper and lower limits of the slider position.",
              key = "SliderJoint:setLimits",
              module = "lovr.physics",
              related = {
                "SliderJoint:getPosition",
                "SliderJoint:getLowerLimit",
                "SliderJoint:setLowerLimit",
                "SliderJoint:getUpperLimit",
                "SliderJoint:setUpperLimit"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "lower",
                      type = "number",
                      description = "The lower limit."
                    },
                    {
                      name = "upper",
                      type = "number",
                      description = "The upper limit."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLowerLimit",
              summary = "Set the SliderJoint's lower limit.",
              description = "Sets the lower limit of the slider position.",
              key = "SliderJoint:setLowerLimit",
              module = "lovr.physics",
              related = {
                "SliderJoint:getPosition",
                "SliderJoint:getUpperLimit",
                "SliderJoint:setUpperLimit",
                "SliderJoint:getLimits",
                "SliderJoint:setLimits"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The lower limit."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setUpperLimit",
              summary = "Set the SliderJoint's upper limit.",
              description = "Sets the upper limit of the slider position.",
              key = "SliderJoint:setUpperLimit",
              module = "lovr.physics",
              related = {
                "SliderJoint:getPosition",
                "SliderJoint:getLowerLimit",
                "SliderJoint:setLowerLimit",
                "SliderJoint:getLimits",
                "SliderJoint:setLimits"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "limit",
                      type = "number",
                      description = "The upper limit."
                    }
                  },
                  returns = {}
                }
              }
            }
          },
          extends = "Joint"
        },
        {
          name = "SphereShape",
          summary = "A sphere Shape.",
          description = "A type of `Shape` that can be used for spheres.",
          key = "SphereShape",
          module = "lovr.physics",
          extends = "Shape",
          constructors = {
            "lovr.physics.newSphereShape",
            "World:newSphereCollider"
          },
          methods = {
            {
              name = "getDimensions",
              summary = "Get the radius of the SphereShape.",
              description = "Returns the radius of the SphereShape.",
              key = "SphereShape:getDimensions",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the sphere, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "setDimensions",
              summary = "Set the radius of the SphereShape.",
              description = "Sets the radius of the SphereShape.",
              key = "SphereShape:setDimensions",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the sphere, in meters."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "World",
          summary = "An independent physics simulation.",
          description = "A World is an object that holds the colliders, joints, and shapes in a physics simulation.",
          key = "World",
          module = "lovr.physics",
          methods = {
            {
              name = "collide",
              tag = "worldCollision",
              summary = "Attempt to collide two shapes.",
              description = "Attempt to collide two shapes.  Internally this uses joints and forces to ensure the colliders attached to the shapes do not pass through each other.  Collisions can be customized using friction and restitution (bounciness) parameters, and default to using a mix of the colliders' friction and restitution parameters.  Usually this is called automatically by `World:update`.",
              key = "World:collide",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "shapeA",
                      type = "Shape",
                      description = "The first shape."
                    },
                    {
                      name = "shapeB",
                      type = "Shape",
                      description = "The second shape."
                    },
                    {
                      name = "friction",
                      type = "number",
                      description = "The friction parameter for the collision.",
                      default = "nil"
                    },
                    {
                      name = "restitution",
                      type = "number",
                      description = "The restitution (bounciness) parameter for the collision.",
                      default = "nil"
                    }
                  },
                  returns = {
                    {
                      name = "collided",
                      type = "boolean",
                      description = "Whether the shapes collided."
                    }
                  }
                }
              },
              related = {
                "World:computeOverlaps",
                "World:overlaps",
                "World:disableCollisionBetween",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween"
              },
              notes = "For friction, numbers in the range of 0-1 are common, but larger numbers can also be used.\n\nFor restitution, numbers in the range 0-1 should be used.\n\nThis function respects collision tags, so using `World:disableCollisionBetween` and `World:enableCollisionBetween` will change the behavior of this function."
            },
            {
              name = "computeOverlaps",
              tag = "worldCollision",
              summary = "Compute pairs of shapes that are close to each other.",
              description = "Detects which pairs of shapes in the world are near each other and could be colliding.  After calling this function, the `World:overlaps` iterator can be used to iterate over the overlaps, and `World:collide` can be used to resolve a collision for the shapes (if any). Usually this is called automatically by `World:update`.",
              key = "World:computeOverlaps",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              examples = {
                {
                  code = "world:computeOverlaps()\nfor shapeA, shapeB in world:overlaps() do\n  local areColliding = world:collide(shapeA, shapeB)\n  print(shapeA, shapeB, areColliding)\nend"
                }
              },
              related = {
                "World:overlaps",
                "World:collide",
                "World:update"
              }
            },
            {
              name = "destroy",
              tag = "worldBasics",
              summary = "Destroy the World!!  Muahaha!",
              description = "Destroy the World!",
              key = "World:destroy",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              notes = "Bad things will happen if you destroy the world and then try to access it or anything that was in it."
            },
            {
              name = "disableCollisionBetween",
              tag = "worldCollision",
              summary = "Disable collision between two tags.",
              description = "Disables collision between two collison tags.",
              key = "World:disableCollisionBetween",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "tag1",
                      type = "string",
                      description = "The first tag."
                    },
                    {
                      name = "tag2",
                      type = "string",
                      description = "The second tag."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "lovr.physics.newWorld",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween"
              },
              notes = "Tags must be set up when creating the World, see `lovr.physics.newWorld`.\n\nBy default, collision is enabled between all tags."
            },
            {
              name = "enableCollisionBetween",
              tag = "worldCollision",
              summary = "Enable collision between two tags.",
              description = "Enables collision between two collison tags.",
              key = "World:enableCollisionBetween",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "tag1",
                      type = "string",
                      description = "The first tag."
                    },
                    {
                      name = "tag2",
                      type = "string",
                      description = "The second tag."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "lovr.physics.newWorld",
                "World:disableCollisionBetween",
                "World:isCollisionEnabledBetween"
              },
              notes = "Tags must be set up when creating the World, see `lovr.physics.newWorld`.\n\nBy default, collision is enabled between all tags."
            },
            {
              name = "getAngularDamping",
              tag = "worldProperties",
              summary = "Get the angular damping of the World.",
              description = "Returns the angular damping of the World.  Angular damping makes things less \"spinny\", making them slow down their angular velocity over time.",
              key = "World:getAngularDamping",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    }
                  }
                }
              },
              related = {
                "Collider:getAngularDamping",
                "Collider:setAngularDamping"
              },
              notes = "Angular damping can also be set on individual colliders."
            },
            {
              name = "getGravity",
              tag = "worldProperties",
              summary = "Get the gravity of the World.",
              description = "Returns the gravity of the World.",
              key = "World:getGravity",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "xg",
                      type = "number",
                      description = "The x component of the gravity force."
                    },
                    {
                      name = "yg",
                      type = "number",
                      description = "The y component of the gravity force."
                    },
                    {
                      name = "zg",
                      type = "number",
                      description = "The z component of the gravity force."
                    }
                  }
                }
              }
            },
            {
              name = "getLinearDamping",
              tag = "worldProperties",
              summary = "Get the linear damping of the World.",
              description = "Returns the linear damping of the World.  Linear damping is similar to drag or air resistance, slowing down colliders over time as they move.",
              key = "World:getLinearDamping",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    }
                  }
                }
              },
              related = {
                "Collider:getLinearDamping",
                "Collider:setLinearDamping"
              },
              notes = "A linear damping of 0 means colliders won't slow down over time.\n\nLinear damping can also be set on individual colliders."
            },
            {
              name = "isCollisionEnabledBetween",
              tag = "worldCollision",
              summary = "Check if two tags can collide.",
              description = "Returns whether collisions are currently enabled between two tags.",
              key = "World:isCollisionEnabledBetween",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "tag1",
                      type = "string",
                      description = "The first tag."
                    },
                    {
                      name = "tag2",
                      type = "string",
                      description = "The second tag."
                    }
                  },
                  returns = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether or not two colliders with the specified tags will collide."
                    }
                  }
                }
              },
              related = {
                "lovr.physics.newWorld",
                "World:disableCollisionBetween",
                "World:enableCollisionBetween"
              },
              notes = "Tags must be set up when creating the World, see `lovr.physics.newWorld`.\n\nBy default, collision is enabled between all tags."
            },
            {
              name = "isSleepingAllowed",
              tag = "worldProperties",
              summary = "Check if colliders can go to sleep.",
              description = "Returns whether colliders can go to sleep in the World.",
              key = "World:isSleepingAllowed",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "allowed",
                      type = "boolean",
                      description = "Whether colliders can sleep."
                    }
                  }
                }
              },
              related = {
                "Collider:isSleepingAllowed",
                "Collider:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              },
              notes = "If sleeping is enabled, the World will try to detect colliders that haven't moved for a while and put them to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nThis can be set on individual colliders.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`."
            },
            {
              name = "newBoxCollider",
              tag = "colliders",
              summary = "Add a Collider with a BoxShape to the World.",
              description = "Adds a new Collider to the World with a BoxShape already attached.",
              key = "World:newBoxCollider",
              module = "lovr.physics",
              related = {
                "BoxShape",
                "Collider",
                "World:newCollider",
                "World:newCapsuleCollider",
                "World:newCylinderCollider",
                "World:newSphereCollider"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the center of the box.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the center of the box.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the center of the box.",
                      default = "0"
                    },
                    {
                      name = "width",
                      type = "number",
                      description = "The total width of the box, in meters.",
                      default = "1"
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The total height of the box, in meters.",
                      default = "width"
                    },
                    {
                      name = "depth",
                      type = "number",
                      description = "The total depth of the box, in meters.",
                      default = "width"
                    }
                  },
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The new Collider."
                    }
                  }
                }
              }
            },
            {
              name = "newCapsuleCollider",
              tag = "colliders",
              summary = "Add a Collider with a CapsuleShape to the World.",
              description = "Adds a new Collider to the World with a CapsuleShape already attached.",
              key = "World:newCapsuleCollider",
              module = "lovr.physics",
              related = {
                "CapsuleShape",
                "Collider",
                "World:newCollider",
                "World:newBoxCollider",
                "World:newCylinderCollider",
                "World:newSphereCollider"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the center of the capsule.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the center of the capsule.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the center of the capsule.",
                      default = "0"
                    },
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the capsule, in meters.",
                      default = "1"
                    },
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the capsule, not including the caps, in meters.",
                      default = "1"
                    }
                  },
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The new Collider."
                    }
                  }
                }
              }
            },
            {
              name = "newCollider",
              tag = "colliders",
              summary = "Add a Collider to the World.",
              description = "Adds a new Collider to the World.",
              key = "World:newCollider",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Collider.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the Collider.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the Collider.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The new Collider."
                    }
                  }
                }
              },
              related = {
                "World:newBoxCollider",
                "World:newCapsuleCollider",
                "World:newCylinderCollider",
                "World:newSphereCollider",
                "Collider",
                "Shape"
              },
              examples = {
                {
                  description = "Create a new world, add a collider to it, and update it, printing out the collider's position as it falls.",
                  code = "function lovr.load()\n  world = lovr.physics.newWorld()\n  box = world:newBoxCollider()\nend\n\nfunction lovr.update(dt)\n  world:update(dt)\n  print(box:getPosition())\nend"
                }
              },
              notes = "This function creates a collider without any shapes attached to it, which means it won't collide with anything.  To add a shape to the collider, use `Collider:addShape`, or use one of the following functions to create the collider:\n\n- `World:newBoxCollider`\n- `World:newCapsuleCollider`\n- `World:newCylinderCollider`\n- `World:newSphereCollider`"
            },
            {
              name = "newCylinderCollider",
              tag = "colliders",
              summary = "Add a Collider with a CylinderShape to the World.",
              description = "Adds a new Collider to the World with a CylinderShape already attached.",
              key = "World:newCylinderCollider",
              module = "lovr.physics",
              related = {
                "CylinderShape",
                "Collider",
                "World:newCollider",
                "World:newBoxCollider",
                "World:newCapsuleCollider",
                "World:newSphereCollider"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the center of the cylinder.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the center of the cylinder.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the center of the cylinder.",
                      default = "0"
                    },
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the cylinder, in meters.",
                      default = "1"
                    },
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the cylinder, in meters.",
                      default = "1"
                    }
                  },
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The new Collider."
                    }
                  }
                }
              }
            },
            {
              name = "newSphereCollider",
              tag = "colliders",
              summary = "Add a Collider with a SphereShape to the World.",
              description = "Adds a new Collider to the World with a SphereShape already attached.",
              key = "World:newSphereCollider",
              module = "lovr.physics",
              related = {
                "SphereShape",
                "Collider",
                "World:newCollider",
                "World:newBoxCollider",
                "World:newCapsuleCollider",
                "World:newCylinderCollider"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the center of the sphere.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the center of the sphere.",
                      default = "0"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the center of the sphere.",
                      default = "0"
                    },
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the sphere, in meters.",
                      default = "1"
                    }
                  },
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The new Collider."
                    }
                  }
                }
              }
            },
            {
              name = "overlaps",
              tag = "worldCollision",
              summary = "Iterate over pairs of nearby shapes.",
              description = "Returns an iterator that can be used to iterate over \"overlaps\", or potential collisions between pairs of shapes in the World.  This should be called after using `World:detectOverlaps` to compute the list of overlaps. Usually this is called automatically by `World:update`.",
              key = "World:overlaps",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "iterator",
                      type = "function",
                      description = "A Lua iterator, usable in a for loop.",
                      arguments = {},
                      returns = {}
                    }
                  }
                }
              },
              examples = {
                {
                  code = "world:computeOverlaps()\nfor shapeA, shapeB in world:overlaps() do\n  local areColliding = world:collide(shapeA, shapeB)\n  print(shapeA, shapeB, areColliding)\nend"
                }
              },
              related = {
                "World:computeOverlaps",
                "World:collide",
                "World:update"
              }
            },
            {
              name = "raycast",
              tag = "worldBasics",
              summary = "Cast a ray through the World.",
              description = "Casts a ray through the World, calling a function every time the ray intersects with a Shape.",
              key = "World:raycast",
              module = "lovr.physics",
              notes = "The callback is passed the shape that was hit, the hit position, and the normal vector of the hit.",
              variants = {
                {
                  arguments = {
                    {
                      name = "x1",
                      type = "number",
                      description = "The x coordinate of the starting position of the ray."
                    },
                    {
                      name = "y1",
                      type = "number",
                      description = "The y coordinate of the starting position of the ray."
                    },
                    {
                      name = "z1",
                      type = "number",
                      description = "The z coordinate of the starting position of the ray."
                    },
                    {
                      name = "x2",
                      type = "number",
                      description = "The x coordinate of the ending position of the ray."
                    },
                    {
                      name = "y2",
                      type = "number",
                      description = "The y coordinate of the ending position of the ray."
                    },
                    {
                      name = "z2",
                      type = "number",
                      description = "The z coordinate of the ending position of the ray."
                    },
                    {
                      name = "callback",
                      type = "function",
                      description = "The function to call when an intersection is detected.",
                      arguments = {
                        {
                          name = "shape",
                          type = "Shape"
                        },
                        {
                          name = "x",
                          type = "number"
                        },
                        {
                          name = "y",
                          type = "number"
                        },
                        {
                          name = "z",
                          type = "number"
                        },
                        {
                          name = "nx",
                          type = "number"
                        },
                        {
                          name = "ny",
                          type = "number"
                        },
                        {
                          name = "nz",
                          type = "number"
                        }
                      },
                      returns = {}
                    }
                  },
                  returns = {}
                }
              },
              examples = {
                {
                  code = "function lovr.load()\n  world = lovr.physics.newWorld()\n  world:newSphereCollider(0, 0, 0, 2)\n\n  -- Cast a ray through the sphere\n  local x1, y1, z1 = .5, 3, 0\n  local x2, y2, z2 = -.5, -2, 0\n  world:raycast(x1, y1, z1, x2, y2, z2, function(shape, x, y, z, nx, ny, nz)\n    print('Collision detected!', shape, x, y, z, nx, ny, nz)\n  end)\nend"
                }
              }
            },
            {
              name = "setAngularDamping",
              tag = "worldProperties",
              summary = "Set the angular damping of the World.",
              description = "Sets the angular damping of the World.  Angular damping makes things less \"spinny\", making them slow down their angular velocity over time.",
              key = "World:setAngularDamping",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Collider:getAngularDamping",
                "Collider:setAngularDamping"
              },
              notes = "Angular damping can also be set on individual colliders."
            },
            {
              name = "setGravity",
              tag = "worldProperties",
              summary = "Set the gravity of the World.",
              description = "Sets the gravity of the World.",
              key = "World:setGravity",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "xg",
                      type = "number",
                      description = "The x component of the gravity force."
                    },
                    {
                      name = "yg",
                      type = "number",
                      description = "The y component of the gravity force."
                    },
                    {
                      name = "zg",
                      type = "number",
                      description = "The z component of the gravity force."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLinearDamping",
              tag = "worldProperties",
              summary = "Set the linear damping of the World.",
              description = "Sets the linear damping of the World.  Linear damping is similar to drag or air resistance, slowing down colliders over time as they move.",
              key = "World:setLinearDamping",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Collider:getLinearDamping",
                "Collider:setLinearDamping"
              },
              notes = "A linear damping of 0 means colliders won't slow down over time.\n\nLinear damping can also be set on individual colliders."
            },
            {
              name = "setSleepingAllowed",
              tag = "worldProperties",
              summary = "Set whether colliders can go to sleep.",
              description = "Sets whether colliders can go to sleep in the World.",
              key = "World:setSleepingAllowed",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "allowed",
                      type = "boolean",
                      description = "Whether colliders can sleep."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Collider:isSleepingAllowed",
                "Collider:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              },
              notes = "If sleeping is enabled, the World will try to detect colliders that haven't moved for a while and put them to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nThis can be set on individual colliders.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`."
            },
            {
              name = "update",
              tag = "worldBasics",
              summary = "Update the World.",
              description = "Updates the World, advancing the physics simulation forward in time and resolving collisions between colliders in the World.",
              key = "World:update",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "dt",
                      type = "number",
                      description = "The amount of time to advance the simultion forward."
                    },
                    {
                      name = "resolver",
                      type = "function",
                      description = "The collision resolver function to use.  This will be called before updating to allow for custom collision processing.  If absent, a default will be used.",
                      arguments = {
                        {
                          name = "world",
                          type = "World"
                        }
                      },
                      returns = {},
                      default = "nil"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "World:computeOverlaps",
                "World:overlaps",
                "World:collide"
              },
              notes = "It is common to pass the `dt` variable from `lovr.update` into this function.\n\nThe default collision resolver function is:\n\n    function defaultResolver(world)\n      world:computeOverlaps()\n      for shapeA, shapeB in world:overlaps() do\n        world:collide(shapeA, shapeB)\n      end\n    end\n\nAdditional logic could be introduced to the collision resolver function to add custom collision behavior or to change the collision parameters (like friction and restitution) on a per-collision basis.\n\n> If possible, use a fixed timestep value for updating the World. It will greatly improve the\n> accuracy of the simulation and reduce bugs. For more information on implementing a fixed\n> timestep loop, see [this article](http://gafferongames.com/game-physics/fix-your-timestep/)."
            }
          },
          sections = {
            {
              name = "Basics",
              tag = "worldBasics"
            },
            {
              name = "Colliders",
              tag = "colliders",
              description = "The following functions add Colliders to the World.  `World:newCollider` adds an \"empty\" Collider without any Shapes attached, whereas the other functions are shortcut functions to add Colliders with Shapes already attached to them."
            },
            {
              name = "Properties",
              tag = "worldProperties",
              description = "The following functions are global properties of the simulation that apply to all new Colliders."
            },
            {
              name = "Collision",
              tag = "worldCollision",
              description = "When the World is created using `lovr.physics.newWorld`, it is possible to specify a list of collision tags for the World.  Colliders can then be assigned a tag.  You can enable and disable collision between pairs of tags.  There are also some helper functions to quickly identify pairs of colliders that are near each other and test whether or not they are colliding.  These are used internally by default by `World:update`, but you can override this behavior and use the functions directly for custom collision behavior."
            }
          },
          notes = "Be sure to update the World in `lovr.update` using `World:update`, otherwise everything will stand still.",
          constructors = {
            "lovr.physics.newWorld"
          }
        }
      }
    },
    {
      name = "timer",
      tag = "modules",
      summary = "Exposes a high resolution timer.",
      description = "The `lovr.timer` module provides a few functions that deal with time.  All times are measured in seconds.",
      key = "lovr.timer",
      functions = {
        {
          name = "getAverageDelta",
          summary = "Get the average delta over the last second.",
          description = "Returns the average delta over the last second.",
          key = "lovr.timer.getAverageDelta",
          module = "lovr.timer",
          related = {
            "lovr.timer.getDelta",
            "lovr.update"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "delta",
                  type = "number",
                  description = "The average delta, in seconds."
                }
              }
            }
          }
        },
        {
          name = "getDelta",
          summary = "Get the time elapsed since the last update.",
          description = "Returns the time between the last two frames.  This is the same value as the `dt` argument provided to `lovr.update`.",
          key = "lovr.timer.getDelta",
          module = "lovr.timer",
          related = {
            "lovr.timer.getTime",
            "lovr.update"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "dt",
                  type = "number",
                  description = "The delta time, in seconds."
                }
              }
            }
          },
          notes = "The return value of this function will remain the same until `lovr.timer.step` is called.  This function should not be used to measure times for game behavior or benchmarking, use `lovr.timer.getTime` for that."
        },
        {
          name = "getFPS",
          summary = "Get the current frames per second.",
          description = "Returns the current frames per second, averaged over the last 60 frames.",
          key = "lovr.timer.getFPS",
          module = "lovr.timer",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "fps",
                  type = "number",
                  description = "The current FPS."
                }
              }
            }
          }
        },
        {
          name = "getTime",
          summary = "Get the current time.",
          description = "Returns the time since some time in the past.  This can be used to measure the difference between two points in time.",
          key = "lovr.timer.getTime",
          module = "lovr.timer",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "time",
                  type = "number",
                  description = "The current time, in seconds."
                }
              }
            }
          }
        },
        {
          name = "sleep",
          summary = "Go to sleep.",
          description = "Sleeps the application for a specified number of seconds.  While the game is asleep, no code will be run, no graphics will be drawn, and the window will be unresponsive.",
          key = "lovr.timer.sleep",
          module = "lovr.timer",
          variants = {
            {
              arguments = {
                {
                  name = "duration",
                  type = "number",
                  description = "The number of seconds to sleep for."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "step",
          summary = "Steps the internal clock.",
          description = "Steps the timer, returning the new delta time.  This is called automatically in `lovr.step` and it's used to calculate the new `dt` to pass to `lovr.update`.",
          key = "lovr.timer.step",
          module = "lovr.timer",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "delta",
                  type = "number",
                  description = "The amount of time since the last call to this function, in seconds."
                }
              }
            }
          }
        }
      },
      enums = {},
      objects = {}
    }
  }
}