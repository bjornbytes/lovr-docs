return {
  modules = {
    {
      name = "lovr",
      summary = "In the beginning, there was nothing.",
      description = "`lovr` is the single global table that is exposed to every LÖVR app. It contains a set of **modules** and a set of **callbacks**.",
      key = "lovr",
      objects = {
        {
          name = "Object",
          summary = "The base object.",
          description = "This is not a real object, but describes the behavior shared by all objects.  Think of it as the superclass of all LÖVR objects.\n\nIn addition to the methods here, all objects have a `__tostring` metamethod that returns the name of the object's type.  So to check if a LÖVR object is an instance of \"Blob\", you can do `tostring(object) == 'Blob'`.",
          key = "Object",
          module = "lovr",
          notes = "Note that the functions here don't apply to any vector objects, see `Vectors`.",
          methods = {
            {
              name = "release",
              summary = "Immediately release the Lua reference to an object.",
              description = "Immediately destroys Lua's reference to the object it's called on.  After calling this function on an object, it is an error to do anything with the object from Lua (call methods on it, pass it to other functions, etc.).  If nothing else is using the object, it will be destroyed immediately, which can be used to destroy something earlier than it would normally be garbage collected in order to reduce memory.",
              key = "Object:release",
              module = "lovr",
              notes = "The object may not be destroyed immediately if something else is referring to it (e.g. it is pushed to a Channel or exists in the payload of a pending event).",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            }
          }
        }
      },
      sections = {
        {
          name = "Modules",
          tag = "modules",
          description = "Modules are the **what** of your app; you can use the functions in modules to tell LÖVR to do things. For example, you can draw things on the screen, figure out what buttons on a controller are pressed, or load a 3D model from a file.  Each module does what it says on the tin, so the `lovr.graphics` module deals with rendering graphics and `lovr.headset` allows you to interact with VR hardware."
        },
        {
          name = "Callbacks",
          tag = "callbacks",
          description = "Callbacks are the **when** of the application; you write code inside callbacks which LÖVR then calls at certain points in time.  For example, the `lovr.load` callback is called once at startup, and `lovr.focus` is called when the VR application gains or loses input focus."
        },
        {
          name = "Version",
          tag = "version",
          description = "This function can be used to get the current version of LÖVR."
        }
      },
      enums = {},
      functions = {
        {
          name = "getVersion",
          tag = "version",
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
      }
    },
    {
      name = "audio",
      tag = "modules",
      summary = "Plays sound.",
      description = "The `lovr.audio` module is responsible for playing sound effects and music.  To play a sound, create a `Source` object and call `Source:play` on it.  Currently ogg, wav, and mp3 audio formats are supported.",
      key = "lovr.audio",
      objects = {
        {
          name = "Source",
          summary = "A playable sound object.",
          description = "A Source is an object representing a single sound.  Currently ogg, wav, and mp3 formats are supported.\n\nWhen a Source is playing, it will send audio to the speakers.  Sources do not play automatically when they are created.  Instead, the `play`, `pause`, and `stop` functions can be used to control when they should play.\n\n`Source:seek` and `Source:tell` can be used to control the playback position of the Source.  A Source can be set to loop when it reaches the end using `Source:setLooping`.",
          key = "Source",
          module = "lovr.audio",
          constructors = {
            "lovr.audio.newSource",
            "Source:clone"
          },
          sections = {
            {
              name = "Playback",
              tag = "sourcePlayback"
            },
            {
              name = "Spatial Effects",
              tag = "sourceEffects"
            },
            {
              name = "Utility",
              tag = "sourceUtility"
            }
          },
          methods = {
            {
              name = "clone",
              tag = "sourceUtility",
              summary = "Create an identical copy of the Source.",
              description = "Creates a copy of the Source, referencing the same `Sound` object and inheriting all of the settings of this Source.  However, it will be created in the stopped state and will be rewound to the beginning.",
              key = "Source:clone",
              module = "lovr.audio",
              notes = "This is a good way to create multiple Sources that play the same sound, since the audio data won't be loaded multiple times and can just be reused.  You can also create multiple `Source` objects and pass in the same `Sound` object for each one, which will have the same effect.",
              related = {
                "lovr.audio.newSource"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "source",
                      type = "Source",
                      description = "A genetically identical copy of the Source."
                    }
                  }
                }
              }
            },
            {
              name = "getDirectivity",
              tag = "sourceEffects",
              summary = "Get the directivity of the Source.",
              description = "Returns the directivity settings for the Source.\n\nThe directivity is controlled by two parameters: the weight and the power.\n\nThe weight is a number between 0 and 1 controlling the general \"shape\" of the sound emitted. 0.0 results in a completely omnidirectional sound that can be heard from all directions.  1.0 results in a full dipole shape that can be heard only from the front and back.  0.5 results in a cardioid shape that can only be heard from one direction.  Numbers in between will smoothly transition between these.\n\nThe power is a number that controls how \"focused\" or sharp the shape is.  Lower power values can be heard from a wider set of angles.  It is an exponent, so it can get arbitrarily large.  Note that a power of zero will still result in an omnidirectional source, regardless of the weight.",
              key = "Source:getDirectivity",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "weight",
                      type = "number",
                      description = "The dipole weight.  0.0 is omnidirectional, 1.0 is a dipole, 0.5 is cardioid."
                    },
                    {
                      name = "power",
                      type = "number",
                      description = "The dipole power, controlling how focused the directivity shape is."
                    }
                  }
                }
              }
            },
            {
              name = "getDuration",
              tag = "sourcePlayback",
              summary = "Get the duration of the Source.",
              description = "Returns the duration of the Source.",
              key = "Source:getDuration",
              module = "lovr.audio",
              related = {
                "Sound:getDuration"
              },
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
              name = "getOrientation",
              tag = "sourceEffects",
              summary = "Get the orientation of the Source.",
              description = "Returns the orientation of the Source, in angle/axis representation.",
              key = "Source:getOrientation",
              module = "lovr.audio",
              related = {
                "Source:getPosition",
                "Source:getPose",
                "Source:getCone",
                "lovr.audio.getOrientation"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Source is rotated around its axis of rotation."
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
              name = "getPose",
              tag = "sourceEffects",
              summary = "Get the pose of the Source.",
              description = "Returns the position and orientation of the Source.",
              key = "Source:getPose",
              module = "lovr.audio",
              related = {
                "Source:getPosition",
                "Source:getOrientation",
                "Source:getCone",
                "lovr.audio.getPose"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Source, in meters."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the Source, in meters."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the Source, in meters."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Source is rotated around its axis of rotation."
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
              tag = "sourceEffects",
              summary = "Get the position of the Source.",
              description = "Returns the position of the Source, in meters.  Setting the position will cause the Source to be distorted and attenuated based on its position relative to the listener.",
              key = "Source:getPosition",
              module = "lovr.audio",
              related = {
                "Source:getOrientation",
                "Source:getPose",
                "Source:getCone",
                "lovr.audio.getPosition"
              },
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
              name = "getRadius",
              tag = "sourceEffects",
              summary = "Get the radius of the Source.",
              description = "Returns the radius of the Source, in meters.\n\nThis does not control falloff or attenuation.  It is only used for smoothing out occlusion.  If a Source doesn't have a radius, then when it becomes occluded by a wall its volume will instantly drop.  Giving the Source a radius that approximates its emitter's size will result in a smooth transition between audible and occluded, improving realism.",
              key = "Source:getRadius",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The radius of the Source, in meters."
                    }
                  }
                }
              }
            },
            {
              name = "getSound",
              tag = "sourceUtility",
              summary = "Get the Sound object backing the Source.",
              description = "Returns the `Sound` object backing the Source.  Multiple Sources can share one Sound, allowing its data to only be loaded once.  An easy way to do this sharing is by using `Source:clone`.",
              key = "Source:getSound",
              module = "lovr.audio",
              related = {
                "Source:clone",
                "lovr.audio.newSource"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "sound",
                      type = "Sound",
                      description = "The Sound object."
                    }
                  }
                }
              }
            },
            {
              name = "getVolume",
              tag = "sourcePlayback",
              summary = "Get the volume of the Source.",
              description = "Returns the current volume factor for the Source.",
              key = "Source:getVolume",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "units",
                      type = "VolumeUnit",
                      description = "The units to return (linear or db).",
                      default = "'linear'"
                    }
                  },
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
              name = "isEffectEnabled",
              tag = "sourceEffects",
              summary = "Check if an effect is enabled.",
              description = "Returns whether a given `Effect` is enabled for the Source.",
              key = "Source:isEffectEnabled",
              module = "lovr.audio",
              notes = "The active spatializer will determine which effects are supported.  If an unsupported effect is enabled on a Source, no error will be reported.  Instead, it will be silently ignored.  See `lovr.audio.getSpatializer` for a table showing the effects supported by each spatializer.",
              variants = {
                {
                  arguments = {
                    {
                      name = "effect",
                      type = "Effect",
                      description = "The effect."
                    }
                  },
                  returns = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether the effect is enabled."
                    }
                  }
                }
              }
            },
            {
              name = "isLooping",
              tag = "sourcePlayback",
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
              name = "isPlaying",
              tag = "sourcePlayback",
              summary = "Check if the Source is playing.",
              description = "Returns whether or not the Source is playing.",
              key = "Source:isPlaying",
              module = "lovr.audio",
              related = {
                "Source:play",
                "Source:pause",
                "Source:stop"
              },
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
              name = "pause",
              tag = "sourcePlayback",
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
              tag = "sourcePlayback",
              summary = "Play the Source.",
              description = "Plays the Source.  This doesn't do anything if the Source is already playing.",
              key = "Source:play",
              module = "lovr.audio",
              notes = "There is a maximum of 64 Sources that can be playing at once.  If 64 Sources are already playing, this function will return `false`.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "success",
                      type = "boolean",
                      description = "Whether the Source successfully started playing."
                    }
                  }
                }
              }
            },
            {
              name = "seek",
              tag = "sourcePlayback",
              summary = "Set the playback position of the Source.",
              description = "Seeks the Source to the specified position.",
              key = "Source:seek",
              module = "lovr.audio",
              notes = "Seeking a Source backed by a stream `Sound` has no meaningful effect.",
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
              name = "setDirectivity",
              tag = "sourceEffects",
              summary = "Set the directivity of the Source.",
              description = "Sets the directivity settings for the Source.\n\nThe directivity is controlled by two parameters: the weight and the power.\n\nThe weight is a number between 0 and 1 controlling the general \"shape\" of the sound emitted. 0.0 results in a completely omnidirectional sound that can be heard from all directions.  1.0 results in a full dipole shape that can be heard only from the front and back.  0.5 results in a cardioid shape that can only be heard from one direction.  Numbers in between will smoothly transition between these.\n\nThe power is a number that controls how \"focused\" or sharp the shape is.  Lower power values can be heard from a wider set of angles.  It is an exponent, so it can get arbitrarily large.  Note that a power of zero will still result in an omnidirectional source, regardless of the weight.",
              key = "Source:setDirectivity",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "weight",
                      type = "number",
                      description = "The dipole weight.  0.0 is omnidirectional, 1.0 is a dipole, 0.5 is cardioid."
                    },
                    {
                      name = "power",
                      type = "number",
                      description = "The dipole power, controlling how focused the directivity shape is."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setEffectEnabled",
              tag = "sourceEffects",
              summary = "Enable or disable an effect.",
              description = "Enables or disables an effect on the Source.",
              key = "Source:setEffectEnabled",
              module = "lovr.audio",
              notes = "The active spatializer will determine which effects are supported.  If an unsupported effect is enabled on a Source, no error will be reported.  Instead, it will be silently ignored.  See `lovr.audio.getSpatializer` for a table showing the effects supported by each spatializer.\n\nv0.15.0 has a bug where this function can be called on Sources that were created with the `{ effects = false }` option, causing confusing issues.",
              variants = {
                {
                  arguments = {
                    {
                      name = "effect",
                      type = "Effect",
                      description = "The effect."
                    },
                    {
                      name = "enable",
                      type = "boolean",
                      description = "Whether the effect should be enabled."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setLooping",
              tag = "sourcePlayback",
              summary = "Set whether or not the Source loops.",
              description = "Sets whether or not the Source loops.",
              key = "Source:setLooping",
              module = "lovr.audio",
              notes = "Attempting to loop a Source backed by a stream `Sound` will cause an error.",
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
              name = "setOrientation",
              tag = "sourceEffects",
              summary = "Set the orientation of the Source.",
              description = "Sets the orientation of the Source in angle/axis representation.",
              key = "Source:setOrientation",
              module = "lovr.audio",
              related = {
                "Source:setPosition",
                "Source:setPose",
                "Source:setCone",
                "lovr.audio.setOrientation"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Source should be rotated around its rotation axis."
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
              name = "setPose",
              tag = "sourceEffects",
              summary = "Set the pose of the Source.",
              description = "Sets the position and orientation of the Source.",
              key = "Source:setPose",
              module = "lovr.audio",
              related = {
                "Source:setPosition",
                "Source:setOrientation",
                "lovr.audio.setPose"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the Source, in meters."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the Source, in meters."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the Source, in meters."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the Source is rotated around its axis of rotation."
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
              tag = "sourceEffects",
              summary = "Set the position of the Source.",
              description = "Sets the position of the Source, in meters.  Setting the position will cause the Source to be distorted and attenuated based on its position relative to the listener.\n\nOnly mono sources can be positioned.  Setting the position of a stereo Source will cause an error.",
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
              name = "setRadius",
              tag = "sourceEffects",
              summary = "Set the radius of the Source.",
              description = "Sets the radius of the Source, in meters.\n\nThis does not control falloff or attenuation.  It is only used for smoothing out occlusion.  If a Source doesn't have a radius, then when it becomes occluded by a wall its volume will instantly drop.  Giving the Source a radius that approximates its emitter's size will result in a smooth transition between audible and occluded, improving realism.",
              key = "Source:setRadius",
              module = "lovr.audio",
              variants = {
                {
                  arguments = {
                    {
                      name = "radius",
                      type = "number",
                      description = "The new radius of the Source, in meters."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVolume",
              tag = "sourcePlayback",
              summary = "Set the volume of the Source.",
              description = "Sets the current volume factor for the Source.",
              key = "Source:setVolume",
              module = "lovr.audio",
              notes = "The volume will be clamped to a 0-1 range (0 dB).",
              variants = {
                {
                  arguments = {
                    {
                      name = "volume",
                      type = "number",
                      description = "The new volume."
                    },
                    {
                      name = "units",
                      type = "VolumeUnit",
                      description = "The units of the value.",
                      default = "'linear'"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "stop",
              tag = "sourcePlayback",
              summary = "Stop the Source.",
              description = "Stops the source, also rewinding it to the beginning.",
              key = "Source:stop",
              module = "lovr.audio",
              related = {
                "Source:play",
                "Source:pause",
                "Source:isPlaying"
              },
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "tell",
              tag = "sourcePlayback",
              summary = "Get the playback position of the Source.",
              description = "Returns the current playback position of the Source.",
              key = "Source:tell",
              module = "lovr.audio",
              notes = "The return value for Sources backed by a stream `Sound` has no meaning.",
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
          }
        }
      },
      functions = {
        {
          name = "getAbsorption",
          summary = "Get the absorption coefficients.",
          description = "Returns the global air absorption coefficients for the medium.  This affects Sources that have the `absorption` effect enabled, causing audio volume to drop off with distance as it is absorbed by the medium it's traveling through (air, water, etc.).  The difference between absorption and falloff is that absorption is more subtle and is frequency-dependent, so higher-frequency bands can get absorbed more quickly than lower ones.  This can be used to apply \"underwater\" effects and stuff.",
          key = "lovr.audio.getAbsorption",
          module = "lovr.audio",
          notes = "Absorption is currently only supported by the phonon spatializer.\n\nThe frequency bands correspond to `400Hz`, `2.5KHz`, and `15KHz`.\n\nThe default coefficients are `.0002`, `.0017`, and `.0182` for low, mid, and high.",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "low",
                  type = "number",
                  description = "The absorption coefficient for the low frequency band."
                },
                {
                  name = "mid",
                  type = "number",
                  description = "The absorption coefficient for the mid frequency band."
                },
                {
                  name = "high",
                  type = "number",
                  description = "The absorption coefficient for the high frequency band."
                }
              }
            }
          }
        },
        {
          name = "getDevices",
          tag = "devices",
          summary = "Get a list of audio devices.",
          description = "Returns a list of playback or capture devices.  Each device has an `id`, `name`, and a `default` flag indicating whether it's the default device.\n\nTo use a specific device id for playback or capture, pass it to `lovr.audio.setDevice`.",
          key = "lovr.audio.getDevices",
          module = "lovr.audio",
          related = {
            "lovr.audio.setDevice",
            "lovr.audio.start",
            "lovr.audio.stop"
          },
          variants = {
            {
              arguments = {
                {
                  name = "type",
                  type = "AudioType",
                  description = "The type of devices to query (playback or capture).",
                  default = "'playback'"
                }
              },
              returns = {
                {
                  name = "devices",
                  type = "table",
                  description = "The list of devices.",
                  table = {
                    {
                      name = "[].id",
                      type = "userdata",
                      description = "A unique, opaque id for the device."
                    },
                    {
                      name = "[].name",
                      type = "string",
                      description = "A human readable name for the device."
                    },
                    {
                      name = "[].default",
                      type = "boolean",
                      description = "Whether the device is the default audio device."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "getOrientation",
          tag = "listener",
          summary = "Get the orientation of the listener.",
          description = "Returns the orientation of the virtual audio listener in angle/axis representation.",
          key = "lovr.audio.getOrientation",
          module = "lovr.audio",
          related = {
            "lovr.audio.getPosition",
            "lovr.audio.getPose",
            "Source:getOrientation"
          },
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
          name = "getPose",
          tag = "listener",
          summary = "Get the pose of the listener.",
          description = "Returns the position and orientation of the virtual audio listener.",
          key = "lovr.audio.getPose",
          module = "lovr.audio",
          related = {
            "lovr.audio.getPosition",
            "lovr.audio.getOrientation",
            "Source:getPose"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the listener, in meters."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the listener, in meters."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the listener, in meters."
                },
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
          name = "getSpatializer",
          tag = "listener",
          summary = "Get the name of the active spatializer",
          description = "Returns the name of the active spatializer (`simple`, `oculus`, or `phonon`).\n\nThe `t.audio.spatializer` setting in `lovr.conf` can be used to express a preference for a particular spatializer.  If it's `nil`, all spatializers will be tried in the following order: `phonon`, `oculus`, `simple`.",
          key = "lovr.audio.getSpatializer",
          module = "lovr.audio",
          notes = "Using a feature or effect that is not supported by the current spatializer will not error, it just won't do anything.\n\n<table>\n  <thead>\n    <tr>\n      <td>Feature</td>\n      <td>simple</td>\n      <td>phonon</td>\n      <td>oculus</td>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Effect: Spatialization</td>\n      <td>x</td>\n      <td>x</td>\n      <td>x</td>\n    </tr>\n    <tr>\n      <td>Effect: Attenuation</td>\n      <td>x</td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>Effect: Absorption</td>\n      <td></td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>Effect: Occlusion</td>\n      <td></td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>Effect: Transmission</td>\n      <td></td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>Effect: Reverb</td>\n      <td></td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>lovr.audio.setGeometry</td>\n      <td></td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>Source:setDirectivity</td>\n      <td>x</td>\n      <td>x</td>\n      <td></td>\n    </tr>\n    <tr>\n      <td>Source:setRadius</td>\n      <td></td>\n      <td>x</td>\n      <td></td>\n    </tr>\n  </tbody> </table>",
          related = {
            "lovr.conf"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "spatializer",
                  type = "string",
                  description = "The name of the active spatializer."
                }
              }
            }
          }
        },
        {
          name = "getVolume",
          tag = "listener",
          summary = "Get the master volume.",
          description = "Returns the master volume.  All audio sent to the playback device has its volume multiplied by this factor.",
          key = "lovr.audio.getVolume",
          module = "lovr.audio",
          notes = "The default volume is 1.0 (0 dB).",
          variants = {
            {
              arguments = {
                {
                  name = "units",
                  type = "VolumeUnit",
                  description = "The units to return (linear or db).",
                  default = "'linear'"
                }
              },
              returns = {
                {
                  name = "volume",
                  type = "number",
                  description = "The master volume."
                }
              }
            }
          }
        },
        {
          name = "isStarted",
          tag = "devices",
          summary = "Check if an audio device is started.",
          description = "Returns whether an audio device is started.",
          key = "lovr.audio.isStarted",
          module = "lovr.audio",
          related = {
            "lovr.audio.start",
            "lovr.audio.stop"
          },
          variants = {
            {
              arguments = {
                {
                  name = "type",
                  type = "AudioType",
                  description = "The type of device to check.",
                  default = "'playback'"
                }
              },
              returns = {
                {
                  name = "started",
                  type = "boolean",
                  description = "Whether the device is active."
                }
              }
            }
          }
        },
        {
          name = "newSource",
          tag = "sources",
          summary = "Create a new Source.",
          description = "Creates a new Source from an ogg, wav, or mp3 file.",
          key = "lovr.audio.newSource",
          module = "lovr.audio",
          examples = {
            {
              code = "function lovr.load()\n  sandstorm = lovr.audio.newSource('darude.ogg', {\n    decode = false,\n    effects = { 'spatialization', attenuation = false, reverb = true }\n  })\n\n  sandstorm:play()\nend"
            }
          },
          related = {
            "Source:clone"
          },
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the sound to load."
                },
                {
                  name = "options",
                  type = "table",
                  description = "Optional options.",
                  table = {
                    {
                      name = "decode",
                      type = "boolean",
                      description = "Whether to immediately decode compressed sounds.",
                      default = "false"
                    },
                    {
                      name = "effects",
                      type = "table",
                      description = "A table of `Effect`s to enable.  Keys can be integers (list) or effect names (map), or a combination of both.  The special value `false` can be used to completely disable effects, bypassing the spatializer entirely.  `true` will enable all effects.",
                      default = "true"
                    }
                  }
                }
              },
              returns = {
                {
                  name = "source",
                  type = "Source",
                  description = "The new Source."
                }
              }
            },
            {
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The Blob containing the Source data."
                },
                {
                  name = "options",
                  type = "table",
                  description = "Optional options.",
                  table = {
                    {
                      name = "decode",
                      type = "boolean",
                      description = "Whether to immediately decode compressed sounds.",
                      default = "false"
                    },
                    {
                      name = "effects",
                      type = "table",
                      description = "A table of `Effect`s to enable.  Keys can be integers (list) or effect names (map), or a combination of both.  The special value `false` can be used to completely disable effects, bypassing the spatializer entirely.  `true` will enable all effects.",
                      default = "true"
                    }
                  }
                }
              },
              returns = {
                {
                  name = "source",
                  type = "Source",
                  description = "The new Source."
                }
              }
            },
            {
              arguments = {
                {
                  name = "sound",
                  type = "Sound",
                  description = "The Sound containing raw audio samples to play."
                },
                {
                  name = "options",
                  type = "table",
                  description = "Optional options.",
                  table = {
                    {
                      name = "decode",
                      type = "boolean",
                      description = "Whether to immediately decode compressed sounds.",
                      default = "false"
                    },
                    {
                      name = "effects",
                      type = "table",
                      description = "A table of `Effect`s to enable.  Keys can be integers (list) or effect names (map), or a combination of both.  The special value `false` can be used to completely disable effects, bypassing the spatializer entirely.  `true` will enable all effects.",
                      default = "true"
                    }
                  }
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
          name = "setAbsorption",
          summary = "Set the absorption coefficients.",
          description = "Sets the global air absorption coefficients for the medium.  This affects Sources that have the `absorption` effect enabled, causing audio volume to drop off with distance as it is absorbed by the medium it's traveling through (air, water, etc.).  The difference between absorption and falloff is that absorption is more subtle and is frequency-dependent, so higher-frequency bands can get absorbed more quickly than lower ones.  This can be used to apply \"underwater\" effects and stuff.",
          key = "lovr.audio.setAbsorption",
          module = "lovr.audio",
          notes = "Absorption is currently only supported by the phonon spatializer.\n\nThe frequency bands correspond to `400Hz`, `2.5KHz`, and `15KHz`.\n\nThe default coefficients are `.0002`, `.0017`, and `.0182` for low, mid, and high.",
          variants = {
            {
              arguments = {
                {
                  name = "low",
                  type = "number",
                  description = "The absorption coefficient for the low frequency band."
                },
                {
                  name = "mid",
                  type = "number",
                  description = "The absorption coefficient for the mid frequency band."
                },
                {
                  name = "high",
                  type = "number",
                  description = "The absorption coefficient for the high frequency band."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setDevice",
          tag = "devices",
          summary = "Switch audio devices.",
          description = "Switches either the playback or capture device to a new one.\n\nIf a device for the given type is already active, it will be stopped and destroyed.  The new device will not be started automatically, use `lovr.audio.start` to start it.\n\nA device id (previously retrieved using `lovr.audio.getDevices`) can be given to use a specific audio device, or `nil` can be used for the id to use the default audio device.\n\nA sink can be also be provided when changing the device.  A sink is an audio stream (`Sound` object with a `stream` type) that will receive all audio samples played (for playback) or all audio samples captured (for capture).  When an audio device with a sink is started, be sure to periodically call `Sound:read` on the sink to read audio samples from it, otherwise it will overflow and discard old data.  The sink can have any format, data will be converted as needed. Using a sink for the playback device will reduce performance, but this isn't the case for capture devices.\n\nAudio devices can be started in `shared` or `exclusive` mode.  Exclusive devices may have lower latency than shared devices, but there's a higher chance that requesting exclusive access to an audio device will fail (either because it isn't supported or allowed).  One strategy is to first try the device in exclusive mode, switching to shared if it doesn't work.",
          key = "lovr.audio.setDevice",
          module = "lovr.audio",
          related = {
            "lovr.audio.getDevices",
            "lovr.audio.start",
            "lovr.audio.stop"
          },
          variants = {
            {
              arguments = {
                {
                  name = "type",
                  type = "AudioType",
                  description = "The device to switch.",
                  default = "'playback'"
                },
                {
                  name = "id",
                  type = "userdata",
                  description = "The id of the device to use, or `nil` to use the default device.",
                  default = "nil"
                },
                {
                  name = "sink",
                  type = "Sound",
                  description = "An optional audio stream to use as a sink for the device.",
                  default = "nil"
                },
                {
                  name = "mode",
                  type = "AudioShareMode",
                  description = "The sharing mode for the device.",
                  default = "shared"
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether creating the audio device succeeded."
                }
              }
            }
          }
        },
        {
          name = "setGeometry",
          tag = "listener",
          summary = "Set the geometry for audio effects.",
          description = "Sets a mesh of triangles to use for modeling audio effects, using a table of vertices or a Model.  When the appropriate effects are enabled, audio from `Source` objects will correctly be occluded by walls and bounce around to create realistic reverb.\n\nAn optional `AudioMaterial` may be provided to specify the acoustic properties of the geometry.",
          key = "lovr.audio.setGeometry",
          module = "lovr.audio",
          notes = "This is currently only supported/used by the `phonon` spatializer.\n\nThe `Effect`s that use geometry are:\n\n- `occlusion`\n- `reverb`\n- `transmission`\n\nIf an existing geometry has been set, this function will replace it.\n\nThe triangles must use counterclockwise winding.",
          related = {
            "lovr.audio.getSpatializer",
            "Source:setEffectEnabled"
          },
          variants = {
            {
              arguments = {
                {
                  name = "vertices",
                  type = "table",
                  description = "A flat table of vertices.  Each vertex is 3 numbers representing its x, y, and z position. The units used for audio coordinates are up to you, but meters are recommended."
                },
                {
                  name = "indices",
                  type = "table",
                  description = "A list of indices, indicating how the vertices are connected into triangles.  Indices are 1-indexed and are 32 bits (they can be bigger than 65535)."
                },
                {
                  name = "material",
                  type = "AudioMaterial",
                  description = "The acoustic material to use.",
                  default = "'generic'"
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether audio geometry is supported by the current spatializer and the geometry was loaded successfully."
                }
              }
            },
            {
              arguments = {
                {
                  name = "model",
                  type = "Model",
                  description = "A model to use for the audio geometry."
                },
                {
                  name = "material",
                  type = "AudioMaterial",
                  description = "The acoustic material to use.",
                  default = "'generic'"
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether audio geometry is supported by the current spatializer and the geometry was loaded successfully."
                }
              }
            }
          }
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
          name = "setPose",
          tag = "listener",
          summary = "Set the pose of the listener.",
          description = "Sets the position and orientation of the virtual audio listener.",
          key = "lovr.audio.setPose",
          module = "lovr.audio",
          related = {
            "lovr.audio.setPosition",
            "lovr.audio.setOrientation",
            "Source:setPose"
          },
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the listener, in meters."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the listener, in meters."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the listener, in meters."
                },
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
          name = "setVolume",
          tag = "listener",
          summary = "Set the master volume.",
          description = "Sets the master volume.  All audio sent to the playback device has its volume multiplied by this factor.",
          key = "lovr.audio.setVolume",
          module = "lovr.audio",
          notes = "The volume will be clamped to a 0-1 range (0 dB).",
          variants = {
            {
              arguments = {
                {
                  name = "volume",
                  type = "number",
                  description = "The master volume."
                },
                {
                  name = "units",
                  type = "VolumeUnit",
                  description = "The units of the value.",
                  default = "'linear'"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "start",
          tag = "devices",
          summary = "Start an audio device.",
          description = "Starts the active playback or capture device.  By default the playback device is initialized and started, but this can be controlled using the `t.audio.start` flag in `lovr.conf`.",
          key = "lovr.audio.start",
          module = "lovr.audio",
          notes = "Starting an audio device may fail if:\n\n- The device is already started\n- No device was initialized with `lovr.audio.setDevice`\n- Lack of `audiocapture` permission on Android (see `lovr.system.requestPermission`)\n- Some other problem accessing the audio device",
          related = {
            "lovr.audio.getDevices",
            "lovr.audio.setDevice",
            "lovr.audio.stop",
            "lovr.audio.isStarted",
            "lovr.system.requestPermission",
            "lovr.permission"
          },
          variants = {
            {
              arguments = {
                {
                  name = "type",
                  type = "AudioType",
                  description = "The type of device to start.",
                  default = "'playback'"
                }
              },
              returns = {
                {
                  name = "started",
                  type = "boolean",
                  description = "Whether the device was successfully started."
                }
              }
            }
          }
        },
        {
          name = "stop",
          tag = "devices",
          summary = "Stop an audio device.",
          description = "Stops the active playback or capture device.  This may fail if:\n\n- The device is not started\n- No device was initialized with `lovr.audio.setDevice`",
          key = "lovr.audio.stop",
          module = "lovr.audio",
          notes = "Switching devices with `lovr.audio.setDevice` will stop the existing one.",
          related = {
            "lovr.audio.getDevices",
            "lovr.audio.setDevice",
            "lovr.audio.start",
            "lovr.audio.isStarted"
          },
          variants = {
            {
              arguments = {
                {
                  name = "type",
                  type = "AudioType",
                  description = "The type of device to stop.",
                  default = "'playback'"
                }
              },
              returns = {
                {
                  name = "stopped",
                  type = "boolean",
                  description = "Whether the device was successfully stopped."
                }
              }
            }
          }
        }
      },
      enums = {
        {
          name = "AudioMaterial",
          summary = "Different types of audio materials.",
          description = "Different types of audio material presets, for use with `lovr.audio.setGeometry`.",
          key = "AudioMaterial",
          module = "lovr.audio",
          values = {
            {
              name = "generic",
              description = "Generic default audio material."
            },
            {
              name = "brick",
              description = "Brick."
            },
            {
              name = "carpet",
              description = "Carpet."
            },
            {
              name = "ceramic",
              description = "Ceramic."
            },
            {
              name = "concrete",
              description = "Concrete."
            },
            {
              name = "glass",
              descripion = "Glass."
            },
            {
              name = "gravel",
              descripion = "Gravel."
            },
            {
              name = "metal",
              descripion = "Metal."
            },
            {
              name = "plaster",
              descripion = "Plaster."
            },
            {
              name = "rock",
              descripion = "Rock."
            },
            {
              name = "wood",
              descripion = "Wood."
            }
          }
        },
        {
          name = "AudioShareMode",
          summary = "How audio devices are shared on the system.",
          description = "Audio devices can be created in shared mode or exclusive mode.  In exclusive mode, the audio device is the only one active on the system, which gives better performance and lower latency. However, exclusive devices aren't always supported and might not be allowed, so there is a higher chance that creating one will fail.",
          key = "AudioShareMode",
          module = "lovr.audio",
          related = {
            "lovr.audio.setDevice"
          },
          values = {
            {
              name = "shared",
              description = "Shared mode."
            },
            {
              name = "exclusive",
              description = "Exclusive mode."
            }
          }
        },
        {
          name = "AudioType",
          summary = "Different types of audio devices",
          description = "When referencing audio devices, this indicates whether it's the playback or capture device.",
          key = "AudioType",
          module = "lovr.audio",
          related = {
            "lovr.audio.getDevices",
            "lovr.audio.setDevice",
            "lovr.audio.start",
            "lovr.audio.stop",
            "lovr.audio.isStarted"
          },
          values = {
            {
              name = "playback",
              description = "The playback device (speakers, headphones)."
            },
            {
              name = "capture",
              description = "The capture device (microphone)."
            }
          }
        },
        {
          name = "Effect",
          summary = "Different types of Source effects.",
          description = "Different types of effects that can be applied with `Source:setEffectEnabled`.",
          key = "Effect",
          module = "lovr.audio",
          values = {
            {
              name = "absorption",
              description = "Models absorption as sound travels through the air, water, etc."
            },
            {
              name = "falloff",
              description = "Decreases audio volume with distance (1 / max(distance, 1))."
            },
            {
              name = "occlusion",
              description = "Causes audio to drop off when the Source is occluded by geometry."
            },
            {
              name = "reverb",
              description = "Models reverb caused by audio bouncing off of geometry."
            },
            {
              name = "spatialization",
              description = "Spatializes the Source using either simple panning or an HRTF."
            },
            {
              name = "transmission",
              description = "Causes audio to be heard through walls when occluded, based on audio materials."
            }
          },
          notes = "The active spatializer will determine which effects are supported.  If an unsupported effect is enabled on a Source, no error will be reported.  Instead, it will be silently ignored.\n\nTODO: expose a table of supported effects for spatializers in docs or from Lua."
        },
        {
          name = "TimeUnit",
          summary = "Time units for sound samples.",
          description = "When figuring out how long a Source is or seeking to a specific position in the sound file, units can be expressed in terms of seconds or in terms of frames.  A frame is one set of samples for each channel (one sample for mono, two samples for stereo).",
          key = "TimeUnit",
          module = "lovr.audio",
          values = {
            {
              name = "seconds",
              description = "Seconds."
            },
            {
              name = "frames",
              description = "Frames."
            }
          }
        },
        {
          name = "VolumeUnit",
          summary = "Different units of volume.",
          description = "When accessing the volume of Sources or the audio listener, this can be done in linear units with a 0 to 1 range, or in decibels with a range of -∞ to 0.",
          key = "VolumeUnit",
          module = "lovr.audio",
          values = {
            {
              name = "linear",
              description = "Linear volume range."
            },
            {
              name = "db",
              description = "Decibels."
            }
          }
        }
      },
      sections = {
        {
          name = "Sources",
          tag = "sources",
          description = "Sources are objects that represent a single sound instance."
        },
        {
          name = "Listener",
          tag = "listener",
          description = "The listener is a virtual object in 3D space that \"hears\" all the sounds that are playing. It can be positioned and oriented in 3D space, which controls how Sources in the world are heard.  Usually this would be locked to the headset pose."
        },
        {
          name = "Devices",
          tag = "devices",
          description = "It's possible to list the available audio devices on the system, and pick a specific device to use for either playback or capture.  Devices can also be manually started and stopped. Other useful features of `lovr.audio.setDevice` include the ability to stream all audio data to a custom sink and the option to create a device in exclusive mode for higher performance. By default, the default playback device is automatically initialized and started, but this can be configured using `lovr.conf`."
        }
      }
    },
    {
      name = "data",
      tag = "modules",
      summary = "Exposes low level functions for working with data.",
      description = "The `lovr.data` module provides functions for accessing underlying data representations for several LÖVR objects.",
      key = "lovr.data",
      objects = {
        {
          name = "Blob",
          summary = "A chunk of binary data.",
          description = "A Blob is an object that holds binary data.  It can be passed to most functions that take filename arguments, like `lovr.graphics.newModel` or `lovr.audio.newSource`.  Blobs aren't usually necessary for simple projects, but they can be really helpful if:\n\n- You need to work with low level binary data, potentially using the LuaJIT FFI for increased\n  performance.\n- You are working with data that isn't stored as a file, such as programmatically generated data\n  or a string from a network request.\n- You want to load data from a file once and then use it to create many different objects.\n\nA Blob's size cannot be changed once it is created.",
          key = "Blob",
          module = "lovr.data",
          constructors = {
            "lovr.data.newBlob",
            "lovr.filesystem.newBlob"
          },
          methods = {
            {
              name = "getName",
              summary = "Get the label of the Blob.",
              description = "Returns the filename the Blob was loaded from, or the custom name given to it when it was created.  This label is also used in error messages.",
              key = "Blob:getName",
              module = "lovr.data",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "name",
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
              module = "lovr.data",
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
              module = "lovr.data",
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
              module = "lovr.data",
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
          }
        },
        {
          name = "Image",
          summary = "An object that stores pixel data for Textures.",
          description = "An Image stores raw 2D pixel info for `Texture`s.  It has a width, height, and format.  The Image can be initialized with the contents of an image file or it can be created with uninitialized contents.  The supported image formats are `png`, `jpg`, `hdr`, `dds`, `ktx`, and `astc`.\n\nUsually you can just use Textures, but Image can be useful if you want to manipulate individual pixels, load Textures in a background thread, or use the FFI to efficiently access the raw image data.",
          key = "Image",
          module = "lovr.data",
          constructors = {
            "lovr.data.newImage",
            "Canvas:newImage"
          },
          methods = {
            {
              name = "encode",
              summary = "Encode the Image as png.",
              description = "Encodes the Image to an uncompressed png.  This intended mainly for debugging.",
              key = "Image:encode",
              module = "lovr.data",
              related = {
                "lovr.filesystem.write"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "A new Blob containing the PNG image data."
                    }
                  }
                }
              }
            },
            {
              name = "getBlob",
              summary = "Get the bytes backing this Image as a `Blob`.",
              description = "Returns a Blob containing the raw bytes of the Image.",
              key = "Image:getBlob",
              module = "lovr.data",
              related = {
                "Blob:getPointer",
                "Sound:getBlob"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "The Blob instance containing the bytes for the `Image`."
                    }
                  }
                }
              }
            },
            {
              name = "getDimensions",
              summary = "Get the dimensions of the Image.",
              description = "Returns the dimensions of the Image, in pixels.",
              key = "Image:getDimensions",
              module = "lovr.data",
              related = {
                "Image:getWidth",
                "Image:getHeight",
                "Texture:getDimensions"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the Image, in pixels."
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the Image, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getFormat",
              summary = "Get the pixel format of the Image.",
              description = "Returns the format of the Image.",
              key = "Image:getFormat",
              module = "lovr.data",
              related = {
                "TextureFormat",
                "Texture:getFormat"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format of the pixels in the Image."
                    }
                  }
                }
              }
            },
            {
              name = "getHeight",
              summary = "Get the height of the Image.",
              description = "Returns the height of the Image, in pixels.",
              key = "Image:getHeight",
              module = "lovr.data",
              related = {
                "Image:getWidth",
                "Image:getDimensions",
                "Texture:getHeight"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the Image, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getPixel",
              summary = "Get the value of a pixel of the Image.",
              description = "Returns the value of a pixel of the Image.",
              key = "Image:getPixel",
              module = "lovr.data",
              notes = "The following texture formats are supported: `rgba`, `rgb`, `r32f`, `rg32f`, and `rgba32f`.",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the pixel to get (0-indexed)."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the pixel to get (0-indexed)."
                    }
                  },
                  returns = {
                    {
                      name = "r",
                      type = "number",
                      description = "The red component of the pixel, from 0.0 to 1.0."
                    },
                    {
                      name = "g",
                      type = "number",
                      description = "The green component of the pixel, from 0.0 to 1.0."
                    },
                    {
                      name = "b",
                      type = "number",
                      description = "The blue component of the pixel, from 0.0 to 1.0."
                    },
                    {
                      name = "a",
                      type = "number",
                      description = "The alpha component of the pixel, from 0.0 to 1.0."
                    }
                  }
                }
              },
              related = {
                "Image:setPixel",
                "Texture:replacePixels",
                "TextureFormat"
              }
            },
            {
              name = "getWidth",
              summary = "Get the width of the Image.",
              description = "Returns the width of the Image, in pixels.",
              key = "Image:getWidth",
              module = "lovr.data",
              related = {
                "Image:getHeight",
                "Image:getDimensions",
                "Texture:getWidth"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the Image, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "paste",
              summary = "Copy pixels from another Image to this one.",
              description = "Copies a rectangle of pixels from one Image to this one.",
              key = "Image:paste",
              module = "lovr.data",
              notes = "The two Images must have the same pixel format.\n\nCompressed images cannot be copied.\n\nThe rectangle cannot go outside the dimensions of the source or destination textures.",
              variants = {
                {
                  arguments = {
                    {
                      name = "source",
                      type = "Image",
                      description = "The Image to copy pixels from."
                    },
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate to paste to (0-indexed).",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate to paste to (0-indexed).",
                      default = "0"
                    },
                    {
                      name = "fromX",
                      type = "number",
                      description = "The x coordinate in the source to paste from (0-indexed).",
                      default = "0"
                    },
                    {
                      name = "fromY",
                      type = "number",
                      description = "The y coordinate in the source to paste from (0-indexed).",
                      default = "0"
                    },
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the region to copy.",
                      default = "source:getWidth()"
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the region to copy.",
                      default = "source:getHeight()"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Texture:replacePixels",
                "Image:getPixel",
                "Image:setPixel"
              }
            },
            {
              name = "setPixel",
              summary = "Set the value of a pixel of the Image.",
              description = "Sets the value of a pixel of the Image.",
              key = "Image:setPixel",
              module = "lovr.data",
              notes = "The following texture formats are supported: `rgba`, `rgb`, `r32f`, `rg32f`, and `rgba32f`.",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the pixel to set (0-indexed)."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the pixel to set (0-indexed)."
                    },
                    {
                      name = "r",
                      type = "number",
                      description = "The red component of the pixel, from 0.0 to 1.0."
                    },
                    {
                      name = "g",
                      type = "number",
                      description = "The green component of the pixel, from 0.0 to 1.0."
                    },
                    {
                      name = "b",
                      type = "number",
                      description = "The blue component of the pixel, from 0.0 to 1.0."
                    },
                    {
                      name = "a",
                      type = "number",
                      description = "The alpha component of the pixel, from 0.0 to 1.0.",
                      default = "1.0"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Image:getPixel",
                "Texture:replacePixels",
                "TextureFormat"
              }
            }
          }
        },
        {
          name = "ModelData",
          summary = "An object that loads and stores data for 3D models.",
          description = "A ModelData is a container object that loads and holds data contained in 3D model files.  This can include a variety of things like the node structure of the asset, the vertex data it contains, contains, the `Image` and `Material` properties, and any included animations.\n\nThe current supported formats are OBJ, glTF, and STL.\n\nUsually you can just load a `Model` directly, but using a `ModelData` can be helpful if you want to load models in a thread or access more low-level information about the Model.",
          key = "ModelData",
          module = "lovr.data",
          constructors = {
            "lovr.data.newModelData"
          },
          methods = {}
        },
        {
          name = "Rasterizer",
          summary = "An object that rasterizes glyphs from font files.",
          description = "A Rasterizer is an object that parses a TTF file, decoding and rendering glyphs from it.\n\nUsually you can just use `Font` objects.",
          key = "Rasterizer",
          module = "lovr.data",
          constructors = {
            "lovr.data.newRasterizer"
          },
          methods = {
            {
              name = "getAdvance",
              summary = "Get the advance of the font.",
              description = "Returns the advance metric of the font, in pixels.  The advance is how many pixels the font advances horizontally after each glyph is rendered.  This does not include kerning.",
              key = "Rasterizer:getAdvance",
              module = "lovr.data",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "advance",
                      type = "number",
                      description = "The advance of the font, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getAscent",
              summary = "Get the ascent of the font.",
              description = "Returns the ascent metric of the font, in pixels.  The ascent represents how far any glyph of the font ascends above the baseline.",
              key = "Rasterizer:getAscent",
              module = "lovr.data",
              related = {
                "Rasterizer:getDescent",
                "Font:getAscent"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "ascent",
                      type = "number",
                      description = "The ascent of the font, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getDescent",
              summary = "Get the descent of the font.",
              description = "Returns the descent metric of the font, in pixels.  The descent represents how far any glyph of the font descends below the baseline.",
              key = "Rasterizer:getDescent",
              module = "lovr.data",
              related = {
                "Rasterzer:getAscent",
                "Font:getDescent"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "descent",
                      type = "number",
                      description = "The descent of the font, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getGlyphCount",
              summary = "Get the number of glyphs stored in the font file.",
              description = "Returns the number of glyphs stored in the font file.",
              key = "Rasterizer:getGlyphCount",
              module = "lovr.data",
              related = {
                "Rasterizer:hasGlyphs"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of glyphs stored in the font file."
                    }
                  }
                }
              }
            },
            {
              name = "getHeight",
              summary = "Get the height of the font.",
              description = "Returns the height metric of the font, in pixels.",
              key = "Rasterizer:getHeight",
              module = "lovr.data",
              related = {
                "Font:getHeight"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the font, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "getLineHeight",
              summary = "Get the line height of the font.",
              description = "Returns the line height metric of the font, in pixels.  This is how far apart lines are.",
              key = "Rasterizer:getLineHeight",
              module = "lovr.data",
              related = {
                "Rasterizer:getHeight",
                "Font:getLineHeight",
                "Font:setLineHeight"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "height",
                      type = "number",
                      description = "The line height of the font, in pixels."
                    }
                  }
                }
              }
            },
            {
              name = "hasGlyphs",
              summary = "Get whether the Rasterizer can rasterize a set of glyphs.",
              description = "Check if the Rasterizer can rasterize a set of glyphs.",
              key = "Rasterizer:hasGlyphs",
              module = "lovr.data",
              related = {
                "Rasterizer:getGlyphCount"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "...",
                      type = "*",
                      description = "Strings (sets of characters) or numbers (character codes) to check for."
                    }
                  },
                  returns = {
                    {
                      name = "hasGlyphs",
                      type = "boolean",
                      description = "true if the Rasterizer can rasterize all of the supplied characters, false otherwise."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "Sound",
          summary = "An object that holds raw audio samples.",
          description = "A Sound stores the data for a sound.  The supported sound formats are OGG, WAV, and MP3.  Sounds cannot be played directly.  Instead, there are `Source` objects in `lovr.audio` that are used for audio playback.  All Source objects are backed by one of these Sounds, and multiple Sources can share a single Sound to reduce memory usage.\n\nMetadata\n---\n\nSounds hold a fixed number of frames.  Each frame contains one audio sample for each channel. The `SampleFormat` of the Sound is the data type used for each sample (floating point, integer, etc.).  The Sound has a `ChannelLayout`, representing the number of audio channels and how they map to speakers (mono, stereo, etc.).  The sample rate of the Sound indicates how many frames should be played per second.  The duration of the sound (in seconds) is the number of frames divided by the sample rate.\n\nCompression\n---\n\nSounds can be compressed.  Compressed sounds are stored compressed in memory and are decoded as they are played.  This uses a lot less memory but increases CPU usage during playback.  OGG and MP3 are compressed audio formats.  When creating a sound from a compressed format, there is an option to immediately decode it, storing it uncompressed in memory.  It can be a good idea to decode short sound effects, since they won't use very much memory even when uncompressed and it will improve CPU usage.  Compressed sounds can not be written to using `Sound:setFrames`.\n\nStreams\n---\n\nSounds can be created as a stream by passing `'stream'` as their contents when creating them. Audio frames can be written to the end of the stream, and read from the beginning.  This works well for situations where data is being generated in real time or streamed in from some other data source.\n\nSources can be backed by a stream and they'll just play whatever audio is pushed to the stream. The audio module also lets you use a stream as a \"sink\" for an audio device.  For playback devices, this works like loopback, so the mixed audio from all playing Sources will get written to the stream.  For capture devices, all the microphone input will get written to the stream. Conversion between sample formats, channel layouts, and sample rates will happen automatically.\n\nKeep in mind that streams can still only hold a fixed number of frames.  If too much data is written before it is read, older frames will start to get overwritten.  Similary, it's possible to read too much data without writing fast enough.\n\nAmbisonics\n---\n\nAmbisonic sounds can be imported from WAVs, but can not yet be played.  Sounds with a `ChannelLayout` of `ambisonic` are stored as first-order full-sphere ambisonics using the AmbiX format (ACN channel ordering and SN3D channel normalization).  The AMB format is supported for import and will automatically get converted to AmbiX.  See `lovr.data.newSound` for more info.",
          key = "Sound",
          module = "lovr.data",
          constructors = {
            "lovr.data.newSound"
          },
          methods = {
            {
              name = "getBlob",
              summary = "Get the bytes backing this Sound as a Blob.",
              description = "Returns a Blob containing the raw bytes of the Sound.",
              key = "Sound:getBlob",
              module = "lovr.data",
              notes = "Samples for each channel are stored interleaved.  The data type of each sample is given by `Sound:getFormat`.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "The Blob instance containing the bytes for the `Sound`."
                    }
                  }
                }
              },
              related = {
                "Blob:getPointer",
                "Image:getBlob"
              }
            },
            {
              name = "getChannelCount",
              summary = "Get the number of channels in the Sound.",
              description = "Returns the number of channels in the Sound.  Mono sounds have 1 channel, stereo sounds have 2 channels, and ambisonic sounds have 4 channels.",
              key = "Sound:getChannelCount",
              module = "lovr.data",
              related = {
                "Sound:getChannelLayout"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "channels",
                      type = "number",
                      description = "The number of channels in the sound."
                    }
                  }
                }
              }
            },
            {
              name = "getChannelLayout",
              summary = "Get the channel layout of the Sound.",
              description = "Returns the channel layout of the Sound.",
              key = "Sound:getChannelLayout",
              module = "lovr.data",
              related = {
                "Sound:getChannelCount"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "channels",
                      type = "ChannelLayout",
                      description = "The channel layout."
                    }
                  }
                }
              }
            },
            {
              name = "getDuration",
              summary = "Get the duration of the Sound.",
              description = "Returns the duration of the Sound, in seconds.",
              key = "Sound:getDuration",
              module = "lovr.data",
              notes = "This can be computed as `(frameCount / sampleRate)`.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "duration",
                      type = "number",
                      description = "The duration of the Sound, in seconds."
                    }
                  }
                }
              },
              related = {
                "Sound:getFrameCount",
                "Sound:getSampleCount",
                "Sound:getSampleRate",
                "Source:getDuration"
              }
            },
            {
              name = "getFormat",
              summary = "Get the sample format of the Sound.",
              description = "Returns the sample format of the Sound.",
              key = "Sound:getFormat",
              module = "lovr.data",
              related = {
                "Sound:getChannelLayout",
                "Sound:getSampleRate"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "format",
                      type = "SampleFormat",
                      description = "The data type of each sample."
                    }
                  }
                }
              }
            },
            {
              name = "getFrameCount",
              summary = "Get the number of frames in the Sound.",
              description = "Returns the number of frames in the Sound.  A frame stores one sample for each channel.",
              key = "Sound:getFrameCount",
              module = "lovr.data",
              notes = "For streams, this returns the number of frames in the stream's buffer.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "frames",
                      type = "number",
                      description = "The number of frames in the Sound."
                    }
                  }
                }
              },
              related = {
                "Sound:getDuration",
                "Sound:getSampleCount",
                "Sound:getChannelCount"
              }
            },
            {
              name = "getFrames",
              summary = "Read frames from the Sound.",
              description = "Reads frames from the Sound into a table, Blob, or another Sound.",
              key = "Sound:getFrames",
              module = "lovr.data",
              variants = {
                {
                  arguments = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames to read.  If nil, reads as many frames as possible.\n\nCompressed sounds will automatically be decoded.\n\nReading from a stream will ignore the source offset and read the oldest frames.",
                      default = "nil"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame offset to apply to the sound when reading frames.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "t",
                      type = "table",
                      description = "A table containing audio frames."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames read."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "t",
                      type = "table",
                      description = "An existing table to read frames into."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames to read.  If nil, reads as many frames as possible.\n\nCompressed sounds will automatically be decoded.\n\nReading from a stream will ignore the source offset and read the oldest frames.",
                      default = "nil"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame offset to apply to the sound when reading frames.",
                      default = "0"
                    },
                    {
                      name = "dstOffset",
                      type = "number",
                      description = "An offset to apply to the destination when writing frames (indices for tables, bytes for Blobs, frames for Sounds).",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "t",
                      type = "table",
                      description = "A table containing audio frames."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames read."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "A Blob to read frames into."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames to read.  If nil, reads as many frames as possible.\n\nCompressed sounds will automatically be decoded.\n\nReading from a stream will ignore the source offset and read the oldest frames.",
                      default = "nil"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame offset to apply to the sound when reading frames.",
                      default = "0"
                    },
                    {
                      name = "dstOffset",
                      type = "number",
                      description = "An offset to apply to the destination when writing frames (indices for tables, bytes for Blobs, frames for Sounds).",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames read."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "sound",
                      type = "Sound",
                      description = "Another Sound to copy frames into."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames to read.  If nil, reads as many frames as possible.\n\nCompressed sounds will automatically be decoded.\n\nReading from a stream will ignore the source offset and read the oldest frames.",
                      default = "nil"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame offset to apply to the sound when reading frames.",
                      default = "0"
                    },
                    {
                      name = "dstOffset",
                      type = "number",
                      description = "An offset to apply to the destination when writing frames (indices for tables, bytes for Blobs, frames for Sounds).",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames read."
                    }
                  }
                }
              }
            },
            {
              name = "getSampleCount",
              summary = "Get the number of samples in the Sound.",
              description = "Returns the total number of samples in the Sound.",
              key = "Sound:getSampleCount",
              module = "lovr.data",
              notes = "For streams, this returns the number of samples in the stream's buffer.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "samples",
                      type = "number",
                      description = "The total number of samples in the Sound."
                    }
                  }
                }
              },
              related = {
                "Sound:getDuration",
                "Sound:getFrameCount",
                "Sound:getChannelCount"
              }
            },
            {
              name = "getSampleRate",
              summary = "Get the sample rate of the Sound.",
              description = "Returns the sample rate of the Sound, in Hz.  This is the number of frames that are played every second.  It's usually a high number like 48000.",
              key = "Sound:getSampleRate",
              module = "lovr.data",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "frequency",
                      type = "number",
                      description = "The number of frames per second in the Sound."
                    }
                  }
                }
              }
            },
            {
              name = "isCompressed",
              summary = "Check if the Sound is compressed.",
              description = "Returns whether the Sound is compressed.  Compressed sounds are loaded from compressed audio formats like MP3 and OGG.  They use a lot less memory but require some extra CPU work during playback.  Compressed sounds can not be modified using `Sound:setFrames`.",
              key = "Sound:isCompressed",
              module = "lovr.data",
              related = {
                "Sound:isStream",
                "lovr.data.newSound"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "compressed",
                      type = "boolean",
                      description = "Whether the Sound is compressed."
                    }
                  }
                }
              }
            },
            {
              name = "isStream",
              summary = "Check if the Sound is a stream.",
              description = "Returns whether the Sound is a stream.",
              key = "Sound:isStream",
              module = "lovr.data",
              related = {
                "Sound:isCompressed",
                "lovr.data.newSound"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "stream",
                      type = "boolean",
                      description = "Whether the Sound is a stream."
                    }
                  }
                }
              }
            },
            {
              name = "setFrames",
              summary = "Write frames to the Sound.",
              description = "Writes frames to the Sound.",
              key = "Sound:setFrames",
              module = "lovr.data",
              variants = {
                {
                  arguments = {
                    {
                      name = "t",
                      type = "table",
                      description = "A table containing frames to write."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "How many frames to write.  If nil, writes as many as possible.",
                      default = "nil"
                    },
                    {
                      name = "dstOffset",
                      type = "number",
                      description = "A frame offset to apply when writing the frames.",
                      default = "0"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame, byte, or index offset to apply when reading frames from the source.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames written."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "A Blob containing frames to write."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "How many frames to write.  If nil, writes as many as possible.",
                      default = "nil"
                    },
                    {
                      name = "dstOffset",
                      type = "number",
                      description = "A frame offset to apply when writing the frames.",
                      default = "0"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame, byte, or index offset to apply when reading frames from the source.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames written."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "sound",
                      type = "Sound",
                      description = "Another Sound to copy frames from."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "How many frames to write.  If nil, writes as many as possible.",
                      default = "nil"
                    },
                    {
                      name = "dstOffset",
                      type = "number",
                      description = "A frame offset to apply when writing the frames.",
                      default = "0"
                    },
                    {
                      name = "srcOffset",
                      type = "number",
                      description = "A frame, byte, or index offset to apply when reading frames from the source.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of frames written."
                    }
                  }
                }
              },
              examples = {
                {
                  description = "Generate a sine wave.",
                  code = "function lovr.load()\n  local length = 1\n  local rate = 48000\n  local frames = length * rate\n  local frequency = 440\n  local volume = 1.0\n\n  sound = lovr.data.newSound(frames, 'f32', 'stereo', rate)\n\n  local data = {}\n  for i = 1, frames do\n    local amplitude = math.sin((i - 1) * frequency / rate * (2 * math.pi)) * volume\n    data[2 * i - 1] = amplitude\n    data[2 * i - 0] = amplitude\n  end\n\n  sound:setFrames(data)\n\n  source = lovr.audio.newSource(sound)\n  source:setLooping(true)\n  source:play()\nend"
                }
              }
            }
          }
        }
      },
      functions = {
        {
          name = "newBlob",
          summary = "Create a new Blob.",
          description = "Creates a new Blob.",
          key = "lovr.data.newBlob",
          module = "lovr.data",
          related = {
            "lovr.filesystem.newBlob"
          },
          variants = {
            {
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The amount of data to allocate for the Blob, in bytes.  All of the bytes will be filled with zeroes."
                },
                {
                  name = "name",
                  type = "string",
                  description = "A name for the Blob (used in error messages)",
                  default = "''"
                }
              },
              returns = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The new Blob."
                }
              }
            },
            {
              arguments = {
                {
                  name = "contents",
                  type = "string",
                  description = "A string to use for the Blob's contents."
                },
                {
                  name = "name",
                  type = "string",
                  description = "A name for the Blob (used in error messages)",
                  default = "''"
                }
              },
              returns = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The new Blob."
                }
              }
            },
            {
              arguments = {
                {
                  name = "source",
                  type = "Blob",
                  description = "A Blob to copy the contents from."
                },
                {
                  name = "name",
                  type = "string",
                  description = "A name for the Blob (used in error messages)",
                  default = "''"
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
          name = "newImage",
          summary = "Create a new Image.",
          description = "Creates a new Image.  Image data can be loaded and decoded from an image file, or a raw block of pixels with a specified width, height, and format can be created.",
          key = "lovr.data.newImage",
          module = "lovr.data",
          notes = "The supported image file formats are png, jpg, hdr, dds (DXT1, DXT3, DXT5), ktx, and astc.\n\nOnly 2D textures are supported for DXT/ASTC.\n\nCurrently textures loaded as KTX need to be in DXT/ASTC formats.",
          variants = {
            {
              description = "Load image data from a file.",
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the image to load."
                },
                {
                  name = "flip",
                  type = "boolean",
                  description = "Whether to vertically flip the image on load.  This should be true for normal textures, and false for textures that are going to be used in a cubemap.",
                  default = "true"
                }
              },
              returns = {
                {
                  name = "image",
                  type = "Image",
                  description = "The new Image."
                }
              }
            },
            {
              description = "Create an Image with a given size and pixel format.",
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the texture."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the texture."
                },
                {
                  name = "format",
                  type = "TextureFormat",
                  description = "The format of the texture's pixels.",
                  default = "rgba"
                },
                {
                  name = "data",
                  type = "Blob",
                  description = "Raw pixel values to use as the contents.  If `nil`, the data will all be zero.",
                  default = "nil"
                }
              },
              returns = {
                {
                  name = "image",
                  type = "Image",
                  description = "The new Image."
                }
              }
            },
            {
              description = "Clone an existing Image.",
              arguments = {
                {
                  name = "source",
                  type = "Image",
                  description = "The Image to clone."
                }
              },
              returns = {
                {
                  name = "image",
                  type = "Image",
                  description = "The new Image."
                }
              }
            },
            {
              description = "Decode image data from a Blob.",
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The Blob containing image data to decode."
                },
                {
                  name = "flip",
                  type = "boolean",
                  description = "Whether to vertically flip the image on load.  This should be true for normal textures, and false for textures that are going to be used in a cubemap.",
                  default = "true"
                }
              },
              returns = {
                {
                  name = "image",
                  type = "Image",
                  description = "The new Image."
                }
              }
            }
          }
        },
        {
          name = "newModelData",
          summary = "Create a new ModelData.",
          description = "Loads a 3D model from a file.  The supported 3D file formats are OBJ and glTF.",
          key = "lovr.data.newModelData",
          module = "lovr.data",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the model to load."
                }
              },
              returns = {
                {
                  name = "modelData",
                  type = "ModelData",
                  description = "The new ModelData."
                }
              }
            },
            {
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The Blob containing data for a model to decode."
                }
              },
              returns = {
                {
                  name = "modelData",
                  type = "ModelData",
                  description = "The new ModelData."
                }
              }
            }
          }
        },
        {
          name = "newRasterizer",
          summary = "Create a new Rasterizer.",
          description = "Creates a new Rasterizer from a TTF file.",
          key = "lovr.data.newRasterizer",
          module = "lovr.data",
          variants = {
            {
              description = "Create a Rasterizer for the default font included with LÖVR (Varela Round).",
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The resolution to render the fonts at, in pixels.  Higher resolutions use more memory and processing power but may provide better quality results for some fonts/situations.",
                  default = "32"
                }
              },
              returns = {
                {
                  name = "rasterizer",
                  type = "Rasterizer",
                  description = "The new Rasterizer."
                }
              }
            },
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the font file to load."
                },
                {
                  name = "size",
                  type = "number",
                  description = "The resolution to render the fonts at, in pixels.  Higher resolutions use more memory and processing power but may provide better quality results for some fonts/situations.",
                  default = "32"
                }
              },
              returns = {
                {
                  name = "rasterizer",
                  type = "Rasterizer",
                  description = "The new Rasterizer."
                }
              }
            },
            {
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The Blob containing font data."
                },
                {
                  name = "size",
                  type = "number",
                  description = "The resolution to render the fonts at, in pixels.  Higher resolutions use more memory and processing power but may provide better quality results for some fonts/situations.",
                  default = "32"
                }
              },
              returns = {
                {
                  name = "rasterizer",
                  type = "Rasterizer",
                  description = "The new Rasterizer."
                }
              }
            }
          }
        },
        {
          name = "newSound",
          summary = "Create a new Sound.",
          description = "Creates a new Sound.  A sound can be loaded from an audio file, or it can be created empty with capacity for a certain number of audio frames.\n\nWhen loading audio from a file, use the `decode` option to control whether compressed audio should remain compressed or immediately get decoded to raw samples.\n\nWhen creating an empty sound, the `contents` parameter can be set to `'stream'` to create an audio stream.  On streams, `Sound:setFrames` will always write to the end of the stream, and `Sound:getFrames` will always read the oldest samples from the beginning.  The number of frames in the sound is the total capacity of the stream's buffer.",
          key = "lovr.data.newSound",
          module = "lovr.data",
          notes = "It is highly recommended to use an audio format that matches the format of the audio module: `f32` sample formats at a sample rate of 48000, with 1 channel for spatialized sources or 2 channels for unspatialized sources.  This will avoid the need to convert audio during playback, which boosts performance of the audio thread.\n\nThe WAV importer supports 16, 24, and 32 bit integer data and 32 bit floating point data.  The data must be mono, stereo, or 4-channel full-sphere ambisonic.  The `WAVE_FORMAT_EXTENSIBLE` extension is supported.\n\nAmbisonic channel layouts are supported for import (but not yet for playback).  Ambisonic data can be loaded from WAV files.  It must be first-order full-sphere ambisonic data with 4 channels.  If the WAV has a `WAVE_FORMAT_EXTENSIBLE` chunk with an `AMBISONIC_B_FORMAT` format GUID, then the data is understood as using the AMB format with Furse-Malham channel ordering and normalization.  *All other* 4-channel files are assumed to be using the AmbiX format with ACN channel ordering and SN3D normalization.  AMB files will get automatically converted to AmbiX on import, so ambisonic Sounds will always be in a consistent format.\n\nOGG and MP3 files will always have the `f32` format when loaded.",
          variants = {
            {
              description = "Create a raw or stream Sound from a frame count and format info:",
              arguments = {
                {
                  name = "frames",
                  type = "number",
                  description = "The number of frames the Sound can hold."
                },
                {
                  name = "format",
                  type = "SampleFormat",
                  description = "The sample data type.",
                  default = "'f32'"
                },
                {
                  name = "channels",
                  type = "ChannelLayout",
                  description = "The channel layout.",
                  default = "'stereo'"
                },
                {
                  name = "sampleRate",
                  type = "number",
                  description = "The sample rate, in Hz.",
                  default = "48000"
                },
                {
                  name = "contents",
                  type = "*",
                  description = "A Blob containing raw audio samples to use as the initial contents, 'stream' to create an audio stream, or `nil` to leave the data initialized to zero.",
                  default = "nil"
                }
              },
              returns = {
                {
                  name = "sound",
                  type = "Sound",
                  description = "Sounds good."
                }
              }
            },
            {
              description = "Load a sound from a file.  Compressed audio formats (OGG, MP3) can optionally be decoded into raw sounds.",
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of a sound to load."
                },
                {
                  name = "decode",
                  type = "boolean",
                  description = "Whether compressed audio files should be immediately decoded."
                }
              },
              returns = {
                {
                  name = "sound",
                  type = "Sound",
                  description = "Sounds good."
                }
              }
            },
            {
              description = "Load a sound from a Blob containing the data of an audio file.  Compressed audio formats (OGG, MP3) can optionally be decoded into raw sounds.\n\nIf the Blob contains raw audio samples, use the first variant instead of this one.",
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The Blob containing audio file data to load."
                },
                {
                  name = "decode",
                  type = "boolean",
                  description = "Whether compressed audio files should be immediately decoded."
                }
              },
              returns = {
                {
                  name = "sound",
                  type = "Sound",
                  description = "Sounds good."
                }
              }
            }
          }
        }
      },
      enums = {
        {
          name = "ChannelLayout",
          summary = "Different channel layouts for Sounds.",
          description = "Sounds can have different numbers of channels, and those channels can map to various speaker layouts.",
          key = "ChannelLayout",
          module = "lovr.data",
          related = {
            "lovr.data.newSound",
            "Sound:getFormat"
          },
          values = {
            {
              name = "mono",
              description = "1 channel."
            },
            {
              name = "stereo",
              description = "2 channels.  The first channel is for the left speaker and the second is for the right."
            },
            {
              name = "ambisonic",
              description = "4 channels.  Ambisonic channels don't map directly to speakers but instead represent directions in 3D space, sort of like the images of a skybox.  Currently, ambisonic sounds can only be loaded, not played."
            }
          }
        },
        {
          name = "SampleFormat",
          summary = "Different data types for samples in a Sound.",
          description = "Sounds can store audio samples as 16 bit integers or 32 bit floats.",
          key = "SampleFormat",
          module = "lovr.data",
          related = {
            "lovr.data.newSound",
            "Sound:getFormat"
          },
          values = {
            {
              name = "f32",
              description = "32 bit floating point samples (between -1.0 and 1.0)."
            },
            {
              name = "i16",
              description = "16 bit integer samples (between -32768 and 32767)."
            }
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
      enums = {
        {
          name = "KeyCode",
          summary = "Keys that can be pressed.",
          description = "Keys that can be pressed on a keyboard.  Notably, numpad keys are missing right now.",
          key = "KeyCode",
          module = "lovr.event",
          related = {
            "lovr.keypressed",
            "lovr.keyreleased"
          },
          values = {
            {
              name = "a",
              description = "The A key."
            },
            {
              name = "b",
              description = "The B key."
            },
            {
              name = "c",
              description = "The C key."
            },
            {
              name = "d",
              description = "The D key."
            },
            {
              name = "e",
              description = "The E key."
            },
            {
              name = "f",
              description = "The F key."
            },
            {
              name = "g",
              description = "The G key."
            },
            {
              name = "h",
              description = "The H key."
            },
            {
              name = "i",
              description = "The I key."
            },
            {
              name = "j",
              description = "The J key."
            },
            {
              name = "k",
              description = "The K key."
            },
            {
              name = "l",
              description = "The L key."
            },
            {
              name = "m",
              description = "The M key."
            },
            {
              name = "n",
              description = "The N key."
            },
            {
              name = "o",
              description = "The O key."
            },
            {
              name = "p",
              description = "The P key."
            },
            {
              name = "q",
              description = "The Q key."
            },
            {
              name = "r",
              description = "The R key."
            },
            {
              name = "s",
              description = "The S key."
            },
            {
              name = "t",
              description = "The T key."
            },
            {
              name = "u",
              description = "The U key."
            },
            {
              name = "v",
              description = "The V key."
            },
            {
              name = "w",
              description = "The W key."
            },
            {
              name = "x",
              description = "The X key."
            },
            {
              name = "y",
              description = "The Y key."
            },
            {
              name = "z",
              description = "The Z key."
            },
            {
              name = "0",
              description = "The 0 key."
            },
            {
              name = "1",
              description = "The 1 key."
            },
            {
              name = "2",
              description = "The 2 key."
            },
            {
              name = "3",
              description = "The 3 key."
            },
            {
              name = "4",
              description = "The 4 key."
            },
            {
              name = "5",
              description = "The 5 key."
            },
            {
              name = "6",
              description = "The 6 key."
            },
            {
              name = "7",
              description = "The 7 key."
            },
            {
              name = "8",
              description = "The 8 key."
            },
            {
              name = "9",
              description = "The 9 key."
            },
            {
              name = "space",
              description = "The space bar."
            },
            {
              name = "return",
              description = "The enter key."
            },
            {
              name = "tab",
              description = "The tab key."
            },
            {
              name = "escape",
              description = "The escape key."
            },
            {
              name = "backspace",
              description = "The backspace key."
            },
            {
              name = "up",
              description = "The up arrow key."
            },
            {
              name = "down",
              description = "The down arrow key."
            },
            {
              name = "left",
              description = "The left arrow key."
            },
            {
              name = "right",
              description = "The right arrow key."
            },
            {
              name = "home",
              description = "The home key."
            },
            {
              name = "end",
              description = "The end key."
            },
            {
              name = "pageup",
              description = "The page up key."
            },
            {
              name = "pagedown",
              description = "The page down key."
            },
            {
              name = "insert",
              description = "The insert key."
            },
            {
              name = "delete",
              description = "The delete key."
            },
            {
              name = "f1",
              description = "The F1 key."
            },
            {
              name = "f2",
              description = "The F2 key."
            },
            {
              name = "f3",
              description = "The F3 key."
            },
            {
              name = "f4",
              description = "The F4 key."
            },
            {
              name = "f5",
              description = "The F5 key."
            },
            {
              name = "f6",
              description = "The F6 key."
            },
            {
              name = "f7",
              description = "The F7 key."
            },
            {
              name = "f8",
              description = "The F8 key."
            },
            {
              name = "f9",
              description = "The F9 key."
            },
            {
              name = "f10",
              description = "The F10 key."
            },
            {
              name = "f11",
              description = "The F11 key."
            },
            {
              name = "f12",
              description = "The F12 key."
            },
            {
              name = "`",
              description = "The backtick/backquote/grave accent key."
            },
            {
              name = "-",
              description = "The dash/hyphen/minus key."
            },
            {
              name = "=",
              description = "The equal sign key."
            },
            {
              name = "[",
              description = "The left bracket key."
            },
            {
              name = "]",
              description = "The right bracket key."
            },
            {
              name = "\\",
              description = "The backslash key."
            },
            {
              name = ";",
              description = "The semicolon key."
            },
            {
              name = "'",
              description = "The single quote key."
            },
            {
              name = ",",
              description = "The comma key."
            },
            {
              name = ".",
              description = "The period key."
            },
            {
              name = "/",
              description = "The slash key."
            },
            {
              name = "lctrl",
              description = "The left control key."
            },
            {
              name = "lshift",
              description = "The left shift key."
            },
            {
              name = "lalt",
              description = "The left alt key."
            },
            {
              name = "lgui",
              description = "The left OS key (windows, command, super)."
            },
            {
              name = "rctrl",
              description = "The right control key."
            },
            {
              name = "rshift",
              description = "The right shift key."
            },
            {
              name = "ralt",
              description = "The right alt key."
            },
            {
              name = "rgui",
              description = "The right OS key (windows, command, super)."
            },
            {
              name = "capslock",
              description = "The caps lock key."
            },
            {
              name = "scrolllock",
              description = "The scroll lock key."
            },
            {
              name = "numlock",
              description = "The numlock key."
            }
          }
        }
      },
      examples = {
        {
          description = "Adding a custom event.",
          code = "function lovr.load()\n  lovr.handlers['customevent'] = function(a, b, c)\n    print('custom event handled with args:', a, b, c)\n  end\n\n  lovr.event.push('customevent', 1, 2, 3)\nend"
        }
      },
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
          description = "This function returns a Lua iterator for all of the unprocessed items in the event queue.  Each event consists of a name as a string, followed by event-specific arguments.  This function is called in the default implementation of `lovr.run`, so it is normally not necessary to poll for events yourself.",
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
          description = "Fills the event queue with unprocessed events from the operating system.  This function should be called often, otherwise the operating system will consider the application unresponsive. This function is called in the default implementation of `lovr.run`.",
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
          notes = "Only nil, booleans, numbers, strings, and LÖVR objects are supported types for event data.",
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
                  description = "The arguments for the event.  Currently, up to 4 are supported."
                }
              },
              returns = {}
            }
          },
          related = {
            "lovr.event.poll",
            "lovr.event.quit"
          }
        },
        {
          name = "quit",
          summary = "Quit the application.",
          description = "Pushes an event to quit.  An optional number can be passed to set the exit code for the application.  An exit code of zero indicates normal termination, whereas a nonzero exit code indicates that an error occurred.",
          key = "lovr.event.quit",
          module = "lovr.event",
          notes = "This function is equivalent to calling `lovr.event.push('quit', <args>)`.\n\nThe event won't be processed until the next time `lovr.event.poll` is called.\n\nThe `lovr.quit` callback will be called when the event is processed, which can be used to do any cleanup work.  The callback can also return `false` to abort the quitting process.",
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
          related = {
            "lovr.quit",
            "lovr.event.poll",
            "lovr.event.restart"
          }
        },
        {
          name = "restart",
          summary = "Restart the application.",
          description = "Pushes an event to restart the framework.",
          key = "lovr.event.restart",
          module = "lovr.event",
          notes = "The event won't be processed until the next time `lovr.event.poll` is called.\n\nThe `lovr.restart` callback can be used to persist a value between restarts.",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          },
          related = {
            "lovr.restart",
            "lovr.event.poll",
            "lovr.event.quit"
          }
        }
      },
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
      objects = {},
      functions = {
        {
          name = "append",
          summary = "Append content to the end of a file.",
          description = "Appends content to the end of a file.",
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
                  description = "The number of bytes actually appended to the file."
                }
              }
            },
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The file to append to."
                },
                {
                  name = "blob",
                  type = "Blob",
                  description = "A Blob containing data to append to the file."
                }
              },
              returns = {
                {
                  name = "bytes",
                  type = "number",
                  description = "The number of bytes actually appended to the file."
                }
              }
            }
          }
        },
        {
          name = "createDirectory",
          summary = "Create a directory.",
          description = "Creates a directory in the save directory.  Any parent directories that don't exist will also be created.",
          key = "lovr.filesystem.createDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The directory to create, recursively."
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
          name = "getAppdataDirectory",
          summary = "Get the application data directory.",
          description = "Returns the application data directory.  This will be something like:\n\n- `C:\\Users\\user\\AppData\\Roaming` on Windows.\n- `/home/user/.config` on Linux.\n- `/Users/user/Library/Application Support` on macOS.",
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
          summary = "Get a list of files in a directory.",
          description = "Returns a sorted table containing all files and folders in a single directory.",
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
                  description = "The absolute path of the LÖVR executable, or `nil` if it is unknown."
                }
              }
            }
          }
        },
        {
          name = "getIdentity",
          summary = "Get the name of the save directory.",
          description = "Returns the identity of the game, which is used as the name of the save directory.  The default is `default`.  It can be changed using `t.identity` in `lovr.conf`.",
          key = "lovr.filesystem.getIdentity",
          module = "lovr.filesystem",
          notes = "On Android, this is always the package id (like `org.lovr.app`).",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "identity",
                  type = "string",
                  description = "The name of the save directory, or `nil` if it isn't set."
                }
              }
            }
          }
        },
        {
          name = "getLastModified",
          summary = "Get the modification time of a file.",
          description = "Returns when a file was last modified, since some arbitrary time in the past.",
          key = "lovr.filesystem.getLastModified",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The file to check."
                }
              },
              returns = {
                {
                  name = "time",
                  type = "number",
                  description = "The modification time of the file, in seconds, or `nil` if it's unknown."
                }
              }
            }
          }
        },
        {
          name = "getRealDirectory",
          summary = "Get the absolute path to a file.",
          description = "Get the absolute path of the mounted archive containing a path in the virtual filesystem.  This can be used to determine if a file is in the game's source directory or the save directory.",
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
                  description = "The absolute path of the mounted archive containing `path`."
                }
              }
            }
          }
        },
        {
          name = "getRequirePath",
          summary = "Get the require path.",
          description = "Returns the require path.  The require path is a semicolon-separated list of patterns that LÖVR will use to search for files when they are `require`d.  Any question marks in the pattern will be replaced with the module that is being required.  It is similar to Lua\\'s `package.path` variable, but the main difference is that the patterns are relative to the virtual filesystem.",
          key = "lovr.filesystem.getRequirePath",
          module = "lovr.filesystem",
          notes = "The default reqiure path is '?.lua;?/init.lua'.",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The semicolon separated list of search patterns."
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
          notes = "The save directory takes the following form:\n\n    <appdata>/LOVR/<identity>\n\nWhere `<appdata>` is `lovr.filesystem.getAppdataDirectory` and `<identity>` is `lovr.filesystem.getIdentity` and can be customized using `lovr.conf`.",
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
          },
          related = {
            "lovr.filesystem.getIdentity",
            "lovr.filesystem.getAppdataDirectory"
          }
        },
        {
          name = "getSize",
          summary = "Get the size of a file.",
          description = "Returns the size of a file, in bytes.",
          key = "lovr.filesystem.getSize",
          module = "lovr.filesystem",
          notes = "If the file does not exist, an error is thrown.",
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
                  description = "The absolute path of the project's source, or `nil` if it's unknown."
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
          name = "getWorkingDirectory",
          summary = "Get the current working directory.",
          description = "Returns the absolute path of the working directory.  Usually this is where the executable was started from.",
          key = "lovr.filesystem.getWorkingDirectory",
          module = "lovr.filesystem",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "path",
                  type = "string",
                  description = "The current working directory, or `nil` if it's unknown."
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
                  description = "Whether or not the path is a directory."
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
                  description = "Whether or not the path is a file."
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
          notes = "An error is thrown if the file contains syntax errors.",
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
                },
                {
                  name = "root",
                  type = "string",
                  description = "A subdirectory inside the archive to use as the root.  If `nil`, the actual root of the archive is used.",
                  default = "nil"
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether the archive was successfully mounted."
                }
              }
            }
          },
          notes = "The `append` option lets you control the priority of the archive's files in the event of naming collisions.\n\nThis function is not thread safe.  Mounting or unmounting an archive while other threads call lovr.filesystem functions is not supported.",
          related = {
            "lovr.filesystem.unmount"
          },
          examples = {
            {
              description = "Mount `data.zip` with a file `images/background.png`:",
              code = "lovr.filesystem.mount('data.zip', 'assets')\nprint(lovr.filesystem.isFile('assets/images/background.png')) -- true"
            }
          }
        },
        {
          name = "newBlob",
          summary = "Create a new Blob from a file.",
          description = "Creates a new Blob that contains the contents of a file.",
          key = "lovr.filesystem.newBlob",
          module = "lovr.filesystem",
          related = {
            "lovr.data.newBlob",
            "Blob"
          },
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
          notes = "If the file does not exist or cannot be read, nil is returned.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The name of the file to read."
                },
                {
                  name = "bytes",
                  type = "number",
                  description = "The number of bytes to read (if -1, all bytes will be read).",
                  default = "-1"
                }
              },
              returns = {
                {
                  name = "contents",
                  type = "string",
                  description = "The contents of the file."
                },
                {
                  name = "bytes",
                  type = "number",
                  description = "The number of bytes read from the file."
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
          notes = "A directory can only be removed if it is empty.\n\nTo recursively remove a folder, use this function with `lovr.filesystem.getDirectoryItems`.",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "The file or directory to remove."
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
          name = "setRequirePath",
          summary = "Set the require path.",
          description = "Sets the require path.  The require path is a semicolon-separated list of patterns that LÖVR will use to search for files when they are `require`d.  Any question marks in the pattern will be replaced with the module that is being required.  It is similar to Lua\\'s `package.path` variable, but the main difference is that the patterns are relative to the save directory and the project directory.",
          key = "lovr.filesystem.setRequirePath",
          module = "lovr.filesystem",
          notes = "The default reqiure path is '?.lua;?/init.lua'.",
          variants = {
            {
              arguments = {
                {
                  name = "path",
                  type = "string",
                  description = "An optional semicolon separated list of search patterns.",
                  default = "nil"
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
          notes = "This function is not thread safe.  Mounting or unmounting an archive while other threads call lovr.filesystem functions is not supported.",
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
          },
          related = {
            "lovr.filesystem.mount"
          }
        },
        {
          name = "write",
          summary = "Write to a file.",
          description = "Write to a file.",
          key = "lovr.filesystem.write",
          module = "lovr.filesystem",
          notes = "If the file does not exist, it is created.\n\nIf the file already has data in it, it will be replaced with the new content.",
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
            },
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The file to write to."
                },
                {
                  name = "blob",
                  type = "Blob",
                  description = "A Blob containing data to write to the file."
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
          },
          related = {
            "lovr.filesystem.append",
            "lovr.filesystem.read"
          }
        }
      },
      notes = "LÖVR programs can only write to a single directory, called the save directory.  The location of the save directory is platform-specific:\n\n<table>\n  <tr>\n    <td>Windows</td>\n    <td><code>C:\\Users\\&lt;user&gt;\\AppData\\Roaming\\LOVR\\&lt;identity&gt;</code></td>\n  </tr>\n  <tr>\n    <td>macOS</td>\n    <td><code>/Users/&lt;user&gt;/Library/Application Support/LOVR/&lt;identity&gt;</code></td>\n  </tr>\n  <tr>\n    <td>Linux</td>\n    <td><code>/home/&lt;user&gt;/.local/share/LOVR/&lt;identity&gt;</code></td>\n  </tr>\n  <tr>\n    <td>Android</td>\n    <td><code>/sdcard/Android/data/&lt;identity&gt;/files</code></td>\n  </tr> </table>\n\n`<identity>` should be a unique identifier for your app.  It can be set either in `lovr.conf` or by using `lovr.filesystem.setIdentity`.\n\nAll filenames are relative to either the save directory or the directory containing the project source.  Files in the save directory take precedence over files in the project."
    },
    {
      name = "graphics",
      tag = "modules",
      summary = "Renders graphics.",
      description = "The `lovr.graphics` module renders graphics to displays.  Anything rendered using this module will automatically show up in the VR headset if one is connected, otherwise it will just show up in a window on the desktop.",
      key = "lovr.graphics",
      objects = {
        {
          name = "Canvas",
          summary = "An offscreen render target.",
          description = "A Canvas is also known as a framebuffer or render-to-texture.  It allows you to render to a texture instead of directly to the screen.  This lets you postprocess or transform the results later before finally rendering them to the screen.\n\nAfter creating a Canvas, you can attach Textures to it using `Canvas:setTexture`.",
          key = "Canvas",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newCanvas"
          },
          examples = {
            {
              description = "Apply a postprocessing effect (wave) using a Canvas and a fragment shader.",
              code = "function lovr.load()\n  lovr.graphics.setBackgroundColor(.1, .1, .1)\n  canvas = lovr.graphics.newCanvas(lovr.headset.getDisplayDimensions())\n\n  wave = lovr.graphics.newShader([[\n    vec4 lovrMain() {\n      return lovrRVertex;\n    }\n  ]], [[\n    uniform float time;\n    vec4 lovrMain() {\n      uv.x += sin(uv.y * 10 + time * 4) * .01;\n      uv.y += cos(uv.x * 10 + time * 4) * .01;\n      return lovrGraphicsColor * lovrDiffuseColor * lovrVertexColor * texture(lovrDiffuseTexture, lovrTexCoord);\n    }\n  ]])\nend\n\nfunction lovr.update(dt)\n  wave:send('time', lovr.timer.getTime())\nend\n\nfunction lovr.draw()\n  -- Render the scene to the canvas instead of the headset.\n  canvas:renderTo(function()\n    lovr.graphics.clear()\n    local size = 5\n    for i = 1, size do\n      for j = 1, size do\n        for k = 1, size do\n          lovr.graphics.setColor(i / size, j / size, k / size)\n          local x, y, z = i - size / 2, j - size / 2, k - size / 2\n          lovr.graphics.cube('fill', x, y, z, .5)\n        end\n      end\n    end\n  end)\n\n  -- Render the canvas to the headset using a shader.\n  lovr.graphics.setColor(1, 1, 1)\n  lovr.graphics.setShader(wave)\n  lovr.graphics.fill(canvas:getTexture())\n  lovr.graphics.setShader()\nend"
            }
          },
          notes = "Up to four textures can be attached to a Canvas and anything rendered to the Canvas will be broadcast to all attached Textures.  If you want to do render different things to different textures, use the `multicanvas` shader flag when creating your shader and implement the `void colors` function instead of the usual `vec4 color` function.  You can then assign different output colors to `lovrCanvas[0]`, `lovrCanvas[1]`, etc. instead of returning a single color. Each color written to the array will end up in the corresponding texture attached to the Canvas.",
          methods = {
            {
              name = "getDepthTexture",
              summary = "Get the depth buffer used by the Canvas.",
              description = "Returns the depth buffer used by the Canvas as a Texture.  If the Canvas was not created with a readable depth buffer (the `depth.readable` flag in `lovr.graphics.newCanvas`), then this function will return `nil`.",
              key = "Canvas:getDepthTexture",
              module = "lovr.graphics",
              related = {
                "lovr.graphics.newCanvas"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The depth Texture of the Canvas."
                    }
                  }
                }
              }
            },
            {
              name = "getDimensions",
              summary = "Get the dimensions of the Canvas.",
              description = "Returns the dimensions of the Canvas, its Textures, and its depth buffer.",
              key = "Canvas:getDimensions",
              module = "lovr.graphics",
              notes = "The dimensions of a Canvas can not be changed after it is created.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the Canvas, in pixels."
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the Canvas, in pixels."
                    }
                  }
                }
              },
              related = {
                "Canvas:getWidth",
                "Canvas:getHeight"
              }
            },
            {
              name = "getHeight",
              summary = "Get the height of the Canvas.",
              description = "Returns the height of the Canvas, its Textures, and its depth buffer.",
              key = "Canvas:getHeight",
              module = "lovr.graphics",
              notes = "The height of a Canvas can not be changed after it is created.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the Canvas, in pixels."
                    }
                  }
                }
              },
              related = {
                "Canvas:getWidth",
                "Canvas:getDimensions"
              }
            },
            {
              name = "getMSAA",
              summary = "Get the number of MSAA samples used by the Canvas.",
              description = "Returns the number of multisample antialiasing samples to use when rendering to the Canvas. Increasing this number will make the contents of the Canvas appear more smooth at the cost of performance.  It is common to use powers of 2 for this value.",
              key = "Canvas:getMSAA",
              module = "lovr.graphics",
              notes = "All textures attached to the Canvas must be created with this MSAA value.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "samples",
                      type = "number",
                      description = "The number of MSAA samples."
                    }
                  }
                }
              },
              related = {
                "lovr.graphics.newCanvas",
                "lovr.graphics.newTexture"
              }
            },
            {
              name = "getTexture",
              summary = "Get the Textures attached to the Canvas.",
              description = "Returns the set of Textures currently attached to the Canvas.",
              key = "Canvas:getTexture",
              module = "lovr.graphics",
              notes = "Up to 4 Textures can be attached at once.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "...",
                      type = "Texture",
                      description = "One or more Textures attached to the Canvas."
                    }
                  }
                }
              }
            },
            {
              name = "getWidth",
              summary = "Get the width of the Canvas.",
              description = "Returns the width of the Canvas, its Textures, and its depth buffer.",
              key = "Canvas:getWidth",
              module = "lovr.graphics",
              notes = "The width of a Canvas can not be changed after it is created.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the Canvas, in pixels."
                    }
                  }
                }
              },
              related = {
                "Canvas:getHeight",
                "Canvas:getDimensions"
              }
            },
            {
              name = "isStereo",
              summary = "Check if the Canvas is stereo.",
              description = "Returns whether the Canvas was created with the `stereo` flag.  Drawing something to a stereo Canvas will draw it to two viewports in the left and right half of the Canvas, using transform information from two different eyes.",
              key = "Canvas:isStereo",
              module = "lovr.graphics",
              related = {
                "lovr.graphics.newCanvas",
                "lovr.graphics.fill"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "stereo",
                      type = "boolean",
                      description = "Whether the Canvas is stereo."
                    }
                  }
                }
              }
            },
            {
              name = "newImage",
              summary = "Create a new Image from a Canvas texture.",
              description = "Returns a new Image containing the contents of a Texture attached to the Canvas.",
              key = "Canvas:newImage",
              module = "lovr.graphics",
              notes = "The Image will always have the `rgba` format.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the Texture to read from.",
                      default = "1"
                    }
                  },
                  returns = {
                    {
                      name = "image",
                      type = "Image",
                      description = "The new Image."
                    }
                  }
                }
              },
              related = {
                "lovr.data.newImage",
                "Image"
              }
            },
            {
              name = "renderTo",
              summary = "Render to the Canvas using a function.",
              description = "Renders to the Canvas using a function.  All graphics functions inside the callback will affect the Canvas contents instead of directly rendering to the headset.  This can be used in `lovr.update`.",
              key = "Canvas:renderTo",
              module = "lovr.graphics",
              notes = "Make sure you clear the contents of the canvas before rendering by using `lovr.graphics.clear`. Otherwise there might be data in the canvas left over from a previous frame.\n\nAlso note that the transform stack is not modified by this function.  If you plan on modifying the transform stack inside your callback it may be a good idea to use `lovr.graphics.push` and `lovr.graphics.pop` so you can revert to the previous transform afterwards.",
              variants = {
                {
                  arguments = {
                    {
                      name = "callback",
                      type = "function",
                      description = "The function to use to render to the Canvas.",
                      arguments = {
                        {
                          name = "...",
                          type = "*"
                        }
                      },
                      returns = {}
                    },
                    {
                      name = "...",
                      type = "*",
                      description = "Additional arguments to pass to the callback."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setTexture",
              summary = "Attach one or more Textures to the Canvas.",
              description = "Attaches one or more Textures to the Canvas.  When rendering to the Canvas, everything will be drawn to all attached Textures.  You can attach different layers of an array, cubemap, or volume texture, and also attach different mipmap levels of Textures.",
              key = "Canvas:setTexture",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "...",
                      type = "*",
                      description = "One or more Textures to attach to the Canvas."
                    }
                  },
                  returns = {}
                }
              },
              notes = "There are some restrictions on how textures can be attached:\n\n- Up to 4 textures can be attached at once.\n- Textures must have the same dimensions and multisample settings as the Canvas.\n\nTo specify layers and mipmaps to attach, specify them after the Texture.  You can also optionally wrap them in a table.",
              examples = {
                {
                  description = "Various ways to attach textures to a Canvas.",
                  code = "canvas:setTexture(textureA)\ncanvas:setTexture(textureA, textureB) -- Attach two textures\ncanvas:setTexture(textureA, layer, mipmap) -- Attach a specific layer and mipmap\ncanvas:setTexture(textureA, layer, textureB, layer) -- Attach specific layers\ncanvas:setTexture({ textureA, layer, mipmap }, textureB, { textureC, layer }) -- Tables\ncanvas:setTexture({ { textureA, layer, mipmap }, textureB, { textureC, layer } })"
                }
              }
            }
          }
        },
        {
          name = "Font",
          summary = "A font used to render text.",
          description = "A Font is an object created from a TTF file.  It can be used to render text with `lovr.graphics.print`.",
          key = "Font",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newFont"
          },
          methods = {
            {
              name = "getAscent",
              summary = "Get the ascent of the Font.",
              description = "Returns the maximum distance that any glyph will extend above the Font's baseline.  Units are generally in meters, see `Font:getPixelDensity`.",
              key = "Font:getAscent",
              module = "lovr.graphics",
              related = {
                "Font:getDescent",
                "Rasterizer:getAscent"
              },
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
              description = "Returns the height of a line of text.  Units are in meters, see `Font:setPixelDensity`.",
              key = "Font:getHeight",
              module = "lovr.graphics",
              related = {
                "Rasterizer:getHeight"
              },
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
              description = "Returns the current line height multiplier of the Font.  The default is 1.0.",
              key = "Font:getLineHeight",
              module = "lovr.graphics",
              related = {
                "Font:getHeight",
                "Rasterizer:getLineHeight"
              },
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
              name = "getRasterizer",
              summary = "Get the underlying Rasterizer.",
              description = "Returns the underlying `Rasterizer` object for a Font.",
              key = "Font:getRasterizer",
              module = "lovr.graphics",
              related = {
                "Rasterizer",
                "lovr.data.newRasterizer"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "rasterizer",
                      type = "Rasterizer",
                      description = "The rasterizer."
                    }
                  }
                }
              }
            },
            {
              name = "getWidth",
              summary = "Measure a line of text.",
              description = "Returns the width and line count of a string when rendered using the font, taking into account an optional wrap limit.",
              key = "Font:getWidth",
              module = "lovr.graphics",
              notes = "To get the correct units returned, make sure the pixel density is set with\n    `Font:setPixelDensity`.",
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
                    },
                    {
                      name = "lines",
                      type = "number",
                      description = "The number of lines in the wrapped text."
                    }
                  }
                }
              }
            },
            {
              name = "hasGlyphs",
              summary = "Check if a Font has a set of glyphs.",
              description = "Returns whether the Font has a set of glyphs.  Any combination of strings and numbers (corresponding to character codes) can be specified.  This function will return true if the Font is able to render *all* of the glyphs.",
              key = "Font:hasGlyphs",
              module = "lovr.graphics",
              notes = "It is a good idea to use this function when you're rendering an unknown or user-supplied string to avoid utterly embarrassing crashes.",
              variants = {
                {
                  arguments = {
                    {
                      name = "...",
                      type = "*",
                      description = "Strings or numbers to test."
                    }
                  },
                  returns = {
                    {
                      name = "has",
                      type = "boolean",
                      description = "Whether the Font has the glyphs."
                    }
                  }
                }
              },
              related = {
                "Rasterizer:hasGlyphs"
              }
            },
            {
              name = "setLineHeight",
              summary = "Set the line height of the Font.",
              description = "Sets the line height of the Font, which controls how far lines apart lines are vertically separated.  This value is a ratio and the default is 1.0.",
              key = "Font:setLineHeight",
              module = "lovr.graphics",
              related = {
                "Font:getHeight",
                "Rasterizer:getLineHeight"
              },
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
                },
                {
                  description = "Reset the pixel density to the default (`font:getRasterizer():getHeight()`).",
                  arguments = {},
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Material",
          summary = "An object that controls texturing and shading.",
          description = "A Material is an object used to control how objects appear, through coloring, texturing, and shading.  The Material itself holds sets of colors, textures, and other parameters that are made available to Shaders.",
          key = "Material",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newMaterial"
          },
          methods = {
            {
              name = "getColor",
              summary = "Get a color property of the Material.",
              description = "Returns a color property for a Material.  Different types of colors are supported for different lighting parameters.  Colors default to `(1.0, 1.0, 1.0, 1.0)` and are gamma corrected.",
              key = "Material:getColor",
              module = "lovr.graphics",
              related = {
                "MaterialColor",
                "lovr.graphics.setColor"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "colorType",
                      type = "MaterialColor",
                      description = "The type of color to get.",
                      default = "'diffuse'"
                    }
                  },
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
              }
            },
            {
              name = "getScalar",
              summary = "Get a scalar property of the Material.",
              description = "Returns a numeric property of a Material.  Scalar properties default to 1.0.",
              key = "Material:getScalar",
              module = "lovr.graphics",
              related = {
                "MaterialScalar"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "scalarType",
                      type = "MaterialScalar",
                      description = "The type of property to get."
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The value of the property."
                    }
                  }
                }
              }
            },
            {
              name = "getTexture",
              summary = "Get a texture for the Material.",
              description = "Returns a texture for a Material.  Several predefined `MaterialTexture`s are supported.  Any texture that is `nil` will use a single white pixel as a fallback.",
              key = "Material:getTexture",
              module = "lovr.graphics",
              related = {
                "MaterialTexture"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "textureType",
                      type = "MaterialTexture",
                      description = "The type of texture to get.",
                      default = "'diffuse'"
                    }
                  },
                  returns = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The texture that is set, or `nil` if no texture is set."
                    }
                  }
                }
              }
            },
            {
              name = "getTransform",
              summary = "Get the transformation applied to texture coordinates.",
              description = "Returns the transformation applied to texture coordinates of the Material.",
              key = "Material:getTransform",
              module = "lovr.graphics",
              notes = "Although texture coordinates will automatically be transformed by the Material's transform, the material transform is exposed as the `mat3 lovrMaterialTransform` uniform variable in shaders, allowing it to be used for other purposes.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "ox",
                      type = "number",
                      description = "The texture coordinate x offset."
                    },
                    {
                      name = "oy",
                      type = "number",
                      description = "The texture coordinate y offset."
                    },
                    {
                      name = "sx",
                      type = "number",
                      description = "The texture coordinate x scale."
                    },
                    {
                      name = "sy",
                      type = "number",
                      description = "The texture coordinate y scale."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The texture coordinate rotation, in radians."
                    }
                  }
                }
              }
            },
            {
              name = "setColor",
              summary = "Set a color property of the Material.",
              description = "Sets a color property for a Material.  Different types of colors are supported for different lighting parameters.  Colors default to `(1.0, 1.0, 1.0, 1.0)` and are gamma corrected.",
              key = "Material:setColor",
              module = "lovr.graphics",
              related = {
                "MaterialColor",
                "lovr.graphics.setColor"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "colorType",
                      type = "MaterialColor",
                      description = "The type of color to set.",
                      default = "'diffuse'"
                    },
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
                      default = "1.0"
                    }
                  },
                  returns = {}
                },
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
                      default = "1.0"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "colorType",
                      type = "MaterialColor",
                      description = "The type of color to set.",
                      default = "'diffuse'"
                    },
                    {
                      name = "hex",
                      type = "number",
                      description = "A hexcode to use for the color (alpha is not supported)."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "hex",
                      type = "number",
                      description = "A hexcode to use for the color (alpha is not supported)."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setScalar",
              summary = "Set a scalar property of the Material.",
              description = "Sets a numeric property of a Material.  Scalar properties default to 1.0.",
              key = "Material:setScalar",
              module = "lovr.graphics",
              related = {
                "MaterialScalar"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "scalarType",
                      type = "MaterialScalar",
                      description = "The type of property to set."
                    },
                    {
                      name = "x",
                      type = "number",
                      description = "The value of the property."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setTexture",
              summary = "Set a texture for the Material.",
              description = "Sets a texture for a Material.  Several predefined `MaterialTexture`s are supported.  Any texture that is `nil` will use a single white pixel as a fallback.",
              key = "Material:setTexture",
              module = "lovr.graphics",
              related = {
                "MaterialTexture",
                "lovr.graphics.newTexture"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "textureType",
                      type = "MaterialTexture",
                      description = "The type of texture to set.",
                      default = "'diffuse'"
                    },
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The texture to apply, or `nil` to use the default."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The texture to apply, or `nil` to use the default."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setTransform",
              summary = "Set the transformation applied to texture coordinates.",
              description = "Sets the transformation applied to texture coordinates of the Material.  This lets you offset, scale, or rotate textures as they are applied to geometry.",
              key = "Material:setTransform",
              module = "lovr.graphics",
              notes = "Although texture coordinates will automatically be transformed by the Material's transform, the material transform is exposed as the `mat3 lovrMaterialTransform` uniform variable in shaders, allowing it to be used for other purposes.",
              variants = {
                {
                  arguments = {
                    {
                      name = "ox",
                      type = "number",
                      description = "The texture coordinate x offset."
                    },
                    {
                      name = "oy",
                      type = "number",
                      description = "The texture coordinate y offset."
                    },
                    {
                      name = "sx",
                      type = "number",
                      description = "The texture coordinate x scale."
                    },
                    {
                      name = "sy",
                      type = "number",
                      description = "The texture coordinate y scale."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The texture coordinate rotation, in radians."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Mesh",
          summary = "A drawable list of vertices.",
          description = "A Mesh is a low-level graphics object that stores and renders a list of vertices.\n\nMeshes are really flexible since you can pack pretty much whatever you want in them.  This makes them great for rendering arbitrary geometry, but it also makes them kinda difficult to use since you have to place each vertex yourself.\n\nIt's possible to batch geometry with Meshes too.  Instead of drawing a shape 100 times, it's much faster to pack 100 copies of the shape into a Mesh and draw the Mesh once.  Even storing just one copy in the Mesh and drawing that 100 times is usually faster.\n\nMeshes are also a good choice if you have an object that changes its shape over time.",
          key = "Mesh",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newMesh"
          },
          examples = {
            {
              description = "Draw a circle using a Mesh.",
              code = "function lovr.load()\n  local x, y, z = 0, 1, -2\n  local radius = .3\n  local points = 40\n\n  -- A table to hold the Mesh data\n  local vertices = {}\n\n  for i = 0, points do\n    local angle = i / points * 2 * math.pi\n    local vx = x + math.cos(angle)\n    local vy = y + math.sin(angle)\n    table.insert(vertices, { vx, vy, z })\n  end\n\n  mesh = lovr.graphics.newMesh(vertices, 'fan')\nend\n\nfunction lovr.draw()\n  mesh:draw()\nend"
            }
          },
          notes = "Each vertex in a Mesh can hold several pieces of data.  For example, you might want a vertex to keep track of its position, color, and a weight.  Each one of these pieces of information is called a vertex **attribute**.  A vertex attribute must have a name, a type, and a size.  Here's what the \"position\" attribute would look like as a Lua table:\n\n    { 'vPosition', 'float', 3 } -- 3 floats, one for x, y, and z\n\nEvery vertex in a Mesh must have the same set of attributes.  We call this set of attributes the **format** of the Mesh, and it's specified as a simple table of attributes.  For example, we could represent the format described above as:\n\n    {\n      { 'vPosition', 'float', 3 },\n      { 'vColor',    'byte',  4 },\n      { 'vWeight',   'int',   1 }\n    }\n\nWhen creating a Mesh, you can give it any format you want, or use the default.  The default Mesh format looks like this:\n\n    {\n      { 'lovrPosition',    'float', 3 },\n      { 'lovrNormal',      'float', 3 },\n      { 'lovrTexCoord',    'float', 2 }\n    }\n\nGreat, so why do we go through the trouble of naming everything in our vertex and saying what type and size it is?  The cool part is that we can access this data in a Shader.  We can write a vertex Shader that has `in` variables for every vertex attribute in our Mesh:\n\n    in vec3 vPosition;\n    in vec4 vColor;\n    in int vWeight;\n\n    vec4 lovrMain() {\n      // Here we can access the vPosition, vColor, and vWeight of each vertex in the Mesh!\n    }\n\nSpecifying custom vertex data is really powerful and is often used for lighting, animation, and more!\n\nFor more on the different data types available for the attributes, see `AttributeType`.",
          methods = {
            {
              name = "attachAttributes",
              summary = "Attach attributes from another Mesh onto this one.",
              description = "Attaches attributes from another Mesh onto this one.  This can be used to share vertex data across multiple meshes without duplicating the data, and can also be used for instanced rendering by using the `divisor` parameter.",
              key = "Mesh:attachAttributes",
              module = "lovr.graphics",
              notes = "The attribute divisor is a  number used to control how the attribute data relates to instancing. If 0, then the attribute data is considered \"per vertex\", and each vertex will get the next element of the attribute's data.  If the divisor 1 or more, then the attribute data is considered \"per instance\", and every N instances will get the next element of the attribute data.\n\nTo prevent cycles, it is not possible to attach attributes onto a Mesh that already has attributes attached to a different Mesh.",
              variants = {
                {
                  description = "Attach all attributes from the other mesh.",
                  arguments = {
                    {
                      name = "mesh",
                      type = "Mesh",
                      description = "The Mesh to attach attributes from."
                    },
                    {
                      name = "divisor",
                      type = "number",
                      description = "The attribute divisor for all attached attributes.",
                      default = "0"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "mesh",
                      type = "Mesh",
                      description = "The Mesh to attach attributes from."
                    },
                    {
                      name = "divisor",
                      type = "number",
                      description = "The attribute divisor for all attached attributes.",
                      default = "0"
                    },
                    {
                      name = "...",
                      type = "string",
                      description = "The names of attributes to attach from the other Mesh."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "mesh",
                      type = "Mesh",
                      description = "The Mesh to attach attributes from."
                    },
                    {
                      name = "divisor",
                      type = "number",
                      description = "The attribute divisor for all attached attributes.",
                      default = "0"
                    },
                    {
                      name = "attributes",
                      type = "table",
                      description = "A table of attribute names to attach from the other Mesh."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Mesh:detachAttributes",
                "Mesh:drawInstanced"
              }
            },
            {
              name = "detachAttributes",
              summary = "Detach attributes that were attached from a different Mesh.",
              description = "Detaches attributes that were attached using `Mesh:attachAttributes`.",
              key = "Mesh:detachAttributes",
              module = "lovr.graphics",
              related = {
                "Mesh:attachAttributes"
              },
              variants = {
                {
                  description = "Detaches all attributes from the other mesh, by name.",
                  arguments = {
                    {
                      name = "mesh",
                      type = "Mesh",
                      description = "A Mesh.  The names of all of the attributes from this Mesh will be detached."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "mesh",
                      type = "Mesh",
                      description = "A Mesh.  The names of all of the attributes from this Mesh will be detached."
                    },
                    {
                      name = "...",
                      type = "string",
                      description = "The names of attributes to detach."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "mesh",
                      type = "Mesh",
                      description = "A Mesh.  The names of all of the attributes from this Mesh will be detached."
                    },
                    {
                      name = "attributes",
                      type = "table",
                      description = "A table of attribute names to detach."
                    }
                  },
                  returns = {}
                }
              }
            },
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
                      description = "The angle to rotate the Mesh around the axis of rotation, in radians.",
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
                    },
                    {
                      name = "instances",
                      type = "number",
                      description = "The number of copies of the Mesh to draw.",
                      default = "1"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "transform",
                      type = "mat4",
                      description = "The transform to apply before drawing."
                    },
                    {
                      name = "instances",
                      type = "number",
                      description = "The number of copies of the Mesh to draw.",
                      default = "1"
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
                      type = "DrawMode",
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
                      description = "The index of the first vertex that will be drawn, or nil if no draw range is set."
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of vertices that will be drawn, or nil if no draw range is set."
                    }
                  }
                }
              }
            },
            {
              name = "getMaterial",
              summary = "Get the Material applied to the Mesh.",
              description = "Get the Material applied to the Mesh.",
              key = "Mesh:getMaterial",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "material",
                      type = "Material",
                      description = "The current material applied to the Mesh."
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
              description = "Returns the components of a specific attribute of a single vertex in the Mesh.",
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
              notes = "The size can only be set when creating the Mesh, and cannot be changed afterwards.\n\nA subset of the Mesh's vertices can be rendered, see `Mesh:setDrawRange`.",
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
                      description = "The table of vertex attributes.  Each attribute is a table containing the name of the attribute, the `AttributeType`, and the number of components."
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
                },
                {
                  arguments = {
                    {
                      name = "t",
                      type = "table",
                      description = "The table to fill with the vertex map."
                    }
                  },
                  returns = {
                    {
                      name = "map",
                      type = "table",
                      description = "The list of indices in the vertex map, or `nil` if no vertex map is set."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "The Blob to fill with the vertex map data.  It must be big enough to hold all of the indices."
                    }
                  },
                  returns = {}
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
                      type = "DrawMode",
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
                },
                {
                  description = "Remove the draw range, causing the Mesh to draw all of its vertices.",
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "setMaterial",
              summary = "Apply a Material to the Mesh.",
              description = "Applies a Material to the Mesh.  This will cause it to use the Material's properties whenever it is rendered.",
              key = "Mesh:setMaterial",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "material",
                      type = "Material",
                      description = "The Material to apply."
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
                }
              },
              notes = "Any unspecified components will be set to 0.",
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
                },
                {
                  description = "This variant is much faster than the previous one, but is harder to use.",
                  arguments = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "A Blob to use to update vertex data."
                    },
                    {
                      name = "size",
                      type = "number",
                      description = "The size of each element of the Blob, in bytes.  Must be 2 or 4.",
                      default = "4"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setVertices",
              summary = "Update multiple vertices in the Mesh.",
              description = "Updates multiple vertices in the Mesh.",
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
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of vertices to replace.  If nil, all vertices will be used.",
                      default = "nil"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "A Blob containing binary vertex data to upload (this is much more efficient)."
                    },
                    {
                      name = "start",
                      type = "number",
                      description = "The index of the vertex to start replacing at.",
                      default = "1"
                    },
                    {
                      name = "count",
                      type = "number",
                      description = "The number of vertices to replace.  If nil, all vertices will be used.",
                      default = "nil"
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Model",
          summary = "An asset imported from a 3D model file.",
          description = "A Model is a drawable object loaded from a 3D file format.  The supported 3D file formats are OBJ, glTF, and STL.",
          key = "Model",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newModel",
            "lovr.headset.newModel"
          },
          examples = {
            {
              code = "local model\n\nfunction lovr.load()\n  model = lovr.graphics.newModel('assets/model.gltf')\nend\n\nfunction lovr.draw()\n  model:draw(0, 1, -1, 1, lovr.timer.getTime())\nend"
            }
          },
          methods = {
            {
              name = "animate",
              summary = "Apply an animation to the pose of the Model.",
              description = "Applies an animation to the current pose of the Model.\n\nThe animation is evaluated at the specified timestamp, and mixed with the current pose of the Model using the alpha value.  An alpha value of 1.0 will completely override the pose of the Model with the animation's pose.",
              key = "Model:animate",
              module = "lovr.graphics",
              related = {
                "Model:pose",
                "Model:getAnimationCount",
                "Model:getAnimationName",
                "Model:getAnimationDuration"
              },
              examples = {
                {
                  description = "Render an animated model, with a custom speed.",
                  code = "function lovr.load()\n  model = lovr.graphics.newModel('model.gltf')\n  shader = lovr.graphics.newShader('unlit', { flags = { animated = true } })\nend\n\nfunction lovr.draw()\n  local speed = 1.0\n  model:animate(1, lovr.timer.getTime() * speed)\n  model:draw()\nend"
                },
                {
                  description = "Mix from one animation to another, as the trigger is pressed.",
                  code = "function lovr.load()\n  model = lovr.graphics.newModel('model.gltf')\n  shader = lovr.graphics.newShader('unlit', { flags = { animated = true } })\nend\n\nfunction lovr.draw()\n  local t = lovr.timer.getTime()\n  local mix = lovr.headset.getAxis('right', 'trigger')\n\n  model:pose()\n  model:animate(1, t)\n  model:animate(2, t, mix)\n\n  model:draw()\nend"
                }
              },
              notes = "For animations to properly show up, use a Shader created with the `animated` flag set to `true`. See `lovr.graphics.newShader` for more.\n\nAnimations are always mixed in with the current pose, and the pose only ever changes by calling `Model:animate` and `Model:pose`.  To clear the pose of a Model to the default, use `Model:pose(nil)`.",
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of an animation."
                    },
                    {
                      name = "time",
                      type = "number",
                      description = "The timestamp to evaluate the keyframes at, in seconds."
                    },
                    {
                      name = "alpha",
                      type = "number",
                      description = "How much of the animation to mix in, from 0 to 1.",
                      default = "1"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of an animation."
                    },
                    {
                      name = "time",
                      type = "number",
                      description = "The timestamp to evaluate the keyframes at, in seconds."
                    },
                    {
                      name = "alpha",
                      type = "number",
                      description = "How much of the animation to mix in, from 0 to 1.",
                      default = "1"
                    }
                  },
                  returns = {}
                }
              }
            },
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
                      description = "The angle to rotate the Model around the axis of rotation, in radians.",
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
                    },
                    {
                      name = "instances",
                      type = "number",
                      description = "The number of copies of the Model to draw.",
                      default = "1"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "transform",
                      type = "mat4",
                      description = "The transform to apply before drawing."
                    },
                    {
                      name = "instances",
                      type = "number",
                      description = "The number of copies of the Model to draw.",
                      default = "1"
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
              name = "getAnimationCount",
              summary = "Get the number of animations in the Model.",
              description = "Returns the number of animations in the Model.",
              key = "Model:getAnimationCount",
              module = "lovr.graphics",
              related = {
                "Model:getAnimationName",
                "Model:getAnimationDuration",
                "Model:animate"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of animations in the Model."
                    }
                  }
                }
              }
            },
            {
              name = "getAnimationDuration",
              summary = "Get the duration of an animation in the Model.",
              description = "Returns the duration of an animation in the Model, in seconds.",
              key = "Model:getAnimationDuration",
              module = "lovr.graphics",
              related = {
                "Model:getAnimationCount",
                "Model:getAnimationName",
                "Model:animate"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the animation."
                    }
                  },
                  returns = {
                    {
                      name = "duration",
                      type = "number",
                      description = "The duration of the animation, in seconds."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The animation index."
                    }
                  },
                  returns = {
                    {
                      name = "duration",
                      type = "number",
                      description = "The duration of the animation, in seconds."
                    }
                  }
                }
              }
            },
            {
              name = "getAnimationName",
              summary = "Get the name of an animation in the Model.",
              description = "Returns the name of one of the animations in the Model.",
              key = "Model:getAnimationName",
              module = "lovr.graphics",
              related = {
                "Model:getAnimationCount",
                "Model:getAnimationDuration",
                "Model:getMaterialName",
                "Model:getNodeName"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the animation to get the name of."
                    }
                  },
                  returns = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the animation."
                    }
                  }
                }
              }
            },
            {
              name = "getMaterial",
              summary = "Get a Material from the Model.",
              description = "Returns a Material loaded from the Model, by name or index.\n\nThis includes `Texture` objects and other properties like colors, metalness/roughness, and more.",
              key = "Model:getMaterial",
              module = "lovr.graphics",
              related = {
                "Model:getMaterialCount",
                "Model:getMaterialName",
                "Material"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the Material to return."
                    }
                  },
                  returns = {
                    {
                      name = "material",
                      type = "Material",
                      description = "The material."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the Material to return."
                    }
                  },
                  returns = {
                    {
                      name = "material",
                      type = "Material",
                      description = "The material."
                    }
                  }
                }
              }
            },
            {
              name = "getMaterialCount",
              summary = "Get the number of materials in the Model.",
              description = "Returns the number of materials in the Model.",
              key = "Model:getMaterialCount",
              module = "lovr.graphics",
              related = {
                "Model:getMaterialName",
                "Model:getMaterial"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of materials in the Model."
                    }
                  }
                }
              }
            },
            {
              name = "getMaterialName",
              summary = "Get the name of a material in the Model.",
              description = "Returns the name of one of the materials in the Model.",
              key = "Model:getMaterialName",
              module = "lovr.graphics",
              related = {
                "Model:getMaterialCount",
                "Model:getAnimationName",
                "Model:getNodeName"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the material to get the name of."
                    }
                  },
                  returns = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the material."
                    }
                  }
                }
              }
            },
            {
              name = "getNodeCount",
              summary = "Get the number of nodes in the Model.",
              description = "Returns the number of nodes (bones) in the Model.",
              key = "Model:getNodeCount",
              module = "lovr.graphics",
              related = {
                "Model:getNodeName",
                "Model:getNodePose",
                "Model:pose"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of nodes in the Model."
                    }
                  }
                }
              }
            },
            {
              name = "getNodeName",
              summary = "Get the name of a node in the Model.",
              description = "Returns the name of one of the nodes (bones) in the Model.",
              key = "Model:getNodeName",
              module = "lovr.graphics",
              related = {
                "Model:getNodeCount",
                "Model:getAnimationName",
                "Model:getMaterialName"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the node to get the name of."
                    }
                  },
                  returns = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the node."
                    }
                  }
                }
              }
            },
            {
              name = "getNodePose",
              summary = "Get the pose of a single node.",
              description = "Returns the pose of a single node in the Model in a given `CoordinateSpace`.",
              key = "Model:getNodePose",
              module = "lovr.graphics",
              notes = "For skinned nodes to render correctly, use a Shader created with the `animated` flag set to `true`.  See `lovr.graphics.newShader` for more.",
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the node."
                    },
                    {
                      name = "space",
                      type = "CoordinateSpace",
                      description = "Whether the pose should be returned relative to the node's parent or relative to the root node of the Model.",
                      default = "'global'"
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the node."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the node."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the node."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the node is rotated around its rotational axis."
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
                },
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The node index."
                    },
                    {
                      name = "space",
                      type = "CoordinateSpace",
                      description = "Whether the pose should be returned relative to the node's parent or relative to the root node of the Model.",
                      default = "'global'"
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x position of the node."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position of the node."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position of the node."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The number of radians the node is rotated around its rotational axis."
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
              },
              related = {
                "Model:pose",
                "Model:animate",
                "Model:getNodeName",
                "Model:getNodeCount"
              }
            },
            {
              name = "getTriangles",
              summary = "Get a list of the triangles in the Model.",
              description = "Returns 2 tables containing mesh data for the Model.\n\nThe first table is a list of vertex positions and contains 3 numbers for the x, y, and z coordinate of each vertex.  The second table is a list of triangles and contains 1-based indices into the first table representing the first, second, and third vertices that make up each triangle.\n\nThe vertex positions will be affected by node transforms.",
              key = "Model:getTriangles",
              module = "lovr.graphics",
              related = {
                "Model:getAABB",
                "World:newMeshCollider",
                "lovr.audio.setGeometry"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "vertices",
                      type = "table",
                      description = "A flat table of numbers containing vertex positions."
                    },
                    {
                      name = "indices",
                      type = "table",
                      description = "A flat table of numbers containing triangle vertex indices."
                    }
                  }
                }
              }
            },
            {
              name = "hasJoints",
              summary = "Check if a Model has joints.",
              description = "Returns whether the Model has any nodes associated with animated joints.  This can be used to approximately determine whether an animated shader needs to be used with an arbitrary Model.",
              key = "Model:hasJoints",
              module = "lovr.graphics",
              notes = "A model can still be animated even if this function returns false, since node transforms can still be animated with keyframes without skinning.  These types of animations don't need to use a Shader with the `animated = true` flag, though.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "skeletal",
                      type = "boolean",
                      description = "Whether the Model has any nodes that use skeletal animation."
                    }
                  }
                }
              },
              related = {
                "Model:getAnimationCount",
                "lovr.graphics.newShader"
              }
            },
            {
              name = "pose",
              summary = "Set the pose of a single node, or clear the pose.",
              description = "Applies a pose to a single node of the Model.  The input pose is assumed to be relative to the pose of the node's parent.  This is useful for applying inverse kinematics (IK) to a chain of bones in a skeleton.\n\nThe alpha parameter can be used to mix between the node's current pose and the input pose.",
              key = "Model:pose",
              module = "lovr.graphics",
              notes = "For skinned nodes to render correctly, use a Shader created with the `animated` flag set to `true`.  See `lovr.graphics.newShader` for more.",
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the node."
                    },
                    {
                      name = "x",
                      type = "number",
                      description = "The x position."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The angle of rotation around the axis, in radians."
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
                    },
                    {
                      name = "alpha",
                      type = "number",
                      description = "How much of the pose to mix in, from 0 to 1.",
                      default = "1"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The node index."
                    },
                    {
                      name = "x",
                      type = "number",
                      description = "The x position."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y position."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z position."
                    },
                    {
                      name = "angle",
                      type = "number",
                      description = "The angle of rotation around the axis, in radians."
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
                    },
                    {
                      name = "alpha",
                      type = "number",
                      description = "How much of the pose to mix in, from 0 to 1.",
                      default = "1"
                    }
                  },
                  returns = {}
                },
                {
                  description = "Clear the pose of the Model.",
                  arguments = {},
                  returns = {}
                }
              },
              related = {
                "Model:getNodePose",
                "Model:animate",
                "Model:getNodeName",
                "Model:getNodeCount"
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
            "lovr.graphics.newShader",
            "lovr.graphics.newComputeShader"
          },
          related = {
            "lovr.graphics.newComputeShader",
            "lovr.graphics.setShader",
            "lovr.graphics.getShader"
          },
          examples = {
            {
              description = "Set a simple shader that colors pixels based on vertex normals.",
              code = "function lovr.load()\n  lovr.graphics.setShader(lovr.graphics.newShader([[\n    out vec3 vNormal; // This gets passed to the fragment shader\n\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      vNormal = lovrNormal;\n      return projection * transform * vertex;\n    }\n  ]], [[\n    in vec3 vNormal; // This gets passed from the vertex shader\n\n    vec4 color(vec4 gcolor, sampler2D image, vec2 uv) {\n      return vec4(vNormal * .5 + .5, 1.0);\n    }\n  ]]))\n\n  model = lovr.graphics.newModel('model.gltf')\nend\n\nfunction lovr.draw()\n  model:draw(x, y, z)\nend"
            }
          },
          notes = "GLSL version `330` is used on desktop systems, and `300 es` on WebGL/Android.\n\nThe default vertex shader:\n\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      return projection * transform * vertex;\n    }\n\nThe default fragment shader:\n\n    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {\n      return graphicsColor * lovrDiffuseColor * lovrVertexColor * texture(image, uv);\n    }\n\nAdditionally, the following headers are prepended to the shader source, giving you convenient access to a default set of uniform variables and vertex attributes.\n\nVertex shader header:\n\n    in vec3 lovrPosition; // The vertex position\n    in vec3 lovrNormal; // The vertex normal vector\n    in vec2 lovrTexCoord;\n    in vec4 lovrVertexColor;\n    in vec3 lovrTangent;\n    in uvec4 lovrBones;\n    in vec4 lovrBoneWeights;\n    in uint lovrDrawID;\n    out vec4 lovrGraphicsColor;\n    uniform mat4 lovrModel;\n    uniform mat4 lovrView;\n    uniform mat4 lovrProjection;\n    uniform mat4 lovrTransform; // Model-View matrix\n    uniform mat3 lovrNormalMatrix; // Inverse-transpose of lovrModel\n    uniform mat3 lovrMaterialTransform;\n    uniform float lovrPointSize;\n    uniform mat4 lovrPose[48];\n    uniform int lovrViewportCount;\n    uniform int lovrViewID;\n    const mat4 lovrPoseMatrix; // Bone-weighted pose\n    const int lovrInstanceID; // Current instance ID\n\nFragment shader header:\n\n    in vec2 lovrTexCoord;\n    in vec4 lovrVertexColor;\n    in vec4 lovrGraphicsColor;\n    out vec4 lovrCanvas[gl_MaxDrawBuffers];\n    uniform float lovrMetalness;\n    uniform float lovrRoughness;\n    uniform vec4 lovrDiffuseColor;\n    uniform vec4 lovrEmissiveColor;\n    uniform sampler2D lovrDiffuseTexture;\n    uniform sampler2D lovrEmissiveTexture;\n    uniform sampler2D lovrMetalnessTexture;\n    uniform sampler2D lovrRoughnessTexture;\n    uniform sampler2D lovrOcclusionTexture;\n    uniform sampler2D lovrNormalTexture;\n    uniform samplerCube lovrEnvironmentTexture;\n    uniform int lovrViewportCount;\n    uniform int lovrViewID;\n\n### Compute Shaders\n\nCompute shaders can be created with `lovr.graphics.newComputeShader` and run with `lovr.graphics.compute`.  Currently, compute shaders are written with raw GLSL.  There is no default compute shader, instead the `void compute();` function must be implemented.\n\nYou can use the `layout` qualifier to specify a local work group size:\n\n    layout(local_size_x = X, local_size_y = Y, local_size_z = Z) in;\n\nAnd the following built in variables can be used:\n\n    in uvec3 gl_NumWorkGroups;       // The size passed to lovr.graphics.compute\n    in uvec3 gl_WorkGroupSize;       // The local work group size\n    in uvec3 gl_WorkGroupID;         // The current global work group\n    in uvec3 gl_LocalInvocationID;   // The current local work group\n    in uvec3 gl_GlobalInvocationID;  // A unique ID combining the global and local IDs\n    in uint gl_LocalInvocationIndex; // A 1D index of the LocalInvocationID\n\nCompute shaders don't return anything but they can write data to `Texture`s or `ShaderBlock`s. To bind a texture in a way that can be written to a compute shader, declare the uniforms with a type of `image2D`, `imageCube`, etc. instead of the usual `sampler2D` or `samplerCube`.  Once a texture is bound to an image uniform, you can use the `imageLoad` and `imageStore` GLSL functions to read and write pixels in the image.  Variables in `ShaderBlock`s can be written to using assignment syntax.\n\nLÖVR handles synchronization of textures and shader blocks so there is no need to use manual memory barriers to synchronize writes to resources from compute shaders.",
          methods = {
            {
              name = "getType",
              summary = "Get the type of the Shader.",
              description = "Returns the type of the Shader, which will be \"graphics\" or \"compute\".\n\nGraphics shaders are created with `lovr.graphics.newShader` and can be used for rendering with `lovr.graphics.setShader`.  Compute shaders are created with `lovr.graphics.newComputeShader` and can be run using `lovr.graphics.compute`.",
              key = "Shader:getType",
              module = "lovr.graphics",
              related = {
                "ShaderType"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "type",
                      type = "ShaderType",
                      description = "The type of the Shader."
                    }
                  }
                }
              }
            },
            {
              name = "hasBlock",
              summary = "Check if a Shader has a block.",
              description = "Returns whether a Shader has a block.\n\nA block is added to the Shader code at creation time using `ShaderBlock:getShaderCode`.  The block name (not the namespace) is used to link up the ShaderBlock object to the Shader.  This function can be used to check if a Shader was created with a block using the given name.",
              key = "Shader:hasBlock",
              module = "lovr.graphics",
              related = {
                "Shader:sendBlock"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "block",
                      type = "string",
                      description = "The name of the block."
                    }
                  },
                  returns = {
                    {
                      name = "present",
                      type = "boolean",
                      description = "Whether the shader has the specified block."
                    }
                  }
                }
              }
            },
            {
              name = "hasUniform",
              summary = "Check if a Shader has a uniform variable.",
              description = "Returns whether a Shader has a particular uniform variable.",
              key = "Shader:hasUniform",
              module = "lovr.graphics",
              notes = "If a uniform variable is defined but unused in the shader, the shader compiler will optimize it out and the uniform will not report itself as present.",
              variants = {
                {
                  arguments = {
                    {
                      name = "uniform",
                      type = "string",
                      description = "The name of the uniform variable."
                    }
                  },
                  returns = {
                    {
                      name = "present",
                      type = "boolean",
                      description = "Whether the shader has the specified uniform."
                    }
                  }
                }
              },
              related = {
                "Shader:send"
              }
            },
            {
              name = "send",
              summary = "Update a uniform variable in the Shader.",
              description = "Updates a uniform variable in the Shader.",
              key = "Shader:send",
              module = "lovr.graphics",
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
                  returns = {
                    {
                      name = "success",
                      type = "boolean",
                      description = "Whether the uniform exists and was updated."
                    }
                  }
                }
              },
              notes = "The shader does not need to be active to update its uniforms.\n\nThe following type combinations are supported:\n\n<table>\n  <thead>\n    <tr>\n      <td>Uniform type</td>\n      <td>LÖVR type</td>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>float</td>\n      <td>number</td>\n    </tr>\n    <tr>\n      <td>int</td>\n      <td>number</td>\n    </tr>\n    <tr>\n      <td>vec2</td>\n      <td>{ x, y }</td>\n    </tr>\n    <tr>\n      <td>vec3</td>\n      <td>{ x, y, z } or vec3</td>\n    </tr>\n    <tr>\n      <td>vec4</td>\n      <td>{ x, y, z, w }</td>\n    </tr>\n    <tr>\n      <td>ivec2</td>\n      <td>{ x, y }</td>\n    </tr>\n    <tr>\n      <td>ivec3</td>\n      <td>{ x, y, z }</td>\n    </tr>\n    <tr>\n      <td>ivec4</td>\n      <td>{ x, y, z, w }</td>\n    </tr>\n    <tr>\n      <td>mat2</td>\n      <td>{ x, ... }</td>\n    </tr>\n    <tr>\n      <td>mat3</td>\n      <td>{ x, ... }</td>\n    </tr>\n    <tr>\n      <td>mat4</td>\n      <td>{ x, ... } or mat4</td>\n    </tr>\n    <tr>\n      <td>sampler</td>\n      <td>Texture</td>\n    </tr>\n    <tr>\n      <td>image</td>\n      <td>Texture</td>\n    </tr>\n  </tbody> </table>\n\nUniform arrays can be wrapped in tables or passed as multiple arguments.\n\nTextures must match the type of sampler or image they are being sent to.\n\nThe following sampler (and image) types are currently supported:\n\n- `sampler2D`\n- `sampler3D`\n- `samplerCube`\n- `sampler2DArray`\n\n`Blob`s can be used to pass arbitrary binary data to Shader variables.",
              related = {
                "Shader:hasUniform",
                "ShaderBlock:send",
                "Shader:sendBlock"
              },
              examples = {
                {
                  description = "Updating a `vec3` uniform:",
                  code = "function lovr.load()\n  shader = lovr.graphics.newShader([[\n    uniform vec3 offset;\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      vertex.xyz += offset;\n      return projection * transform * vertex;\n    }\n  ]], nil)\n\n  shader:send('offset', { .3, .7, 0 })\nend"
                }
              }
            },
            {
              name = "sendBlock",
              summary = "Send a ShaderBlock to a Shader.",
              description = "Sends a ShaderBlock to a Shader.  After the block is sent, you can update the data in the block without needing to resend the block.  The block can be sent to multiple shaders and they will all see the same data from the block.",
              key = "Shader:sendBlock",
              module = "lovr.graphics",
              notes = "The Shader does not need to be active to send it a block.\n\nMake sure the ShaderBlock's variables line up with the block variables declared in the shader code, otherwise you'll get garbage data in the block.  An easy way to do this is to use `ShaderBlock:getShaderCode` to get a GLSL snippet that is compatible with the block.",
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the block to send to."
                    },
                    {
                      name = "block",
                      type = "ShaderBlock",
                      description = "The ShaderBlock to associate with the specified block."
                    },
                    {
                      name = "access",
                      type = "UniformAccess",
                      description = "How the Shader will use this block (used as an optimization hint).",
                      default = "'readwrite'"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Shader:hasBlock",
                "Shader:send",
                "ShaderBlock:send",
                "ShaderBlock:getShaderCode",
                "UniformAccess",
                "ShaderBlock"
              }
            },
            {
              name = "sendImage",
              summary = "Send a Texture to a Shader for writing.",
              description = "Sends a Texture to a Shader for writing.  This is meant to be used with compute shaders and only works with uniforms declared as `image2D`, `imageCube`, `image2DArray`, and `image3D`.  The normal `Shader:send` function accepts Textures and should be used most of the time.",
              key = "Shader:sendImage",
              module = "lovr.graphics",
              related = {
                "Shader:send",
                "ShaderBlock:send",
                "ShaderBlock:getShaderCode",
                "UniformAccess",
                "ShaderBlock"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the image uniform."
                    },
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The Texture to assign."
                    },
                    {
                      name = "slice",
                      type = "number",
                      description = "The slice of a cube, array, or volume texture to use, or `nil` for all slices.",
                      default = "nil"
                    },
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap of the texture to use.",
                      default = "1"
                    },
                    {
                      name = "access",
                      type = "UniformAccess",
                      description = "Whether the image will be read from, written to, or both.",
                      default = "'readwrite'"
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the image uniform."
                    },
                    {
                      name = "index",
                      type = "number",
                      description = "The array index to set."
                    },
                    {
                      name = "texture",
                      type = "Texture",
                      description = "The Texture to assign."
                    },
                    {
                      name = "slice",
                      type = "number",
                      description = "The slice of a cube, array, or volume texture to use, or `nil` for all slices.",
                      default = "nil"
                    },
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap of the texture to use.",
                      default = "1"
                    },
                    {
                      name = "access",
                      type = "UniformAccess",
                      description = "Whether the image will be read from, written to, or both.",
                      default = "'readwrite'"
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "ShaderBlock",
          summary = "A big ol' block of data that can be sent to a Shader.",
          description = "ShaderBlocks are objects that can hold large amounts of data and can be sent to Shaders.  It is common to use \"uniform\" variables to send data to shaders, but uniforms are usually limited to a few kilobytes in size.  ShaderBlocks are useful for a few reasons:\n\n- They can hold a lot more data.\n- Shaders can modify the data in them, which is really useful for compute shaders.\n- Setting the data in a ShaderBlock updates the data for all Shaders using the block, so you\n  don't need to go around setting the same uniforms in lots of different shaders.\n\nOn systems that support compute shaders, ShaderBlocks can optionally be \"writable\".  A writable ShaderBlock is a little bit slower than a non-writable one, but shaders can modify its contents and it can be much, much larger than a non-writable ShaderBlock.",
          key = "ShaderBlock",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newShaderBlock"
          },
          examples = {
            {
              code = "function lovr.load()\n  -- Create a ShaderBlock to store positions for 1000 models\n  block = lovr.graphics.newShaderBlock('uniform', {\n    modelPositions = { 'mat4', 1000 }\n  }, { usage = 'static' })\n\n  -- Write some random transforms to the block\n  local transforms = {}\n  for i = 1, 1000 do\n    transforms[i] = lovr.math.mat4()\n    local random, randomNormal = lovr.math.random, lovr.math.randomNormal\n    transforms[i]:translate(randomNormal(8), randomNormal(8), randomNormal(8))\n    transforms[i]:rotate(random(2 * math.pi), random(), random(), random())\n  end\n  block:send('modelPositions', transforms)\n\n  -- Create the shader, injecting the shader code for the block\n  shader = lovr.graphics.newShader(\n    block:getShaderCode('ModelBlock') .. [[\n    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {\n      return projection * transform * modelPositions[lovrInstanceID] * vertex;\n    }\n  ]], [[\n    vec4 color(vec4 gcolor, sampler2D image, vec2 uv) {\n      return gcolor * texture(image, uv);\n    }\n  ]])\n\n  -- Bind the block to the shader\n  shader:sendBlock('ModelBlock', block)\n  model = lovr.graphics.newModel('monkey.obj')\nend\n\n-- Draw the model 1000 times, using positions from the shader block\nfunction lovr.draw()\n  lovr.graphics.setShader(shader)\n  model:draw(lovr.math.mat4(), 1000)\n  lovr.graphics.setShader()\nend"
            }
          },
          notes = "- A Shader can use up to 8 ShaderBlocks.\n- ShaderBlocks can not contain textures.\n- Some systems have bugs with `vec3` variables in ShaderBlocks.  If you run into strange bugs,\n  try switching to a `vec4` for the variable.",
          methods = {
            {
              name = "getOffset",
              summary = "Get the byte offset of a variable in the ShaderBlock.",
              description = "Returns the byte offset of a variable in a ShaderBlock.  This is useful if you want to manually send binary data to the ShaderBlock using a `Blob` in `ShaderBlock:send`.",
              key = "ShaderBlock:getOffset",
              module = "lovr.graphics",
              related = {
                "ShaderBlock:getSize",
                "lovr.graphics.newShaderBlock"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "field",
                      type = "string",
                      description = "The name of the variable to get the offset of."
                    }
                  },
                  returns = {
                    {
                      name = "offset",
                      type = "number",
                      description = "The byte offset of the variable."
                    }
                  }
                }
              }
            },
            {
              name = "getShaderCode",
              summary = "Get a GLSL string that defines the ShaderBlock in a Shader.",
              description = "Before a ShaderBlock can be used in a Shader, the Shader has to have the block's variables defined in its source code.  This can be a tedious process, so you can call this function to return a GLSL string that contains this definition.  Roughly, it will look something like this:\n\n    layout(std140) uniform <label> {\n      <type> <name>[<count>];\n    } <namespace>;",
              key = "ShaderBlock:getShaderCode",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "label",
                      type = "string",
                      description = "The label of the block in the shader code.  This will be used to identify it when using `Shader:sendBlock`."
                    },
                    {
                      name = "namespace",
                      type = "string",
                      description = "The namespace to use when accessing the block's variables in the shader code.  This can be used to prevent naming conflicts if two blocks have variables with the same name.  If the namespace is nil, the block's variables will be available in the global scope.",
                      default = "nil"
                    }
                  },
                  returns = {
                    {
                      name = "code",
                      type = "string",
                      description = "The code that can be prepended to `Shader` code."
                    }
                  }
                }
              },
              related = {
                "lovr.graphics.newShader",
                "lovr.graphics.newComputeShader"
              },
              examples = {
                {
                  code = "block = lovr.graphics.newShaderBlock('uniform', {\n  sizes = { 'float', 10 }\n})\n\ncode = [[\n  #ifdef VERTEX\n    ]] .. block:getShaderCode('MyBlock', 'sizeBlock') .. [[\n\n    // vertex shader goes here,\n    // it can access sizeBlock.sizes\n  #endif\n\n  #ifdef PIXEL\n    // fragment shader goes here\n  #endif\n]]\n\nshader = lovr.graphics.newShader(code, code)\nshader:sendBlock('MyBlock', block)"
                }
              }
            },
            {
              name = "getSize",
              summary = "Get the size of the ShaderBlock.",
              description = "Returns the size of the ShaderBlock's data, in bytes.",
              key = "ShaderBlock:getSize",
              module = "lovr.graphics",
              related = {
                "ShaderBlock:getOffset",
                "lovr.graphics.newShaderBlock"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "size",
                      type = "number",
                      description = "The size of the ShaderBlock, in bytes."
                    }
                  }
                }
              }
            },
            {
              name = "getType",
              summary = "Get the type of the ShaderBlock.",
              description = "Returns the type of the ShaderBlock.",
              key = "ShaderBlock:getType",
              module = "lovr.graphics",
              related = {
                "ShaderBlock:getOffset",
                "lovr.graphics.newShaderBlock",
                "lovr.graphics.getLimits"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "type",
                      type = "BlockType",
                      description = "The type of the ShaderBlock."
                    }
                  }
                }
              }
            },
            {
              name = "read",
              summary = "Read a variable from the ShaderBlock.",
              description = "Returns a variable in the ShaderBlock.",
              key = "ShaderBlock:read",
              module = "lovr.graphics",
              notes = "This function is really slow!  Only read back values when you need to.\n\nVectors and matrices will be returned as (flat) tables.",
              variants = {
                {
                  arguments = {
                    {
                      name = "name",
                      type = "string",
                      description = "The name of the variable to read."
                    }
                  },
                  returns = {
                    {
                      name = "value",
                      type = "*",
                      description = "The value of the variable."
                    }
                  }
                }
              },
              related = {
                "Shader:send",
                "Shader:sendBlock",
                "ShaderBlock:getShaderCode",
                "ShaderBlock:getOffset",
                "ShaderBlock:getSize"
              }
            },
            {
              name = "send",
              summary = "Update a variable in the ShaderBlock.",
              description = "Updates a variable in the ShaderBlock.",
              key = "ShaderBlock:send",
              module = "lovr.graphics",
              notes = "For scalar or vector types, use tables of numbers or `vec3`s for each vector.\n\nFor matrix types, use tables of numbers or `mat4` objects.\n\n`Blob`s can also be used to pass arbitrary binary data to individual variables.",
              variants = {
                {
                  arguments = {
                    {
                      name = "variable",
                      type = "string",
                      description = "The name of the variable to update."
                    },
                    {
                      name = "value",
                      type = "*",
                      description = "The new value of the uniform."
                    }
                  },
                  returns = {}
                },
                {
                  arguments = {
                    {
                      name = "blob",
                      type = "Blob",
                      description = "A Blob to replace the block data with."
                    },
                    {
                      name = "offset",
                      type = "number",
                      description = "A byte offset into the Blob to start writing from.",
                      default = "0"
                    },
                    {
                      name = "extent",
                      type = "number",
                      description = "The number of bytes to write.  If `nil`, writes as many bytes as possible.",
                      default = "nil"
                    }
                  },
                  returns = {
                    {
                      name = "bytes",
                      type = "number",
                      description = "How many bytes were copied to the block."
                    }
                  }
                }
              },
              related = {
                "Shader:send",
                "Shader:sendBlock",
                "ShaderBlock:getShaderCode",
                "ShaderBlock:getOffset",
                "ShaderBlock:getSize"
              }
            }
          }
        },
        {
          name = "Texture",
          summary = "An image that can be applied to Materials.",
          description = "A Texture is an image that can be applied to `Material`s.  The supported file formats are `.png`, `.jpg`, `.hdr`, `.dds`, `.ktx`, and `.astc`.  DDS and ASTC are compressed formats, which are recommended because they're smaller and faster.",
          key = "Texture",
          module = "lovr.graphics",
          constructors = {
            "lovr.graphics.newTexture"
          },
          methods = {
            {
              name = "getCompareMode",
              summary = "Get the CompareMode for the Texture.",
              description = "Returns the compare mode for the texture.",
              key = "Texture:getCompareMode",
              module = "lovr.graphics",
              related = {
                "lovr.graphics.getDepthTest"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "compareMode",
                      type = "CompareMode",
                      description = "The current compare mode, or `nil` if none is set."
                    }
                  }
                }
              }
            },
            {
              name = "getDepth",
              summary = "Get the depth of the Texture.",
              description = "Returns the depth of the Texture, or the number of images stored in the Texture.",
              key = "Texture:getDepth",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap level to get the depth of.  This is only valid for volume textures.",
                      default = "1"
                    }
                  },
                  returns = {
                    {
                      name = "depth",
                      type = "number",
                      description = "The depth of the Texture."
                    }
                  }
                }
              }
            },
            {
              name = "getDimensions",
              summary = "Get the dimensions of the Texture.",
              description = "Returns the dimensions of the Texture.",
              key = "Texture:getDimensions",
              module = "lovr.graphics",
              variants = {
                {
                  arguments = {
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap level to get the dimensions of.",
                      default = "1"
                    }
                  },
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
                    },
                    {
                      name = "depth",
                      type = "number",
                      description = "The number of images stored in the Texture, for non-2D textures."
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
                      name = "mode",
                      type = "FilterMode",
                      description = "The filter mode for the Texture."
                    },
                    {
                      name = "anisotropy",
                      type = "number",
                      description = "The level of anisotropic filtering."
                    }
                  }
                }
              }
            },
            {
              name = "getFormat",
              summary = "Get the format of the Texture.",
              description = "Returns the format of the Texture.  This describes how many color channels are in the texture as well as the size of each one.  The most common format used is `rgba`, which contains red, green, blue, and alpha color channels.  See `TextureFormat` for all of the possible formats.",
              key = "Texture:getFormat",
              module = "lovr.graphics",
              related = {
                "TextureFormat"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format of the Texture."
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
                  arguments = {
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap level to get the height of.",
                      default = "1"
                    }
                  },
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
              name = "getMipmapCount",
              summary = "Get the number of mipmap levels of the Texture.",
              description = "Returns the number of mipmap levels of the Texture.",
              key = "Texture:getMipmapCount",
              module = "lovr.graphics",
              related = {
                "Texture:getWidth",
                "Texture:getHeight",
                "Texture:getDepth",
                "Texture:getDimensions",
                "lovr.graphics.newTexture"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "mipmaps",
                      type = "number",
                      description = "The number of mipmap levels in the Texture."
                    }
                  }
                }
              }
            },
            {
              name = "getType",
              summary = "Get the type of the Texture.",
              description = "Returns the type of the Texture.",
              key = "Texture:getType",
              module = "lovr.graphics",
              related = {
                "TextureType",
                "lovr.graphics.newTexture"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "type",
                      type = "TextureType",
                      description = "The type of the Texture."
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
                  arguments = {
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap level to get the width of.",
                      default = "1"
                    }
                  },
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
              name = "replacePixels",
              summary = "Replace pixels in the Texture using an Image object.",
              description = "Replaces pixels in the Texture, sourcing from an `Image` object.",
              key = "Texture:replacePixels",
              module = "lovr.graphics",
              related = {
                "Image:setPixel",
                "Image"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "image",
                      type = "Image",
                      description = "The Image containing the pixels to use.  Currently, the Image needs to have the same dimensions as the source Texture."
                    },
                    {
                      name = "x",
                      type = "number",
                      description = "The x offset to replace at.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y offset to replace at.",
                      default = "0"
                    },
                    {
                      name = "slice",
                      type = "number",
                      description = "The slice to replace.  Not applicable for 2D textures.",
                      default = "1"
                    },
                    {
                      name = "mipmap",
                      type = "number",
                      description = "The mipmap to replace.",
                      default = "1"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setCompareMode",
              summary = "Set the CompareMode for the Texture.",
              description = "Sets the compare mode for a texture.  This is only used for \"shadow samplers\", which are uniform variables in shaders with type `sampler2DShadow`.  Sampling a shadow sampler uses a sort of virtual depth test, and the compare mode of the texture is used to control how the depth test is performed.",
              key = "Texture:setCompareMode",
              module = "lovr.graphics",
              related = {
                "lovr.graphics.setDepthTest"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "compareMode",
                      type = "CompareMode",
                      description = "The new compare mode.  Use `nil` to disable the compare mode.",
                      default = "nil"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setFilter",
              summary = "Set the FilterMode for the Texture.",
              description = "Sets the `FilterMode` used by the texture.",
              key = "Texture:setFilter",
              module = "lovr.graphics",
              notes = "The default setting for new textures can be set with `lovr.graphics.setDefaultFilter`.\n\nThe maximum supported anisotropy level can be queried using `lovr.graphics.getLimits`.",
              variants = {
                {
                  arguments = {
                    {
                      name = "mode",
                      type = "FilterMode",
                      description = "The filter mode."
                    },
                    {
                      name = "anisotropy",
                      type = "number",
                      description = "The level of anisotropy to use."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "lovr.graphics.getDefaultFilter",
                "lovr.graphics.setDefaultFilter",
                "lovr.graphics.getLimits"
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
          }
        }
      },
      functions = {
        {
          name = "arc",
          tag = "graphicsPrimitives",
          summary = "Draw an arc.",
          description = "Draws an arc.",
          key = "lovr.graphics.arc",
          module = "lovr.graphics",
          notes = "The local normal vector of the circle is `(0, 0, 1)`.",
          related = {
            "lovr.graphics.arc"
          },
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
                  description = "Whether the arc is filled or outlined."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the arc, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the arc around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the arc's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the arc."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the arc, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the arc around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the arc's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
                  description = "Whether the arc is filled or outlined."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The arc's transform."
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the arc."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The arc's transform."
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
                  description = "Whether the arc is filled or outlined."
                },
                {
                  name = "arcmode",
                  type = "ArcMode",
                  description = "How to draw the arc.",
                  default = "'pie'"
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the arc, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the arc around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the arc's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the arc."
                },
                {
                  name = "arcmode",
                  type = "ArcMode",
                  description = "How to draw the arc.",
                  default = "'pie'"
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the arc.",
                  default = "0"
                },
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the arc, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the arc around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the arc's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the arc's axis of rotation.",
                  default = "0"
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
                  description = "Whether the arc is filled or outlined."
                },
                {
                  name = "arcmode",
                  type = "ArcMode",
                  description = "How to draw the arc.",
                  default = "'pie'"
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The arc's transform."
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the arc."
                },
                {
                  name = "arcmode",
                  type = "ArcMode",
                  description = "How to draw the arc.",
                  default = "'pie'"
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The arc's transform."
                },
                {
                  name = "start",
                  type = "number",
                  description = "The starting angle of the arc, in radians.",
                  default = "0"
                },
                {
                  name = "end",
                  type = "number",
                  description = "The ending angle of the arc, in radians.",
                  default = "2 * math.pi"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the full circle. A smaller number of segments will be used, depending on how long the arc is.",
                  default = "32"
                }
              },
              returns = {}
            }
          }
        },
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
                  type = "DrawStyle",
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
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the box."
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
                  type = "DrawStyle",
                  description = "How to draw the box."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The transform of the box."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the box."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The transform of the box."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "circle",
          tag = "graphicsPrimitives",
          summary = "Draw a 2D circle.",
          description = "Draws a 2D circle.",
          key = "lovr.graphics.circle",
          module = "lovr.graphics",
          notes = "The local normal vector of the circle is `(0, 0, 1)`.",
          related = {
            "lovr.graphics.arc"
          },
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
                  description = "Whether the circle is filled or outlined."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the circle.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the circle.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the circle.",
                  default = "0"
                },
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the circle, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the circle around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the circle's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the circle's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the circle's axis of rotation.",
                  default = "0"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the circle geometry.  Higher numbers increase smoothness but increase rendering cost slightly.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the circle."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the center of the circle.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the center of the circle.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the center of the circle.",
                  default = "0"
                },
                {
                  name = "radius",
                  type = "number",
                  description = "The radius of the circle, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the circle around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the circle's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the circle's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the circle's axis of rotation.",
                  default = "0"
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the circle geometry.  Higher numbers increase smoothness but increase rendering cost slightly.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
                  description = "Whether the circle is filled or outlined."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The circle's transform."
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the circle geometry.  Higher numbers increase smoothness but increase rendering cost slightly.",
                  default = "32"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the circle."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The circle's transform."
                },
                {
                  name = "segments",
                  type = "number",
                  description = "The number of segments to use for the circle geometry.  Higher numbers increase smoothness but increase rendering cost slightly.",
                  default = "32"
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
          description = "Clears the screen, resetting the color, depth, and stencil information to default values.  This function is called automatically by `lovr.run` at the beginning of each frame to clear out the data from the previous frame.",
          key = "lovr.graphics.clear",
          module = "lovr.graphics",
          notes = "The first two variants of this function can be mixed and matched, meaning you can use booleans for some of the values and numeric values for others.\n\nIf you are using `lovr.graphics.setStencilTest`, it will not affect how the screen gets cleared. Instead, you can use `lovr.graphics.fill` to draw a fullscreen quad, which will get masked by the active stencil.",
          related = {
            "lovr.graphics.setBackgroundColor"
          },
          variants = {
            {
              description = "Clears the color, depth, and stencil to their default values.  Color will be cleared to the current background color, depth will be cleared to 1.0, and stencil will be cleared to 0.",
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
                },
                {
                  name = "stencil",
                  type = "boolean",
                  description = "Whether or not to clear the stencil information on the screen.",
                  default = "true"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "r",
                  type = "number",
                  description = "The value to clear the red channel to, from 0.0 to 1.0."
                },
                {
                  name = "g",
                  type = "number",
                  description = "The value to clear the green channel to, from 0.0 to 1.0."
                },
                {
                  name = "b",
                  type = "number",
                  description = "The value to clear the blue channel to, from 0.0 to 1.0."
                },
                {
                  name = "a",
                  type = "number",
                  description = "The value to clear the alpha channel to, from 0.0 to 1.0."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The value to clear the depth buffer to.",
                  default = "1.0"
                },
                {
                  name = "s",
                  type = "number",
                  description = "The integer value to clear the stencil buffer to.",
                  default = "0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "hex",
                  type = "number",
                  description = "A hexcode to clear the color to, in the form `0xffffff` (alpha unsupported)."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "compute",
          tag = "graphicsPrimitives",
          summary = "Run a compute shader.",
          description = "This function runs a compute shader on the GPU.  Compute shaders must be created with `lovr.graphics.newComputeShader` and they should implement the `void compute();` GLSL function. Running a compute shader doesn't actually do anything, but the Shader can modify data stored in `Texture`s or `ShaderBlock`s to get interesting things to happen.\n\nWhen running the compute shader, you can specify the number of times to run it in 3 dimensions, which is useful to iterate over large numbers of elements like pixels or array elements.",
          key = "lovr.graphics.compute",
          module = "lovr.graphics",
          notes = "Only compute shaders created with `lovr.graphics.newComputeShader` can be used here.\n\nThere are GPU-specific limits on the `x`, `y`, and `z` values which can be queried in the `compute` entry of `lovr.graphics.getLimits`.",
          related = {
            "lovr.graphics.newComputeShader",
            "lovr.graphics.getShader",
            "lovr.graphics.setShader",
            "Shader"
          },
          variants = {
            {
              arguments = {
                {
                  name = "shader",
                  type = "Shader",
                  description = "The compute shader to run."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The amount of times to run in the x direction.",
                  default = "1"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The amount of times to run in the y direction.",
                  default = "1"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The amount of times to run in the z direction.",
                  default = "1"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "createWindow",
          tag = "window",
          summary = "Creates the window.",
          description = "Create the desktop window, usually used to mirror the headset display.",
          key = "lovr.graphics.createWindow",
          module = "lovr.graphics",
          notes = "This function can only be called once.  It is normally called internally, but you can override this by setting window to `nil` in conf.lua.  See `lovr.conf` for more information.\n\nThe window must be created before any `lovr.graphics` functions can be used.",
          related = {
            "lovr.graphics.hasWindow",
            "lovr.conf"
          },
          variants = {
            {
              arguments = {
                {
                  name = "flags",
                  type = "table",
                  description = "Flags to customize the window's appearance and behavior.",
                  table = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the window, or 0 to use the size of the monitor.",
                      default = "1080"
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the window, or 0 to use the size of the monitor.",
                      default = "600"
                    },
                    {
                      name = "fullscreen",
                      type = "boolean",
                      description = "Whether the window should be fullscreen.",
                      default = "false"
                    },
                    {
                      name = "resizable",
                      type = "boolean",
                      description = "Whether the window should be resizable.",
                      default = "false"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The number of samples to use for multisample antialiasing.",
                      default = "0"
                    },
                    {
                      name = "title",
                      type = "string",
                      description = "The window title.",
                      default = "LÖVR"
                    },
                    {
                      name = "icon",
                      type = "string",
                      description = "A path to an image to use for the window icon.",
                      default = "nil"
                    },
                    {
                      name = "vsync",
                      type = "number",
                      description = "0 to disable vsync, 1 to enable.  This is only a hint, and may not be respected if necessary for the current VR display.",
                      default = "0"
                    }
                  }
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
                  type = "DrawStyle",
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
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the cube faces."
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
                  type = "DrawStyle",
                  description = "How to draw the cube."
                },
                {
                  name = "transform",
                  type = "mat4",
                  description = "The cube's transform."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the cube faces."
                },
                {
                  name = "transform",
                  type = "mat4",
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
          notes = "Currently, cylinders don't have UVs.",
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
                  name = "length",
                  type = "number",
                  description = "The length of the cylinder, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the cylinder around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the cylinder's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the cylinder's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the cylinder's axis of rotation.",
                  default = "0"
                },
                {
                  name = "r1",
                  type = "number",
                  description = "The radius of one end of the cylinder.",
                  default = "1"
                },
                {
                  name = "r2",
                  type = "number",
                  description = "The radius of the other end of the cylinder.",
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
            },
            {
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the cylinder."
                },
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
                  name = "length",
                  type = "number",
                  description = "The length of the cylinder, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The rotation of the cylinder around its rotation axis, in radians.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x coordinate of the cylinder's axis of rotation.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y coordinate of the cylinder's axis of rotation.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z coordinate of the cylinder's axis of rotation.",
                  default = "0"
                },
                {
                  name = "r1",
                  type = "number",
                  description = "The radius of one end of the cylinder.",
                  default = "1"
                },
                {
                  name = "r2",
                  type = "number",
                  description = "The radius of the other end of the cylinder.",
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
          name = "discard",
          tag = "graphicsPrimitives",
          summary = "Discard the current pixel values.",
          description = "Discards pixel information in the active Canvas or display.  This is mostly used as an optimization hint for the GPU, and is usually most helpful on mobile devices.",
          key = "lovr.graphics.discard",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.clear"
          },
          variants = {
            {
              arguments = {
                {
                  name = "color",
                  type = "boolean",
                  description = "Whether or not to discard color information.",
                  default = "true"
                },
                {
                  name = "depth",
                  type = "boolean",
                  description = "Whether or not to discard depth information.",
                  default = "true"
                },
                {
                  name = "stencil",
                  type = "boolean",
                  description = "Whether or not to discard stencil information.",
                  default = "true"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "fill",
          tag = "graphicsPrimitives",
          summary = "Fill the screen with a texture.",
          description = "Draws a fullscreen textured quad.",
          key = "lovr.graphics.fill",
          module = "lovr.graphics",
          notes = "This function ignores stereo rendering, so it will stretch the input across the entire Canvas if it's stereo.  Special shaders are currently required for correct stereo fills.",
          variants = {
            {
              description = "Fills the screen with a region of a Texture.",
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The texture to use."
                },
                {
                  name = "u",
                  type = "number",
                  description = "The x component of the uv offset.",
                  default = "0"
                },
                {
                  name = "v",
                  type = "number",
                  description = "The y component of the uv offset.",
                  default = "0"
                },
                {
                  name = "w",
                  type = "number",
                  description = "The width of the Texture to render, in uv coordinates.",
                  default = "1 - u"
                },
                {
                  name = "h",
                  type = "number",
                  description = "The height of the Texture to render, in uv coordinates.",
                  default = "1 - v"
                }
              },
              returns = {}
            },
            {
              description = "Fills the screen with the active color.",
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "flush",
          tag = "graphicsPrimitives",
          summary = "Flush any pending batched draw calls.",
          description = "Flushes the internal queue of draw batches.  Under normal circumstances this is done automatically when needed, but the ability to flush manually may be helpful if you're integrating a LÖVR project with some external rendering code.",
          key = "lovr.graphics.flush",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.clear",
            "lovr.graphics.discard"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "getAlphaSampling",
          tag = "graphicsState",
          summary = "Get whether alpha sampling is enabled.",
          description = "Returns whether or not alpha sampling is enabled.  Alpha sampling is also known as alpha-to-coverage.  When it is enabled, the alpha channel of a pixel is factored into how antialiasing is computed, so the edges of a transparent texture will be correctly antialiased.",
          key = "lovr.graphics.getAlphaSampling",
          module = "lovr.graphics",
          notes = "- Alpha sampling is disabled by default.\n- This feature can be used for a simple transparency effect, pixels with an alpha of zero will\n  have their depth value discarded, allowing things behind them to show through (normally you\n  have to sort objects or write a shader for this).",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "enabled",
                  type = "boolean",
                  description = "Whether or not alpha sampling is enabled."
                }
              }
            }
          }
        },
        {
          name = "getBackgroundColor",
          tag = "graphicsState",
          summary = "Get the background color.",
          description = "Returns the current background color.  Color components are from 0.0 to 1.0.",
          key = "lovr.graphics.getBackgroundColor",
          module = "lovr.graphics",
          notes = "The default background color is `(0.0, 0.0, 0.0, 1.0)`.",
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
          }
        },
        {
          name = "getBlendMode",
          tag = "graphicsState",
          summary = "Get the blend mode.",
          description = "Returns the current blend mode.  The blend mode controls how each pixel's color is blended with the previous pixel's color when drawn.\n\nIf blending is disabled, `nil` will be returned.",
          key = "lovr.graphics.getBlendMode",
          module = "lovr.graphics",
          notes = "The default blend mode is `alpha` and `alphamultiply`.",
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
          name = "getCanvas",
          tag = "graphicsState",
          summary = "Get the active Canvas.",
          description = "Returns the active Canvas.  Usually when you render something it will render directly to the headset.  If a Canvas object is active, things will be rendered to the textures attached to the Canvas instead.",
          key = "lovr.graphics.getCanvas",
          module = "lovr.graphics",
          related = {
            "Canvas:renderTo",
            "Canvas"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "canvas",
                  type = "Canvas",
                  description = "The active Canvas, or `nil` if no canvas is set."
                }
              }
            }
          }
        },
        {
          name = "getColor",
          tag = "graphicsState",
          summary = "Get the global color factor.",
          description = "Returns the current global color factor.  Color components are from 0.0 to 1.0.  Every pixel drawn will be multiplied (i.e. tinted) by this color.",
          key = "lovr.graphics.getColor",
          module = "lovr.graphics",
          notes = "The default color is `(1.0, 1.0, 1.0, 1.0)`.",
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
          }
        },
        {
          name = "getColorMask",
          tag = "graphicsState",
          summary = "Get whether each color channel is enabled.",
          description = "Returns a boolean for each color channel (red, green, blue, alpha) indicating whether it is enabled.  When a color channel is enabled, it will be affected by drawing commands and clear commands.",
          key = "lovr.graphics.getColorMask",
          module = "lovr.graphics",
          notes = "By default, all color channels are enabled.\n\nDisabling all of the color channels can be useful if you only want to write to the depth buffer or the stencil buffer.",
          related = {
            "lovr.graphics.stencil"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "getDefaultFilter",
          tag = "graphicsState",
          summary = "Get the default filter mode for Textures.",
          description = "Returns the default filter mode for new Textures.  This controls how textures are sampled when they are minified, magnified, or stretched.",
          key = "lovr.graphics.getDefaultFilter",
          module = "lovr.graphics",
          notes = "The default filter is `trilinear`.",
          related = {
            "Texture:getFilter",
            "Texture:setFilter"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "mode",
                  type = "FilterMode",
                  description = "The filter mode."
                },
                {
                  name = "anisotropy",
                  type = "number",
                  description = "The level of anisotropy."
                }
              }
            }
          }
        },
        {
          name = "getDepthTest",
          tag = "graphicsState",
          summary = "Get the depth test mode.",
          description = "Returns the current depth test settings.",
          key = "lovr.graphics.getDepthTest",
          module = "lovr.graphics",
          notes = "The depth test is an advanced technique to control how 3D objects overlap each other when they are rendered.  It works as follows:\n\n- Each pixel keeps track of its z value as well as its color.\n- If `write` is enabled when something is drawn, then any pixels that are drawn will have their\n  z values updated.\n- Additionally, anything drawn will first compare the existing z value of a pixel with the new z\n  value.  The `compareMode` setting determines how this comparison is performed.  If the\n  comparison succeeds, the new pixel will overwrite the previous one, otherwise that pixel won't\n  be rendered to.\n\nSmaller z values are closer to the camera.\n\nThe default compare mode is `lequal`, which usually gives good results for normal 3D rendering.",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "compareMode",
                  type = "CompareMode",
                  description = "The current comparison method for depth testing."
                },
                {
                  name = "write",
                  type = "boolean",
                  description = "Whether pixels will have their z value updated when rendered to."
                }
              }
            }
          }
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
            "lovr.graphics.getHeight",
            "lovr.graphics.getPixelDensity"
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
          name = "getFeatures",
          tag = "window",
          summary = "Check if certain features are supported.",
          description = "Returns whether certain features are supported by the system\\'s graphics card.",
          key = "lovr.graphics.getFeatures",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.getLimits"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "features",
                  type = "table",
                  description = "A table of features and whether or not they are supported.",
                  table = {
                    {
                      name = "astc",
                      type = "boolean",
                      description = "Whether ASTC textures are supported."
                    },
                    {
                      name = "compute",
                      type = "boolean",
                      description = "Whether compute shaders are available."
                    },
                    {
                      name = "dxt",
                      type = "boolean",
                      description = "Whether DXT (.dds) textures are supported."
                    },
                    {
                      name = "instancedstereo",
                      type = "boolean",
                      description = "True if the instanced single-pass stereo rendering method is supported."
                    },
                    {
                      name = "multiview",
                      type = "boolean",
                      description = "True if the multiview single-pass stereo rendering method is supported."
                    },
                    {
                      name = "timers",
                      type = "boolean",
                      description = "Whether `lovr.graphics.tick` and `lovr.graphics.tock` are supported."
                    }
                  }
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
            "lovr.graphics.getDimensions",
            "lovr.graphics.getPixelDensity"
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
          name = "getLimits",
          tag = "window",
          summary = "Get capabilities of the graphics card.",
          description = "Returns information about the maximum limits of the graphics card, such as the maximum texture size or the amount of supported antialiasing.",
          key = "lovr.graphics.getLimits",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.getFeatures"
          },
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
                      name = "anisotropy",
                      type = "number",
                      description = "The maximum anisotropy value supported by `Texture:setFilter`."
                    },
                    {
                      name = "blocksize",
                      type = "number",
                      description = "The maximum size of a uniform ShaderBlock, in bytes."
                    },
                    {
                      name = "pointsize",
                      type = "number",
                      description = "The maximum size of points, in pixels."
                    },
                    {
                      name = "texturemsaa",
                      type = "number",
                      description = "The maximum MSAA value supported by `lovr.graphics.newTexture`."
                    },
                    {
                      name = "texturesize",
                      type = "number",
                      description = "The maximum width or height of textures, in pixels."
                    },
                    {
                      name = "compute",
                      type = "table",
                      description = "A table of three numbers indicating the maximum number of compute threads that can be run with `lovr.graphics.compute`."
                    }
                  }
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
          notes = "The default line width is `1`.",
          related = {
            "lovr.graphics.line"
          },
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
          }
        },
        {
          name = "getPixelDensity",
          tag = "window",
          summary = "Get the pixel density of the window.",
          description = "Returns the pixel density of the window.  On \"high-dpi\" displays, this will be `2.0`, indicating that there are 2 pixels for every window coordinate.  On a normal display it will be `1.0`, meaning that the pixel to window-coordinate ratio is 1:1.",
          key = "lovr.graphics.getPixelDensity",
          module = "lovr.graphics",
          notes = "If the window isn't created yet, this function will return 0.",
          related = {
            "lovr.graphics.getWidth",
            "lovr.graphics.getHeight",
            "lovr.graphics.getDimensions",
            "lovr.graphics.createWindow",
            "lovr.conf"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "density",
                  type = "number",
                  description = "The pixel density of the window."
                }
              }
            }
          }
        },
        {
          name = "getPointSize",
          tag = "graphicsState",
          summary = "Get the point size.",
          description = "Returns the current point size.",
          key = "lovr.graphics.getPointSize",
          module = "lovr.graphics",
          notes = "The default point size is `1.0`.",
          related = {
            "lovr.graphics.points"
          },
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
          }
        },
        {
          name = "getProjection",
          tag = "graphicsState",
          summary = "Get the field of view.",
          description = "Returns the projection for a single view.",
          key = "lovr.graphics.getProjection",
          module = "lovr.graphics",
          notes = "Non-stereo rendering will only use the first view.\n\nThe projection matrices are available as the `mat4 lovrProjections[2]` variable in shaders.  The current projection matrix is available as `lovrProjection`.",
          related = {
            "lovr.headset.getViewAngles",
            "lovr.headset.getViewCount",
            "lovr.graphics.getViewPose",
            "lovr.graphics.setViewPose"
          },
          variants = {
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The view index."
                }
              },
              returns = {
                {
                  name = "left",
                  type = "number",
                  description = "The left field of view angle, in radians."
                },
                {
                  name = "right",
                  type = "number",
                  description = "The right field of view angle, in radians."
                },
                {
                  name = "up",
                  type = "number",
                  description = "The top field of view angle, in radians."
                },
                {
                  name = "down",
                  type = "number",
                  description = "The bottom field of view angle, in radians."
                }
              }
            },
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The view index."
                },
                {
                  name = "matrix",
                  type = "Mat4",
                  description = "The matrix to fill with the projection."
                }
              },
              returns = {
                {
                  name = "matrix",
                  type = "Mat4",
                  description = "The matrix containing the projection."
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
          name = "getStats",
          tag = "graphicsState",
          summary = "Get renderer stats for the current frame.",
          description = "Returns graphics-related performance statistics for the current frame.",
          key = "lovr.graphics.getStats",
          module = "lovr.graphics",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "stats",
                  type = "table",
                  description = "The table of stats.",
                  table = {
                    {
                      name = "drawcalls",
                      type = "number",
                      description = "The number of draw calls."
                    },
                    {
                      name = "renderpasses",
                      type = "number",
                      description = "The number of times the canvas has been switched."
                    },
                    {
                      name = "shaderswitches",
                      type = "number",
                      description = "The number of times the shader has been switched."
                    },
                    {
                      name = "buffers",
                      type = "number",
                      description = "The number of buffers."
                    },
                    {
                      name = "textures",
                      type = "number",
                      description = "The number of textures."
                    },
                    {
                      name = "buffermemory",
                      type = "number",
                      description = "The amount of memory used by buffers, in bytes."
                    },
                    {
                      name = "texturememory",
                      type = "number",
                      description = "The amount of memory used by textures, in bytes."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "getStencilTest",
          tag = "graphicsState",
          summary = "Get the current stencil test.",
          description = "Returns the current stencil test.  The stencil test lets you mask out pixels that meet certain criteria, based on the contents of the stencil buffer.  The stencil buffer can be modified using `lovr.graphics.stencil`.  After rendering to the stencil buffer, the stencil test can be set to control how subsequent drawing functions are masked by the stencil buffer.",
          key = "lovr.graphics.getStencilTest",
          module = "lovr.graphics",
          notes = "Stencil values are between 0 and 255.\n\nBy default, the stencil test is disabled.",
          related = {
            "lovr.graphics.stencil"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "compareMode",
                  type = "CompareMode",
                  description = "The comparison method used to decide if a pixel should be visible, or nil if the stencil test is disabled."
                },
                {
                  name = "compareValue",
                  type = "number",
                  description = "The value stencil values are compared against, or nil if the stencil test is disabled."
                }
              }
            }
          }
        },
        {
          name = "getViewPose",
          tag = "graphicsState",
          summary = "Get the camera pose.",
          description = "Get the pose of a single view.",
          key = "lovr.graphics.getViewPose",
          module = "lovr.graphics",
          related = {
            "lovr.headset.getViewPose",
            "lovr.headset.getViewCount",
            "lovr.graphics.getProjection",
            "lovr.graphics.setProjection"
          },
          variants = {
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The view index."
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the viewer, in meters."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the viewer, in meters."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the viewer, in meters."
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians the viewer is rotated around its axis of rotation."
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
            },
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The view index."
                },
                {
                  name = "matrix",
                  type = "Mat4",
                  description = "The matrix to fill with the view pose."
                },
                {
                  name = "invert",
                  type = "boolean",
                  description = "Whether the matrix should be inverted."
                }
              },
              returns = {
                {
                  name = "matrix",
                  type = "Mat4",
                  description = "The matrix containing the view pose."
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
            "lovr.graphics.getDimensions",
            "lovr.graphics.getPixelDensity"
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
          name = "getWinding",
          tag = "graphicsState",
          summary = "Get the winding direction.",
          description = "Returns the current polygon winding.  The winding direction determines which face of a triangle is the front face and which is the back face.  This lets the graphics engine cull the back faces of polygons, improving performance.",
          key = "lovr.graphics.getWinding",
          module = "lovr.graphics",
          notes = "Culling is initially disabled and must be enabled using `lovr.graphics.setCullingEnabled`.\n\nThe default winding direction is counterclockwise.",
          related = {
            "lovr.graphics.setCullingEnabled",
            "lovr.graphics.isCullingEnabled"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "winding",
                  type = "Winding",
                  description = "The current winding direction."
                }
              }
            }
          }
        },
        {
          name = "hasWindow",
          tag = "window",
          summary = "Check if the window is created.",
          description = "Returns whether the desktop window is currently created.",
          key = "lovr.graphics.hasWindow",
          module = "lovr.graphics",
          notes = "Most of the `lovr.graphics` functionality will only work if a window is created.",
          related = {
            "lovr.graphics.createWindow",
            "lovr.conf"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "present",
                  type = "boolean",
                  description = "Whether a window is created."
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
          notes = "Culling is disabled by default.",
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
          }
        },
        {
          name = "isWireframe",
          tag = "graphicsState",
          summary = "Get whether wireframe mode is enabled.",
          description = "Returns a boolean indicating whether or not wireframe rendering is enabled.",
          key = "lovr.graphics.isWireframe",
          module = "lovr.graphics",
          notes = "Wireframe rendering is initially disabled.\n\nWireframe rendering is only supported on desktop systems.",
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
          }
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
          name = "newCanvas",
          tag = "graphicsObjects",
          summary = "Create a new Canvas.",
          description = "Creates a new Canvas.  You can specify Textures to attach to it, or just specify a width and height and attach textures later using `Canvas:setTexture`.\n\nOnce created, you can render to the Canvas using `Canvas:renderTo`, or `lovr.graphics.setCanvas`.",
          key = "lovr.graphics.newCanvas",
          module = "lovr.graphics",
          notes = "Textures created by this function will have `clamp` as their `WrapMode`.\n\nStereo Canvases will either have their width doubled or use array textures for their attachments, depending on their implementation.",
          related = {
            "lovr.graphics.setCanvas",
            "lovr.graphics.getCanvas",
            "Canvas:renderTo"
          },
          variants = {
            {
              description = "Create an empty Canvas with no Textures attached.",
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the canvas, in pixels."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the canvas, in pixels."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the Canvas.",
                  default = "{}",
                  table = {
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format of a Texture to create and attach to this Canvas, or false if no Texture should be created.  This is ignored if Textures are already passed in.",
                      default = "'rgba'"
                    },
                    {
                      name = "depth",
                      type = "TextureFormat",
                      description = "A depth TextureFormat to use for the Canvas depth buffer, or false for no depth buffer. Note that this can also be a table with `format` and `readable` keys.",
                      default = "'d16'"
                    },
                    {
                      name = "stereo",
                      type = "boolean",
                      description = "Whether the Canvas is stereo.",
                      default = "true"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The number of MSAA samples to use for antialiasing.",
                      default = "0"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether the Canvas will automatically generate mipmaps for its attached textures.",
                      default = "true"
                    }
                  }
                }
              },
              returns = {
                {
                  name = "canvas",
                  type = "Canvas",
                  description = "The new Canvas."
                }
              }
            },
            {
              description = "Create a Canvas with attached Textures.",
              arguments = {
                {
                  name = "...",
                  type = "Texture",
                  description = "One or more Textures to attach to the Canvas."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the Canvas.",
                  default = "{}",
                  table = {
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format of a Texture to create and attach to this Canvas, or false if no Texture should be created.  This is ignored if Textures are already passed in.",
                      default = "'rgba'"
                    },
                    {
                      name = "depth",
                      type = "TextureFormat",
                      description = "A depth TextureFormat to use for the Canvas depth buffer, or false for no depth buffer. Note that this can also be a table with `format` and `readable` keys.",
                      default = "'d16'"
                    },
                    {
                      name = "stereo",
                      type = "boolean",
                      description = "Whether the Canvas is stereo.",
                      default = "true"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The number of MSAA samples to use for antialiasing.",
                      default = "0"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether the Canvas will automatically generate mipmaps for its attached textures.",
                      default = "true"
                    }
                  }
                }
              },
              returns = {
                {
                  name = "canvas",
                  type = "Canvas",
                  description = "The new Canvas."
                }
              }
            },
            {
              description = "Create a Canvas with attached Textures, using specific layers and mipmap levels from each one.  Layers and mipmaps can be specified after each Texture as numbers, or a table of a Texture, layer, and mipmap can be used for each attachment.",
              arguments = {
                {
                  name = "attachments",
                  type = "table",
                  description = "A table of textures, layers, and mipmaps (in any combination) to attach."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the Canvas.",
                  default = "{}",
                  table = {
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format of a Texture to create and attach to this Canvas, or false if no Texture should be created.  This is ignored if Textures are already passed in.",
                      default = "'rgba'"
                    },
                    {
                      name = "depth",
                      type = "TextureFormat",
                      description = "A depth TextureFormat to use for the Canvas depth buffer, or false for no depth buffer. Note that this can also be a table with `format` and `readable` keys.",
                      default = "'d16'"
                    },
                    {
                      name = "stereo",
                      type = "boolean",
                      description = "Whether the Canvas is stereo.",
                      default = "true"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The number of MSAA samples to use for antialiasing.",
                      default = "0"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether the Canvas will automatically generate mipmaps for its attached textures.",
                      default = "true"
                    }
                  }
                }
              },
              returns = {
                {
                  name = "canvas",
                  type = "Canvas",
                  description = "The new Canvas."
                }
              }
            }
          }
        },
        {
          name = "newComputeShader",
          tag = "graphicsObjects",
          summary = "Create a new compute Shader.",
          description = "Creates a new compute Shader, used for running generic compute operations on the GPU.",
          key = "lovr.graphics.newComputeShader",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.compute",
            "lovr.graphics.newShader",
            "lovr.graphics.setShader",
            "lovr.graphics.getShader"
          },
          examples = {
            {
              code = "function lovr.load()\n  computer = lovr.graphics.newComputeShader([[\n    layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;\n\n    void compute() {\n      // compute things!?\n    }\n  ]])\n\n  -- Run the shader 4 times\n  local width, height, depth = 4, 1, 1\n\n  -- Dispatch the compute operation\n  lovr.graphics.compute(computer, width, height, depth)\nend"
            }
          },
          notes = "Compute shaders are not supported on all hardware, use `lovr.graphics.getFeatures` to check if they're available on the current system.\n\nThe source code for a compute shader needs to implement the `void compute();` GLSL function. This function doesn't return anything, but the compute shader is able to write data out to `Texture`s or `ShaderBlock`s.\n\nThe GLSL version used for compute shaders is GLSL 430.\n\nCurrently, up to 32 shader flags are supported.",
          variants = {
            {
              arguments = {
                {
                  name = "source",
                  type = "string",
                  description = "The code or filename of the compute shader."
                },
                {
                  name = "options",
                  type = "table",
                  description = "Optional settings for the Shader.",
                  table = {
                    {
                      name = "flags",
                      type = "table",
                      description = "A table of key-value options passed to the Shader.",
                      default = "{}"
                    }
                  },
                  default = "{}"
                }
              },
              returns = {
                {
                  name = "shader",
                  type = "Shader",
                  description = "The new compute Shader."
                }
              }
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
          notes = "Larger font sizes will lead to more detailed curves at the cost of performance.",
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
                },
                {
                  name = "padding",
                  type = "number",
                  description = "The number of pixels of padding around each glyph.",
                  default = "2"
                },
                {
                  name = "spread",
                  type = "number",
                  description = "The range of the distance field, in pixels.",
                  default = "4.0"
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
              description = "Creates a new Font from the default font included with LÖVR (Varela Round).",
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The size of the font, in pixels.",
                  default = "32"
                },
                {
                  name = "padding",
                  type = "number",
                  description = "The number of pixels of padding around each glyph.",
                  default = "2"
                },
                {
                  name = "spread",
                  type = "number",
                  description = "The range of the distance field, in pixels.",
                  default = "4.0"
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
              arguments = {
                {
                  name = "rasterizer",
                  type = "Rasterizer",
                  description = "The existing Rasterizer object used to render the glyphs."
                },
                {
                  name = "padding",
                  type = "number",
                  description = "The number of pixels of padding around each glyph.",
                  default = "2"
                },
                {
                  name = "spread",
                  type = "number",
                  description = "The range of the distance field, in pixels.",
                  default = "4.0"
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
          name = "newMaterial",
          tag = "graphicsObjects",
          summary = "Create a new Material.",
          description = "Creates a new Material.  Materials are sets of colors, textures, and other parameters that affect the appearance of objects.  They can be applied to `Model`s, `Mesh`es, and most graphics primitives accept a Material as an optional first argument.",
          key = "lovr.graphics.newMaterial",
          module = "lovr.graphics",
          notes = "- Scalar properties will default to `1.0`.\n- Color properties will default to `(1.0, 1.0, 1.0, 1.0)`, except for `emissive` which will\n  default to `(0.0, 0.0, 0.0, 0.0)`.\n- Textures will default to `nil` (a single 1x1 white pixel will be used for them).",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "material",
                  type = "Material",
                  description = "The new Material."
                }
              }
            },
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The diffuse texture."
                },
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the diffuse color.",
                  default = "1"
                }
              },
              returns = {
                {
                  name = "material",
                  type = "Material",
                  description = "The new Material."
                }
              }
            },
            {
              arguments = {
                {
                  name = "canvas",
                  type = "Canvas",
                  description = "A Canvas to use as the diffuse texture."
                },
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the diffuse color.",
                  default = "1"
                }
              },
              returns = {
                {
                  name = "material",
                  type = "Material",
                  description = "The new Material."
                }
              }
            },
            {
              arguments = {
                {
                  name = "r",
                  type = "number",
                  description = "The red component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "g",
                  type = "number",
                  description = "The green component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "b",
                  type = "number",
                  description = "The blue component of the diffuse color.",
                  default = "1"
                },
                {
                  name = "a",
                  type = "number",
                  description = "The alpha component of the diffuse color.",
                  default = "1"
                }
              },
              returns = {
                {
                  name = "material",
                  type = "Material",
                  description = "The new Material."
                }
              }
            },
            {
              arguments = {
                {
                  name = "hex",
                  type = "number",
                  description = "A hexcode to use for the diffuse color (alpha is not supported).",
                  default = "0xffffff"
                }
              },
              returns = {
                {
                  name = "material",
                  type = "Material",
                  description = "The new Material."
                }
              }
            }
          }
        },
        {
          name = "newMesh",
          tag = "graphicsObjects",
          summary = "Create a new Mesh.",
          description = "Creates a new Mesh.  Meshes contain the data for an arbitrary set of vertices, and can be drawn. You must specify either the capacity for the Mesh or an initial set of vertex data.  Optionally, a custom format table can be used to specify the set of vertex attributes the mesh will provide to the active shader.  The draw mode and usage hint can also optionally be specified.\n\nThe default data type for an attribute is `float`, and the default component count is 1.",
          key = "lovr.graphics.newMesh",
          module = "lovr.graphics",
          notes = "Once created, the size and format of the Mesh cannot be changed.'\n\nThe default mesh format is:\n\n    {\n      { 'lovrPosition',    'float', 3 },\n      { 'lovrNormal',      'float', 3 },\n      { 'lovrTexCoord',    'float', 2 }\n    }",
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
                  type = "DrawMode",
                  description = "How the Mesh will connect its vertices into triangles.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "An optimization hint indicating how often the data in the Mesh will be updated.",
                  default = "'dynamic'"
                },
                {
                  name = "readable",
                  type = "boolean",
                  description = "Whether vertices from the Mesh can be read.",
                  default = "false"
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
                  type = "DrawMode",
                  description = "How the Mesh will connect its vertices into triangles.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "An optimization hint indicating how often the data in the Mesh will be updated.",
                  default = "'dynamic'"
                },
                {
                  name = "readable",
                  type = "boolean",
                  description = "Whether vertices from the Mesh can be read.",
                  default = "false"
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
                  name = "blob",
                  type = "Blob",
                  description = "A binary Blob containing vertex data."
                },
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How the Mesh will connect its vertices into triangles.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "An optimization hint indicating how often the data in the Mesh will be updated.",
                  default = "'dynamic'"
                },
                {
                  name = "readable",
                  type = "boolean",
                  description = "Whether vertices from the Mesh can be read.",
                  default = "false"
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
              description = "These variants accept a custom vertex format.  For more info, see the `Mesh` page.",
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
                  type = "DrawMode",
                  description = "How the Mesh will connect its vertices into triangles.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "An optimization hint indicating how often the data in the Mesh will be updated.",
                  default = "'dynamic'"
                },
                {
                  name = "readable",
                  type = "boolean",
                  description = "Whether vertices from the Mesh can be read.",
                  default = "false"
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
                  type = "DrawMode",
                  description = "How the Mesh will connect its vertices into triangles.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "An optimization hint indicating how often the data in the Mesh will be updated.",
                  default = "'dynamic'"
                },
                {
                  name = "readable",
                  type = "boolean",
                  description = "Whether vertices from the Mesh can be read.",
                  default = "false"
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
                  name = "blob",
                  type = "Blob",
                  description = "A binary Blob containing vertex data."
                },
                {
                  name = "mode",
                  type = "DrawMode",
                  description = "How the Mesh will connect its vertices into triangles.",
                  default = "'fan'"
                },
                {
                  name = "usage",
                  type = "MeshUsage",
                  description = "An optimization hint indicating how often the data in the Mesh will be updated.",
                  default = "'dynamic'"
                },
                {
                  name = "readable",
                  type = "boolean",
                  description = "Whether vertices from the Mesh can be read.",
                  default = "false"
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
          description = "Creates a new Model from a file.  The supported 3D file formats are OBJ, glTF, and STL.",
          key = "lovr.graphics.newModel",
          module = "lovr.graphics",
          notes = "Diffuse and emissive textures will be loaded in the sRGB encoding, all other textures will be loaded as linear.\n\nCurrently, the following features are not supported by the model importer:\n\n- OBJ: Quads are not supported (only triangles).\n- glTF: Sparse accessors are not supported.\n- glTF: Morph targets are not supported.\n- glTF: base64 images are not supported (base64 buffer data works though).\n- glTF: Only the default scene is loaded.\n- glTF: Currently, each skin in a Model can have up to 48 joints.\n- STL: ASCII STL files are not supported.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the model to load."
                }
              },
              returns = {
                {
                  name = "model",
                  type = "Model",
                  description = "The new Model."
                }
              }
            },
            {
              arguments = {
                {
                  name = "modelData",
                  type = "ModelData",
                  description = "The ModelData containing the data for the Model."
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
          notes = "The `flags` table should contain string keys, with boolean or numeric values.  These flags can be used to customize the behavior of Shaders from Lua, by using the flags in the shader source code.  Numeric flags will be available as constants named `FLAG_<flagName>`.  Boolean flags can be used with `#ifdef` and will only be defined if the value in the Lua table was `true`.\n\nThe following flags are used by shaders provided by LÖVR:\n\n- `animated` is a boolean flag that will cause the shader to position vertices based on the pose\n  of an animated skeleton.  This should usually only be used for animated `Model`s, since it\n  needs a skeleton to work properly and is slower than normal rendering.\n- `alphaCutoff` is a numeric flag that can be used to implement simple \"cutout\" style\n  transparency, where pixels with alpha below a certain threshold will be discarded.  The value\n  of the flag should be a number between 0.0 and 1.0, representing the alpha threshold.\n- `uniformScale` is a boolean flag used for optimization.  If the Shader is only going to be\n  used with objects that have a *uniform* scale (i.e. the x, y, and z components of the scale\n  are all the same number), then this flag can be set to use a faster method to compute the\n  `lovrNormalMatrix` uniform variable.\n- `multicanvas` is a boolean flag that should be set when rendering to multiple Textures\n  attached to a `Canvas`.  When set, the fragment shader should implement the `colors` function\n  instead of the `color` function, and can write color values to the `lovrCanvas` array instead\n  of returning a single color.  Each color in the array gets written to the corresponding\n  texture attached to the canvas.\n- `highp` is a boolean flag specific to mobile GPUs that changes the default precision for\n  fragment shaders to use high precision instead of the default medium precision.  This can fix\n  visual issues caused by a lack of precision, but isn't guaranteed to be supported on some\n  lower-end systems.\n- The following flags are used only by the `standard` PBR shader:\n  - `normalMap` should be set to `true` to render objects with a normal map, providing a more\n  detailed, bumpy appearance.  Currently, this requires the model to have vertex tangents.\n  - `emissive` should be set to `true` to apply emissive maps to rendered objects.  This is\n    usually used to apply glowing lights or screens to objects, since the emissive texture is\n    not affected at all by lighting.\n  - `indirectLighting` is an *awesome* boolean flag that will apply realistic reflections and\n    lighting to the surface of an object, based on a specially-created skybox.  See the\n    `Standard Shader` guide for more information.\n  - `occlusion` is a boolean flag that uses the ambient occlusion texture in the model.  It only\n    affects indirect lighting, so it will only have an effect if the `indirectLighting` flag is\n    also enabled.\n  - `skipTonemap` is a flag that will skip the tonemapping process.  Tonemapping is an important\n    process that maps the high definition physical color values down to a 0 - 1 range for\n    display.  There are lots of different tonemapping algorithms that give different artistic\n    effects.  The default tonemapping in the standard shader is the ACES algorithm, but you can\n    use this flag to turn off ACES and use your own tonemapping.\n\nCurrently, up to 32 shader flags are supported.\n\nThe `stereo` option is only necessary for Android.  Currently on Android, only stereo shaders can be used with stereo Canvases, and mono Shaders can only be used with mono Canvases.",
          related = {
            "lovr.graphics.setShader",
            "lovr.graphics.getShader",
            "lovr.graphics.newComputeShader"
          },
          variants = {
            {
              description = "Create a Shader with custom GLSL code.",
              arguments = {
                {
                  name = "vertex",
                  type = "string",
                  description = "The code or filename of the vertex shader.  If nil, the default vertex shader is used."
                },
                {
                  name = "fragment",
                  type = "string",
                  description = "The code or filename of the fragment shader.  If nil, the default fragment shader is used."
                },
                {
                  name = "options",
                  type = "table",
                  description = "Optional settings for the Shader.",
                  default = "{}",
                  table = {
                    {
                      name = "flags",
                      type = "table",
                      description = "A table of key-value options passed to the Shader.",
                      default = "{}"
                    },
                    {
                      name = "stereo",
                      type = "boolean",
                      description = "Whether the Shader should be configured for stereo rendering (Currently Android-only).",
                      default = "true"
                    }
                  }
                }
              },
              returns = {
                {
                  name = "shader",
                  type = "Shader",
                  description = "The new Shader."
                }
              }
            },
            {
              description = "Create a new instance of a built-in Shader.",
              arguments = {
                {
                  name = "default",
                  type = "DefaultShader",
                  description = "A builtin shader to use for the shader code."
                },
                {
                  name = "options",
                  type = "table",
                  description = "Optional settings for the Shader.",
                  default = "{}",
                  table = {
                    {
                      name = "flags",
                      type = "table",
                      description = "A table of key-value options passed to the Shader.",
                      default = "{}"
                    },
                    {
                      name = "stereo",
                      type = "boolean",
                      description = "Whether the Shader should be configured for stereo rendering (Currently Android-only).",
                      default = "true"
                    }
                  }
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
          name = "newShaderBlock",
          tag = "graphicsObjects",
          summary = "Create a new ShaderBlock.",
          description = "Creates a new ShaderBlock from a table of variable definitions with their names and types.",
          key = "lovr.graphics.newShaderBlock",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.newShader",
            "lovr.graphics.newComputeShader"
          },
          examples = {
            {
              description = "Create a ShaderBlock to hold a block of useful shader data.",
              code = "function lovr.load()\n  block = lovr.graphics.newShaderBlock('uniform', {\n    time = 'float',\n    lightCount = 'int',\n    lightPositions = { 'vec3', 16 },\n    lightColors = { 'vec3', 16 },\n    objectCount = 'int',\n    objectTransforms = { 'mat4', 256 }\n  }, 'uniform')\n\n  shader = lovr.graphics.newShader(\n    block:getShaderCode('Block') .. -- Define the block in the shader\n    [[\n      vec4 lovrMain() {\n        // ...use the object transforms from the block\n        return lovrProjection * lovrTransform * lovrVertex;\n      }\n    ]],\n\n    block:getShaderCode('Block') ..\n    [[\n      vec4 lovrMain() {\n        // ...use the lights from the block\n        return lovrGraphicsColor * texture(lovrDiffuseTexture, lovrTexCoord);\n      }\n    ]]\n  )\n\n  -- Bind the block to the shader\n  shader:sendBlock('Block', block)\nend\n\n-- Update the data in the block every frame\nfunction lovr.update(dt)\n  block:send('time', lovr.timer.getTime())\n  block:send('lightCount', lightCount)\n  block:send('lightPositions', { { x, y, z}, { x, y, z } })\n  -- etc.\nend"
            }
          },
          notes = "`compute` blocks can only be true if compute shaders are supported, see `lovr.graphics.getFeatures`.  Compute blocks may be slightly slower than uniform blocks, but they can also be much, much larger.  Uniform blocks are usually limited to around 16 kilobytes in size, depending on hardware.",
          variants = {
            {
              arguments = {
                {
                  name = "type",
                  type = "BlockType",
                  description = "Whether the block will be used for read-only uniform data or compute shaders."
                },
                {
                  name = "uniforms",
                  type = "table",
                  description = "A table where the keys are uniform names and the values are uniform types.  Uniform arrays can be specified by supplying a table as the uniform's value containing the type and the array size."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings.",
                  table = {
                    {
                      name = "usage",
                      type = "BufferUsage",
                      description = "How the data in the block will be updated.",
                      default = "'dynamic'"
                    },
                    {
                      name = "readable",
                      type = "boolean",
                      description = "Whether the data in the block can be read using `ShaderBlock:read`.",
                      default = "false"
                    }
                  },
                  default = "{}"
                }
              },
              returns = {
                {
                  name = "shaderBlock",
                  type = "ShaderBlock",
                  description = "The new ShaderBlock."
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
          notes = "The \"linear\" flag should be set to true for textures that don't contain color information, such as normal maps.\n\nRight now the supported image file formats are png, jpg, hdr, dds (DXT1, DXT3, DXT5), ktx, and astc.",
          variants = {
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "The filename of the image to load."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the texture.",
                  default = "{}",
                  table = {
                    {
                      name = "linear",
                      type = "boolean",
                      description = "Whether the texture is in linear color space instead of the usual sRGB.",
                      default = "false"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether mipmaps will be generated for the texture.",
                      default = "true"
                    },
                    {
                      name = "type",
                      type = "TextureType",
                      description = "The type of Texture to load the images into.  If nil, the type will be `2d` for a single image, `array` for a table of images with numeric keys, or `cube` for a table of images with string keys.",
                      default = "nil"
                    },
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format used for the Texture (when creating a blank texture).",
                      default = "'rgba'"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The antialiasing level to use (when attaching the Texture to a Canvas).",
                      default = "0"
                    }
                  }
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
              description = "Create a Texture from a table of filenames, Blobs, or Images.  For cube textures, the individual faces can be specified using the string keys \"right\", \"left\", \"top\", \"bottom\", \"back\", \"front\".",
              arguments = {
                {
                  name = "images",
                  type = "table",
                  description = "A table of image filenames to load."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the texture.",
                  default = "{}",
                  table = {
                    {
                      name = "linear",
                      type = "boolean",
                      description = "Whether the texture is in linear color space instead of the usual sRGB.",
                      default = "false"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether mipmaps will be generated for the texture.",
                      default = "true"
                    },
                    {
                      name = "type",
                      type = "TextureType",
                      description = "The type of Texture to load the images into.  If nil, the type will be `2d` for a single image, `array` for a table of images with numeric keys, or `cube` for a table of images with string keys.",
                      default = "nil"
                    },
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format used for the Texture (when creating a blank texture).",
                      default = "'rgba'"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The antialiasing level to use (when attaching the Texture to a Canvas).",
                      default = "0"
                    }
                  }
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
              description = "Creates a blank Texture with specified dimensions.  This saves memory if you're planning on rendering to the Texture using a Canvas or a compute shader, but the contents of the Texture will be initialized to random data.",
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The width of the Texture."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the Texture."
                },
                {
                  name = "depth",
                  type = "number",
                  description = "The depth of the Texture."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the texture.",
                  default = "{}",
                  table = {
                    {
                      name = "linear",
                      type = "boolean",
                      description = "Whether the texture is in linear color space instead of the usual sRGB.",
                      default = "false"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether mipmaps will be generated for the texture.",
                      default = "true"
                    },
                    {
                      name = "type",
                      type = "TextureType",
                      description = "The type of Texture to load the images into.  If nil, the type will be `2d` for a single image, `array` for a table of images with numeric keys, or `cube` for a table of images with string keys.",
                      default = "nil"
                    },
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format used for the Texture (when creating a blank texture).",
                      default = "'rgba'"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The antialiasing level to use (when attaching the Texture to a Canvas).",
                      default = "0"
                    }
                  }
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
              description = "Create a texture from a single Blob.",
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The Blob containing encoded image data used to create the Texture."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the texture.",
                  default = "{}",
                  table = {
                    {
                      name = "linear",
                      type = "boolean",
                      description = "Whether the texture is in linear color space instead of the usual sRGB.",
                      default = "false"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether mipmaps will be generated for the texture.",
                      default = "true"
                    },
                    {
                      name = "type",
                      type = "TextureType",
                      description = "The type of Texture to load the images into.  If nil, the type will be `2d` for a single image, `array` for a table of images with numeric keys, or `cube` for a table of images with string keys.",
                      default = "nil"
                    },
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format used for the Texture (when creating a blank texture).",
                      default = "'rgba'"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The antialiasing level to use (when attaching the Texture to a Canvas).",
                      default = "0"
                    }
                  }
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
              description = "Create a texture from a single Image.",
              arguments = {
                {
                  name = "image",
                  type = "Image",
                  description = "The Image to create the Texture from."
                },
                {
                  name = "flags",
                  type = "table",
                  description = "Optional settings for the texture.",
                  default = "{}",
                  table = {
                    {
                      name = "linear",
                      type = "boolean",
                      description = "Whether the texture is in linear color space instead of the usual sRGB.",
                      default = "false"
                    },
                    {
                      name = "mipmaps",
                      type = "boolean",
                      description = "Whether mipmaps will be generated for the texture.",
                      default = "true"
                    },
                    {
                      name = "type",
                      type = "TextureType",
                      description = "The type of Texture to load the images into.  If nil, the type will be `2d` for a single image, `array` for a table of images with numeric keys, or `cube` for a table of images with string keys.",
                      default = "nil"
                    },
                    {
                      name = "format",
                      type = "TextureFormat",
                      description = "The format used for the Texture (when creating a blank texture).",
                      default = "'rgba'"
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The antialiasing level to use (when attaching the Texture to a Canvas).",
                      default = "0"
                    }
                  }
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
          notes = "This is called at the beginning of every frame to reset the coordinate space.",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "plane",
          tag = "graphicsPrimitives",
          summary = "Draw a plane.",
          description = "Draws a plane with a given position, size, and orientation.",
          key = "lovr.graphics.plane",
          module = "lovr.graphics",
          notes = "The `u`, `v`, `w`, `h` arguments can be used to select a subregion of the diffuse texture to apply to the plane.  One efficient technique for rendering many planes with different textures is to pack all of the textures into a single image, and then use the uv arguments to select a sub-rectangle to use for each plane.",
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "DrawStyle",
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
                  name = "width",
                  type = "number",
                  description = "The width of the plane, in meters.",
                  default = "1"
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the plane, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians to rotate around the rotation axis.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the rotation axis.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the rotation axis.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the rotation axis.",
                  default = "0"
                },
                {
                  name = "u",
                  type = "number",
                  description = "The u coordinate of the texture.",
                  default = "0.0"
                },
                {
                  name = "v",
                  type = "number",
                  description = "The v coordinate of the texture.",
                  default = "0.0"
                },
                {
                  name = "w",
                  type = "number",
                  description = "The width of the texture UVs to render.",
                  default = "1.0 - u"
                },
                {
                  name = "h",
                  type = "number",
                  description = "The height of the texture UVs to render.",
                  default = "1.0 - v"
                }
              },
              returns = {}
            },
            {
              description = "Draw a plane with a custom material.",
              arguments = {
                {
                  name = "material",
                  type = "Material",
                  description = "The material to apply to the plane."
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
                  name = "width",
                  type = "number",
                  description = "The width of the plane, in meters.",
                  default = "1"
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the plane, in meters.",
                  default = "1"
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians to rotate around the rotation axis.",
                  default = "0"
                },
                {
                  name = "ax",
                  type = "number",
                  description = "The x component of the rotation axis.",
                  default = "0"
                },
                {
                  name = "ay",
                  type = "number",
                  description = "The y component of the rotation axis.",
                  default = "1"
                },
                {
                  name = "az",
                  type = "number",
                  description = "The z component of the rotation axis.",
                  default = "0"
                },
                {
                  name = "u",
                  type = "number",
                  description = "The u coordinate of the texture.",
                  default = "0.0"
                },
                {
                  name = "v",
                  type = "number",
                  description = "The v coordinate of the texture.",
                  default = "0.0"
                },
                {
                  name = "w",
                  type = "number",
                  description = "The width of the texture UVs to render.",
                  default = "1.0 - u"
                },
                {
                  name = "h",
                  type = "number",
                  description = "The height of the texture UVs to render.",
                  default = "1.0 - v"
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
          notes = "An error is thrown if there isn't a transform to pop.  This can happen if you forget to call push before calling pop, or if you have an unbalanced sequence of pushes and pops.",
          related = {
            "lovr.graphics.push"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "present",
          tag = "window",
          summary = "Present a frame to the window.",
          description = "Presents the results of pending drawing operations to the window.  This is automatically called after `lovr.draw` by the default `lovr.run` function.",
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
          notes = "Unicode text is supported.\n\nUse `\\n` to add line breaks.  `\\t` will be rendered as four spaces.\n\nLÖVR uses a fancy technique for font rendering called multichannel signed distance fields.  This leads to crisp text in VR, but requires a special shader to use.  LÖVR internally switches to the appropriate shader, but only when the default shader is already set.  If you see strange font artifacts, make sure you switch back to the default shader by using `lovr.graphics.setShader()` before you draw text.",
          related = {
            "lovr.graphics.getFont",
            "lovr.graphics.setFont",
            "lovr.graphics.newFont",
            "Font"
          },
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
                  description = "The maximum width of each line, in meters (before scale is applied).  Set to 0 or nil for no wrapping.",
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
          }
        },
        {
          name = "push",
          tag = "graphicsTransforms",
          summary = "Push a copy of the current transform onto the stack.",
          description = "Pushes a copy of the current transform onto the transformation stack.  After changing the transform using `lovr.graphics.translate`, `lovr.graphics.rotate`, and `lovr.graphics.scale`, the original state can be restored using `lovr.graphics.pop`.",
          key = "lovr.graphics.push",
          module = "lovr.graphics",
          notes = "An error is thrown if more than 64 matrices are pushed.  This can happen accidentally if a push isn't followed by a corresponding pop.",
          related = {
            "lovr.graphics.pop"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "reset",
          tag = "graphicsState",
          summary = "Reset all graphics state.",
          description = "Resets all graphics state to the initial values.",
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
          notes = "Order matters when scaling, translating, and rotating the coordinate system.",
          related = {
            "lovr.graphics.scale",
            "lovr.graphics.translate",
            "lovr.graphics.transform"
          },
          variants = {
            {
              arguments = {
                {
                  name = "angle",
                  type = "number",
                  description = "The amount to rotate the coordinate system by, in radians.",
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
            }
          }
        },
        {
          name = "scale",
          tag = "graphicsTransforms",
          summary = "Scale the coordinate system.",
          description = "Scales the coordinate system in 3 dimensions.  This will cause objects to appear bigger or smaller.\n\nThe scaling will last until `lovr.draw` returns or the transformation is popped off the transformation stack.",
          key = "lovr.graphics.scale",
          module = "lovr.graphics",
          notes = "Order matters when scaling, translating, and rotating the coordinate system.",
          related = {
            "lovr.graphics.rotate",
            "lovr.graphics.translate",
            "lovr.graphics.transform"
          },
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The amount to scale on the x axis.",
                  default = "1.0"
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
          }
        },
        {
          name = "setAlphaSampling",
          tag = "graphicsState",
          summary = "Enable or disable alpha sampling.",
          description = "Enables or disables alpha sampling.  Alpha sampling is also known as alpha-to-coverage.  When it is enabled, the alpha channel of a pixel is factored into how antialiasing is computed, so the edges of a transparent texture will be correctly antialiased.",
          key = "lovr.graphics.setAlphaSampling",
          module = "lovr.graphics",
          notes = "- Alpha sampling is disabled by default.\n- This feature can be used for a simple transparency effect, pixels with an alpha of zero will\n  have their depth value discarded, allowing things behind them to show through (normally you\n  have to sort objects or write a shader for this).",
          variants = {
            {
              arguments = {
                {
                  name = "enabled",
                  type = "boolean",
                  description = "Whether or not alpha sampling is enabled."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setBackgroundColor",
          tag = "graphicsState",
          summary = "Set the background color.",
          description = "Sets the background color used to clear the screen.  Color components are from 0.0 to 1.0.",
          key = "lovr.graphics.setBackgroundColor",
          module = "lovr.graphics",
          notes = "The default background color is `(0.0, 0.0, 0.0, 1.0)`.",
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
                  default = "1.0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "hex",
                  type = "number",
                  description = "A hexcode like `0xffffff` to use for the background (does not support alpha)."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "color",
                  type = "table",
                  description = "A table containing 3 or 4 color components."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setBlendMode",
          tag = "graphicsState",
          summary = "Set the blend mode.",
          description = "Sets the blend mode.  The blend mode controls how each pixel's color is blended with the previous pixel's color when drawn.",
          key = "lovr.graphics.setBlendMode",
          module = "lovr.graphics",
          notes = "The default blend mode is `alpha` and `alphamultiply`.",
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
            },
            {
              description = "Disable blending.",
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "setCanvas",
          tag = "graphicsState",
          summary = "Set the active Canvas.",
          description = "Sets or disables the active Canvas object.  If there is an active Canvas, things will be rendered to the Textures attached to that Canvas instead of to the headset.",
          key = "lovr.graphics.setCanvas",
          module = "lovr.graphics",
          related = {
            "Canvas:renderTo",
            "Canvas"
          },
          variants = {
            {
              arguments = {
                {
                  name = "canvas",
                  type = "Canvas",
                  description = "The new active Canvas object, or `nil` to just render to the headset.",
                  default = "nil"
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
          description = "Sets the color used for drawing objects.  Color components are from 0.0 to 1.0.  Every pixel drawn will be multiplied (i.e. tinted) by this color.  This is a global setting, so it will affect all subsequent drawing operations.",
          key = "lovr.graphics.setColor",
          module = "lovr.graphics",
          notes = "The default color is `(1.0, 1.0, 1.0, 1.0)`.",
          examples = {
            {
              description = "Draw a red cube.",
              code = "function lovr.draw()\n  lovr.graphics.setColor(1.0, 0, 0)\n  lovr.graphics.cube('fill', 0, 1.7, -1, .5, lovr.timer.getTime())\nend"
            }
          },
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
                  default = "1.0"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "hex",
                  type = "number",
                  description = "A hexcode like `0xffffff` to use for the color (does not support alpha)."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "color",
                  type = "table",
                  description = "A table containing 3 or 4 color components."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setColorMask",
          tag = "graphicsState",
          summary = "Enable or disable color channels.",
          description = "Enables and disables individual color channels.  When a color channel is enabled, it will be affected by drawing commands and clear commands.",
          key = "lovr.graphics.setColorMask",
          module = "lovr.graphics",
          notes = "By default, all color channels are enabled.\n\nDisabling all of the color channels can be useful if you only want to write to the depth buffer or the stencil buffer.",
          related = {
            "lovr.graphics.stencil"
          },
          variants = {
            {
              arguments = {
                {
                  name = "r",
                  type = "boolean",
                  description = "Whether the red color channel should be enabled."
                },
                {
                  name = "g",
                  type = "boolean",
                  description = "Whether the green color channel should be enabled."
                },
                {
                  name = "b",
                  type = "boolean",
                  description = "Whether the blue color channel should be enabled."
                },
                {
                  name = "a",
                  type = "boolean",
                  description = "Whether the alpha color channel should be enabled."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setCullingEnabled",
          tag = "graphicsState",
          summary = "Enable or disable backface culling.",
          description = "Enables or disables culling.  Culling is an optimization that avoids rendering the back face of polygons.  This improves performance by reducing the number of polygons drawn, but requires that the vertices in triangles are specified in a consistent clockwise or counter clockwise order.",
          key = "lovr.graphics.setCullingEnabled",
          module = "lovr.graphics",
          notes = "Culling is disabled by default.",
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
          }
        },
        {
          name = "setDefaultFilter",
          tag = "graphicsState",
          summary = "Set the default filter mode for Textures.",
          description = "Sets the default filter mode for new Textures.  This controls how textures are sampled when they are minified, magnified, or stretched.",
          key = "lovr.graphics.setDefaultFilter",
          module = "lovr.graphics",
          notes = "The default filter is `trilinear`.\n\nThe maximum supported anisotropy level can be queried using `lovr.graphics.getLimits`.",
          related = {
            "Texture:getFilter",
            "Texture:setFilter",
            "lovr.graphics.getLimits"
          },
          variants = {
            {
              arguments = {
                {
                  name = "mode",
                  type = "FilterMode",
                  description = "The filter mode."
                },
                {
                  name = "anisotropy",
                  type = "number",
                  description = "The level of anisotropy to use."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setDepthTest",
          tag = "graphicsState",
          summary = "Set or disable the depth test.",
          description = "Sets the current depth test.  The depth test controls how overlapping objects are rendered.",
          key = "lovr.graphics.setDepthTest",
          module = "lovr.graphics",
          notes = "The depth test is an advanced technique to control how 3D objects overlap each other when they are rendered.  It works as follows:\n\n- Each pixel keeps track of its z value as well as its color.\n- If `write` is enabled when something is drawn, then any pixels that are drawn will have their\n  z values updated.\n- Additionally, anything drawn will first compare the existing z value of a pixel with the new z\n  value.  The `compareMode` setting determines how this comparison is performed.  If the\n  comparison succeeds, the new pixel will overwrite the previous one, otherwise that pixel won't\n  be rendered to.\n\nSmaller z values are closer to the camera.\n\nThe default compare mode is `lequal`, which usually gives good results for normal 3D rendering.",
          variants = {
            {
              arguments = {
                {
                  name = "compareMode",
                  type = "CompareMode",
                  description = "The new depth test.  Use `nil` to disable the depth test.",
                  default = "nil"
                },
                {
                  name = "write",
                  type = "boolean",
                  description = "Whether pixels will have their z value updated when rendered to.",
                  default = "true"
                }
              },
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
                  description = "The font to use.  If `nil`, the default font is used (Varela Round).",
                  default = "nil"
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
          notes = "The default line width is `1`.\n\nGPU driver support for line widths is poor.  The actual width of lines may be different from what is set here.  In particular, some graphics drivers only support a line width of `1`.\n\nCurrently this function only supports integer values from 1 to 255.",
          related = {
            "lovr.graphics.line"
          },
          variants = {
            {
              arguments = {
                {
                  name = "width",
                  type = "number",
                  description = "The new line width, in pixels.",
                  default = "1"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setPointSize",
          tag = "graphicsState",
          summary = "Set the point size.",
          description = "Sets the width of drawn points, in pixels.",
          key = "lovr.graphics.setPointSize",
          module = "lovr.graphics",
          notes = "The default point size is `1.0`.",
          related = {
            "lovr.graphics.points"
          },
          variants = {
            {
              arguments = {
                {
                  name = "size",
                  type = "number",
                  description = "The new point size.",
                  default = "1.0"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setProjection",
          tag = "graphicsState",
          summary = "Set the field of view.",
          description = "Sets the projection for a single view.  4 field of view angles can be used, similar to the field of view returned by `lovr.headset.getViewAngles`.  Alternatively, a projection matrix can be used for other types of projections like orthographic, oblique, etc.\n\nTwo views are supported, one for each eye.  When rendering to the headset, both projections are changed to match the ones used by the headset.",
          key = "lovr.graphics.setProjection",
          module = "lovr.graphics",
          notes = "Non-stereo rendering will only use the first view.\n\nThe projection matrices are available as the `mat4 lovrProjections[2]` variable in shaders.  The current projection matrix is available as `lovrProjection`.",
          related = {
            "lovr.headset.getViewAngles",
            "lovr.headset.getViewCount",
            "lovr.graphics.getViewPose",
            "lovr.graphics.setViewPose"
          },
          variants = {
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The index of the view to update."
                },
                {
                  name = "left",
                  type = "number",
                  description = "The left field of view angle, in radians."
                },
                {
                  name = "right",
                  type = "number",
                  description = "The right field of view angle, in radians."
                },
                {
                  name = "up",
                  type = "number",
                  description = "The top field of view angle, in radians."
                },
                {
                  name = "down",
                  type = "number",
                  description = "The bottom field of view angle, in radians."
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The index of the view to update."
                },
                {
                  name = "matrix",
                  type = "Mat4",
                  description = "The projection matrix for the view."
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
          name = "setStencilTest",
          tag = "graphicsState",
          summary = "Set the stencil test.",
          description = "Sets the stencil test.  The stencil test lets you mask out pixels that meet certain criteria, based on the contents of the stencil buffer.  The stencil buffer can be modified using `lovr.graphics.stencil`.  After rendering to the stencil buffer, the stencil test can be set to control how subsequent drawing functions are masked by the stencil buffer.",
          key = "lovr.graphics.setStencilTest",
          module = "lovr.graphics",
          notes = "Stencil values are between 0 and 255.\n\nBy default, the stencil test is disabled.",
          related = {
            "lovr.graphics.stencil"
          },
          variants = {
            {
              arguments = {
                {
                  name = "compareMode",
                  type = "CompareMode",
                  description = "The comparison method used to decide if a pixel should be visible, or nil if the stencil test is disabled."
                },
                {
                  name = "compareValue",
                  type = "number",
                  description = "The value to compare stencil values to."
                }
              },
              returns = {}
            },
            {
              description = "Disables the stencil test.",
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "setViewPose",
          tag = "graphicsState",
          summary = "Set the camera pose.",
          description = "Sets the pose for a single view.  Objects rendered in this view will appear as though the camera is positioned using the given pose.\n\nTwo views are supported, one for each eye.  When rendering to the headset, both views are changed to match the estimated eye positions.  These view poses are also available using `lovr.headset.getViewPose`.",
          key = "lovr.graphics.setViewPose",
          module = "lovr.graphics",
          notes = "Non-stereo rendering will only use the first view.\n\nThe inverted view poses (view matrices) are available as the `mat4 lovrViews[2]` variable in shaders.  The current view matrix is available as `lovrView`.",
          related = {
            "lovr.headset.getViewPose",
            "lovr.headset.getViewCount",
            "lovr.graphics.getProjection",
            "lovr.graphics.setProjection"
          },
          variants = {
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The index of the view to update."
                },
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the viewer, in meters."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the viewer, in meters."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the viewer, in meters."
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The number of radians the viewer is rotated around its axis of rotation."
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
            },
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The index of the view to update."
                },
                {
                  name = "matrix",
                  type = "Mat4",
                  description = "A matrix containing the viewer pose."
                },
                {
                  name = "inverted",
                  type = "boolean",
                  description = "Whether the matrix is an inverted pose (a view matrix)."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "setWinding",
          tag = "graphicsState",
          summary = "Set the winding direction.",
          description = "Sets the polygon winding.  The winding direction determines which face of a triangle is the front face and which is the back face.  This lets the graphics engine cull the back faces of polygons, improving performance.  The default is counterclockwise.",
          key = "lovr.graphics.setWinding",
          module = "lovr.graphics",
          notes = "Culling is initially disabled and must be enabled using `lovr.graphics.setCullingEnabled`.\n\nThe default winding direction is counterclockwise.",
          related = {
            "lovr.graphics.setCullingEnabled",
            "lovr.graphics.isCullingEnabled"
          },
          variants = {
            {
              arguments = {
                {
                  name = "winding",
                  type = "Winding",
                  description = "The new winding direction."
                }
              },
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
          notes = "Wireframe rendering is initially disabled.\n\nWireframe rendering is only supported on desktop systems.",
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
          }
        },
        {
          name = "skybox",
          tag = "graphicsPrimitives",
          summary = "Render a skybox.",
          description = "Render a skybox from a texture.  Two common kinds of skybox textures are supported: A 2D equirectangular texture with a spherical coordinates can be used, or a \"cubemap\" texture created from 6 images.",
          key = "lovr.graphics.skybox",
          module = "lovr.graphics",
          examples = {
            {
              code = "function lovr.load()\n  skybox = lovr.graphics.newTexture({\n    left = 'left.png',\n    right = 'right.png',\n    top = 'up.png',\n    bottom = 'down.png',\n    back = 'back.png',\n    front = 'front.png'\n  })\n\n  -- or skybox = lovr.graphics.newTexture('equirectangular.png')\nend\n\nfunction lovr.draw()\n  lovr.graphics.skybox(skybox)\nend"
            }
          },
          variants = {
            {
              arguments = {
                {
                  name = "texture",
                  type = "Texture",
                  description = "The texture to use."
                }
              },
              returns = {}
            }
          }
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
                  name = "radius",
                  type = "number",
                  description = "The radius of the sphere, in meters.",
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
                  name = "material",
                  type = "Material",
                  description = "The Material to apply to the sphere."
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
                  name = "radius",
                  type = "number",
                  description = "The radius of the sphere, in meters.",
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
            }
          }
        },
        {
          name = "stencil",
          tag = "graphicsPrimitives",
          summary = "Modify the stencil buffer.",
          description = "Renders to the stencil buffer using a function.",
          key = "lovr.graphics.stencil",
          module = "lovr.graphics",
          notes = "Stencil values are between 0 and 255.",
          related = {
            "lovr.graphics.getStencilTest",
            "lovr.graphics.setStencilTest"
          },
          variants = {
            {
              arguments = {
                {
                  name = "callback",
                  type = "function",
                  description = "The function that will be called to render to the stencil buffer.",
                  arguments = {},
                  returns = {}
                },
                {
                  name = "action",
                  type = "StencilAction",
                  description = "How to modify the stencil value of pixels that are rendered to.",
                  default = "'replace'"
                },
                {
                  name = "value",
                  type = "number",
                  description = "If `action` is \"replace\", this is the value that pixels are replaced with.",
                  default = "1"
                },
                {
                  name = "keep",
                  type = "boolean",
                  description = "If false, the stencil buffer will be cleared to zero before rendering.",
                  default = "false"
                }
              },
              returns = {}
            },
            {
              arguments = {
                {
                  name = "callback",
                  type = "function",
                  description = "The function that will be called to render to the stencil buffer.",
                  arguments = {},
                  returns = {}
                },
                {
                  name = "action",
                  type = "StencilAction",
                  description = "How to modify the stencil value of pixels that are rendered to.",
                  default = "'replace'"
                },
                {
                  name = "value",
                  type = "number",
                  description = "If `action` is \"replace\", this is the value that pixels are replaced with.",
                  default = "1"
                },
                {
                  name = "initial",
                  type = "number",
                  description = "The value to clear the stencil buffer to before rendering.",
                  default = "0"
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "tick",
          tag = "window",
          summary = "Start a timer on the GPU.",
          description = "Starts a named timer on the GPU, which can be stopped using `lovr.graphics.tock`.",
          key = "lovr.graphics.tick",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.tock",
            "lovr.graphics.getFeatures"
          },
          examples = {
            {
              code = "function lovr.draw()\n  lovr.graphics.tick('tim')\n\n  -- Draw a bunch of cubes\n  for x = -4, 4 do\n    for y = -4, 4 do\n      for z = -4, 4 do\n        lovr.graphics.cube('fill', x, y, z, .2)\n      end\n    end\n  end\n\n  print('it took ' .. (lovr.graphics.tock('tim') or 0) .. ' seconds')\nend"
            }
          },
          notes = "The timer can be stopped by calling `lovr.graphics.tock` using the same name.  All drawing commands between the tick and the tock will be timed.  It is not possible to nest calls to tick and tock.\n\nGPU timers are not supported on all systems.  Check the `timers` feature using `lovr.graphics.getFeatures` to see if it is supported on the current system.",
          variants = {
            {
              arguments = {
                {
                  name = "label",
                  type = "string",
                  description = "The name of the timer."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "tock",
          tag = "window",
          summary = "Stop a timer on the GPU.",
          description = "Stops a named timer on the GPU, previously started with `lovr.graphics.tick`.",
          key = "lovr.graphics.tock",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.tick",
            "lovr.graphics.getFeatures"
          },
          examples = {
            {
              code = "function lovr.draw()\n  lovr.graphics.tick('tim')\n\n  -- Draw a bunch of cubes\n  for x = -4, 4 do\n    for y = -4, 4 do\n      for z = -4, 4 do\n        lovr.graphics.cube('fill', x, y, z, .2)\n      end\n    end\n  end\n\n  print('it took ' .. (lovr.graphics.tock('tim') or 0) .. ' seconds')\nend"
            }
          },
          notes = "All drawing commands between tick and tock will be timed.  It is not possible to nest calls to tick and tock.\n\nThe results are delayed, and might be `nil` for the first few frames.  This function returns the most recent available timer value.\n\nGPU timers are not supported on all systems.  Check the `timers` feature using `lovr.graphics.getFeatures` to see if it is supported on the current system.",
          variants = {
            {
              arguments = {
                {
                  name = "label",
                  type = "string",
                  description = "The name of the timer."
                }
              },
              returns = {
                {
                  name = "time",
                  type = "number",
                  description = "The number of seconds elapsed, or `nil` if the data isn't ready yet."
                }
              }
            }
          }
        },
        {
          name = "transform",
          tag = "graphicsTransforms",
          summary = "Apply a general transform to the coordinate system.",
          description = "Apply a transform to the coordinate system, changing its translation, rotation, and scale using a single function.  A `mat4` can also be used.\n\nThe transformation will last until `lovr.draw` returns or the transformation is popped off the transformation stack.",
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
              description = "Modify the coordinate system using a mat4 object.",
              arguments = {
                {
                  name = "transform",
                  type = "mat4",
                  description = "The mat4 to apply to the coordinate system."
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
          notes = "Order matters when scaling, translating, and rotating the coordinate system.",
          related = {
            "lovr.graphics.rotate",
            "lovr.graphics.scale",
            "lovr.graphics.transform"
          },
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The amount to translate on the x axis.",
                  default = "0"
                },
                {
                  name = "y",
                  type = "number",
                  description = "The amount to translate on the y axis.",
                  default = "0"
                },
                {
                  name = "z",
                  type = "number",
                  description = "The amount to translate on the z axis.",
                  default = "0"
                }
              },
              returns = {}
            }
          }
        }
      },
      enums = {
        {
          name = "ArcMode",
          summary = "Different ways arcs can be drawn.",
          description = "Different ways arcs can be drawn with `lovr.graphics.arc`.",
          key = "ArcMode",
          module = "lovr.graphics",
          values = {
            {
              name = "pie",
              description = "The arc is drawn with the center of its circle included in the list of points (default)."
            },
            {
              name = "open",
              description = "The curve of the arc is drawn as a single line."
            },
            {
              name = "closed",
              description = "The starting and ending points of the arc's curve are connected."
            }
          }
        },
        {
          name = "AttributeType",
          summary = "Different data types for the vertex attributes of a Mesh.",
          description = "Here are the different data types available for vertex attributes in a Mesh.  The ones that have a smaller range take up less memory, which improves performance a bit.  The \"u\" stands for \"unsigned\", which means it can't hold negative values but instead has a larger positive range.",
          key = "AttributeType",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.newMesh",
            "Mesh:getVertexFormat",
            "Mesh"
          },
          values = {
            {
              name = "byte",
              description = "A signed 8 bit number, from -128 to 127."
            },
            {
              name = "ubyte",
              description = "An unsigned 8 bit number, from 0 to 255."
            },
            {
              name = "short",
              description = "A signed 16 bit number, from -32768 to 32767."
            },
            {
              name = "ushort",
              description = "An unsigned 16 bit number, from 0 to 65535."
            },
            {
              name = "int",
              description = "A signed 32 bit number, from -2147483648 to 2147483647."
            },
            {
              name = "uint",
              description = "An unsigned 32 bit number, from 0 to 4294967295."
            },
            {
              name = "float",
              description = "A 32 bit floating-point number (large range, but can start to lose precision)."
            }
          }
        },
        {
          name = "BlendAlphaMode",
          summary = "Different ways of blending alpha.",
          description = "Different ways the alpha channel of pixels affects blending.",
          key = "BlendAlphaMode",
          module = "lovr.graphics",
          notes = "The premultiplied mode should be used if pixels being drawn have already been blended, or \"pre-multiplied\", by the alpha channel.  This happens when rendering a framebuffer that contains pixels with transparent alpha values, since the stored color values have already been faded by alpha and don't need to be faded a second time with the alphamultiply blend mode.",
          values = {
            {
              name = "alphamultiply",
              description = "Color channel values are multiplied by the alpha channel during blending."
            },
            {
              name = "premultiplied",
              description = "Color channels are not multiplied by the alpha channel.  This should be used if the pixels being drawn have already been blended, or \"pre-multiplied\", by the alpha channel."
            }
          },
          related = {
            "BlendMode",
            "lovr.graphics.getBlendMode",
            "lovr.graphics.setBlendMode"
          }
        },
        {
          name = "BlendMode",
          summary = "Different blend modes.",
          description = "Blend modes control how overlapping pixels are blended together, similar to layers in Photoshop.",
          key = "BlendMode",
          module = "lovr.graphics",
          related = {
            "BlendAlphaMode",
            "lovr.graphics.getBlendMode",
            "lovr.graphics.setBlendMode"
          },
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
            }
          }
        },
        {
          name = "BlockType",
          summary = "Different types of ShaderBlocks.",
          description = "There are two types of ShaderBlocks that can be used: `uniform` and `compute`.\n\nUniform blocks are read only in shaders, can sometimes be a bit faster than compute blocks, and have a limited size (but the limit will be at least 16KB, you can check `lovr.graphics.getLimits` to check).\n\nCompute blocks can be written to by compute shaders, might be slightly slower than uniform blocks, and have a much, much larger maximum size.",
          key = "BlockType",
          module = "lovr.graphics",
          related = {
            "ShaderBlock",
            "lovr.graphics.newShaderBlock",
            "ShaderBlock:getType",
            "lovr.graphics.getLimits"
          },
          values = {
            {
              name = "uniform",
              description = "A uniform block."
            },
            {
              name = "compute",
              description = "A compute block."
            }
          }
        },
        {
          name = "BufferUsage",
          summary = "How the buffer data will be updated.",
          description = "This acts as a hint to the graphics driver about what kinds of data access should be optimized for.",
          key = "BufferUsage",
          module = "lovr.graphics",
          related = {
            "ShaderBlock",
            "lovr.graphics.newShaderBlock"
          },
          values = {
            {
              name = "static",
              description = "A buffer that you intend to create once and never modify."
            },
            {
              name = "dynamic",
              description = "A buffer which is modified occasionally."
            },
            {
              name = "stream",
              description = "A buffer which is entirely replaced on the order of every frame."
            }
          }
        },
        {
          name = "CompareMode",
          summary = "Different depth test modes.",
          description = "The method used to compare z values when deciding how to overlap rendered objects.  This is called the \"depth test\", and it happens on a pixel-by-pixel basis every time new objects are drawn.  If the depth test \"passes\" for a pixel, then the pixel color will be replaced by the new color and the depth value in the depth buffer will be updated.  Otherwise, the pixel will not be changed and the depth value will not be updated.",
          key = "CompareMode",
          module = "lovr.graphics",
          related = {
            "lovr.graphics.getDepthTest",
            "lovr.graphics.setDepthTest",
            "lovr.graphics.getStencilTest",
            "lovr.graphics.setStencilTest"
          },
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
          name = "CoordinateSpace",
          description = "Different coordinate spaces for nodes in a Model.",
          key = "CoordinateSpace",
          module = "lovr.graphics",
          related = {
            "Model:pose"
          },
          values = {
            {
              name = "local",
              description = "The coordinate space relative to the node's parent."
            },
            {
              name = "global",
              description = "The coordinate space relative to the root node of the Model."
            }
          }
        },
        {
          name = "DefaultShader",
          summary = "The set of builtin shaders.",
          description = "The following shaders are built in to LÖVR, and can be used as an argument to `lovr.graphics.newShader` instead of providing raw GLSL shader code.  The shaders can be further customized by using the `flags` argument.  If you pass in `nil` to `lovr.graphics.setShader`, LÖVR will automatically pick a DefaultShader to use based on whatever is being drawn.",
          key = "DefaultShader",
          module = "lovr.graphics",
          values = {
            {
              name = "unlit",
              description = "A simple shader without lighting, using only colors and a diffuse texture."
            },
            {
              name = "standard",
              description = "A physically-based rendering (PBR) shader, using advanced material properties."
            },
            {
              name = "cube",
              description = "A shader that renders a cubemap texture."
            },
            {
              name = "pano",
              description = "A shader that renders a 2D equirectangular texture with spherical coordinates."
            },
            {
              name = "font",
              description = "A shader that renders font glyphs."
            },
            {
              name = "fill",
              description = "A shader that passes its vertex coordinates unmodified to the fragment shader, used to render view-independent fixed geometry like fullscreen quads."
            }
          }
        },
        {
          name = "DrawMode",
          summary = "Different ways Mesh objects can be drawn.",
          description = "Meshes are lists of arbitrary vertices.  These vertices can be connected in different ways, leading to different shapes like lines and triangles.",
          key = "DrawMode",
          module = "lovr.graphics",
          values = {
            {
              name = "points",
              description = "Draw each vertex as a single point."
            },
            {
              name = "lines",
              description = "The vertices represent a list of line segments. Each pair of vertices will have a line drawn between them."
            },
            {
              name = "linestrip",
              description = "The first two vertices have a line drawn between them, and each vertex after that will be connected to the previous vertex with a line."
            },
            {
              name = "lineloop",
              description = "Similar to linestrip, except the last vertex is connected back to the first."
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
          name = "DrawStyle",
          summary = "Different ways graphics primitives can be drawn.",
          description = "Most graphics primitives can be drawn in one of two modes: a filled mode and a wireframe mode.",
          key = "DrawStyle",
          module = "lovr.graphics",
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
          module = "lovr.graphics",
          related = {
            "Texture:getFilter",
            "Texture:setFilter",
            "lovr.graphics.getDefaultFilter",
            "lovr.graphics.setDefaultFilter",
            "WrapMode"
          },
          values = {
            {
              name = "nearest",
              description = "Fast nearest-neighbor sampling.  Leads to a pixelated style."
            },
            {
              name = "bilinear",
              description = "Smooth pixel sampling."
            },
            {
              name = "trilinear",
              description = "Smooth pixel sampling, with smooth sampling across mipmap levels."
            }
          }
        },
        {
          name = "HorizontalAlign",
          summary = "Different ways to horizontally align text.",
          description = "Different ways to horizontally align text when using `lovr.graphics.print`.",
          key = "HorizontalAlign",
          module = "lovr.graphics",
          related = {
            "VerticalAlign",
            "lovr.graphics.print"
          },
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
          }
        },
        {
          name = "MaterialColor",
          summary = "Different material color parameters.",
          description = "The different types of color parameters `Material`s can hold.",
          key = "MaterialColor",
          module = "lovr.graphics",
          related = {
            "Material:getColor",
            "Material:setColor",
            "MaterialScalar",
            "MaterialTexture",
            "Material"
          },
          values = {
            {
              name = "diffuse",
              description = "The diffuse color."
            },
            {
              name = "emissive",
              description = "The emissive color."
            }
          }
        },
        {
          name = "MaterialScalar",
          summary = "Different material parameters.",
          description = "The different types of float parameters `Material`s can hold.",
          key = "MaterialScalar",
          module = "lovr.graphics",
          related = {
            "Material:getScalar",
            "Material:setScalar",
            "MaterialColor",
            "MaterialTexture",
            "Material"
          },
          values = {
            {
              name = "metalness",
              description = "The constant metalness factor."
            },
            {
              name = "roughness",
              description = "The constant roughness factor."
            }
          }
        },
        {
          name = "MaterialTexture",
          summary = "Different material texture parameters.",
          description = "The different types of texture parameters `Material`s can hold.",
          key = "MaterialTexture",
          module = "lovr.graphics",
          related = {
            "Material:getTexture",
            "Material:setTexture",
            "MaterialColor",
            "MaterialScalar",
            "Material"
          },
          values = {
            {
              name = "diffuse",
              description = "The diffuse texture."
            },
            {
              name = "emissive",
              description = "The emissive texture."
            },
            {
              name = "metalness",
              description = "The metalness texture."
            },
            {
              name = "roughness",
              description = "The roughness texture."
            },
            {
              name = "occlusion",
              description = "The ambient occlusion texture."
            },
            {
              name = "normal",
              description = "The normal map."
            },
            {
              name = "environment",
              description = "The environment map, should be specified as a cubemap texture."
            }
          }
        },
        {
          name = "MeshUsage",
          summary = "How a Mesh is going to be updated.",
          description = "Meshes can have a usage hint, describing how they are planning on being updated.  Setting the usage hint allows the graphics driver optimize how it handles the data in the Mesh.",
          key = "MeshUsage",
          module = "lovr.graphics",
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
          name = "ShaderType",
          summary = "Different types of shaders.",
          description = "Shaders can be used for either rendering operations or generic compute tasks.  Graphics shaders are created with `lovr.graphics.newShader` and compute shaders are created with `lovr.graphics.newComputeShader`.  `Shader:getType` can be used on an existing Shader to figure out what type it is.",
          key = "ShaderType",
          module = "lovr.graphics",
          related = {
            "Shader",
            "lovr.graphics.newShader",
            "lovr.graphics.newComputeShader"
          },
          values = {
            {
              name = "graphics",
              description = "A graphics shader."
            },
            {
              name = "compute",
              description = "A compute shader."
            }
          }
        },
        {
          name = "StencilAction",
          summary = "Different stencil operations available.",
          description = "How to modify pixels in the stencil buffer when using `lovr.graphics.stencil`.",
          key = "StencilAction",
          module = "lovr.graphics",
          values = {
            {
              name = "replace",
              description = "Stencil values will be replaced with a custom value."
            },
            {
              name = "increment",
              description = "Stencil values will increment every time they are rendered to."
            },
            {
              name = "decrement",
              description = "Stencil values will decrement every time they are rendered to."
            },
            {
              name = "incrementwrap",
              description = "Similar to `increment`, but the stencil value will be set to 0 if it exceeds 255."
            },
            {
              name = "decrementwrap",
              description = "Similar to `decrement`, but the stencil value will be set to 255 if it drops below 0."
            },
            {
              name = "invert",
              description = "Stencil values will be bitwise inverted every time they are rendered to."
            }
          }
        },
        {
          name = "TextureFormat",
          summary = "Different storage formats for pixels in Textures.",
          description = "Textures can store their pixels in different formats.  The set of color channels and the number of bits stored for each channel can differ, allowing Textures to optimize their storage for certain kinds of image formats or rendering techniques.",
          key = "TextureFormat",
          module = "lovr.graphics",
          values = {
            {
              name = "rgb",
              description = "Each pixel is 24 bits, or 8 bits for each channel."
            },
            {
              name = "rgba",
              description = "Each pixel is 32 bits, or 8 bits for each channel (including alpha)."
            },
            {
              name = "rgba4",
              description = "An rgba format where the colors occupy 4 bits instead of the usual 8."
            },
            {
              name = "rgba16f",
              description = "Each pixel is 64 bits. Each channel is a 16 bit floating point number."
            },
            {
              name = "rgba32f",
              description = "Each pixel is 128 bits. Each channel is a 32 bit floating point number."
            },
            {
              name = "r16f",
              description = "A 16-bit floating point format with a single color channel."
            },
            {
              name = "r32f",
              description = "A 32-bit floating point format with a single color channel."
            },
            {
              name = "rg16f",
              description = "A 16-bit floating point format with two color channels."
            },
            {
              name = "rg32f",
              description = "A 32-bit floating point format with two color channels."
            },
            {
              name = "rgb5a1",
              description = "A 16 bit format with 5-bit color channels and a single alpha bit."
            },
            {
              name = "rgb10a2",
              description = "A 32 bit format with 10-bit color channels and two alpha bits."
            },
            {
              name = "rg11b10f",
              description = "Each pixel is 32 bits, and packs three color channels into 10 or 11 bits each."
            },
            {
              name = "d16",
              description = "A 16 bit depth buffer."
            },
            {
              name = "d32f",
              description = "A 32 bit floating point depth buffer."
            },
            {
              name = "d24s8",
              description = "A depth buffer with 24 bits for depth and 8 bits for stencil."
            }
          }
        },
        {
          name = "TextureType",
          summary = "Different types of Textures.",
          description = "Different types of Textures.",
          key = "TextureType",
          module = "lovr.graphics",
          values = {
            {
              name = "2d",
              description = "A 2D texture."
            },
            {
              name = "array",
              description = "A 2D array texture with multiple independent 2D layers."
            },
            {
              name = "cube",
              description = "A cubemap texture with 6 2D faces."
            },
            {
              name = "volume",
              description = "A 3D volumetric texture consisting of multiple 2D layers."
            }
          }
        },
        {
          name = "UniformAccess",
          summary = "Different access hints for shader resources.",
          description = "When binding writable resources to shaders using `Shader:sendBlock` and `Shader:sendImage`, an access pattern can be specified as a hint that says whether you plan to read or write to the resource (or both).  Sometimes, LÖVR or the GPU driver can use this hint to get better performance or avoid stalling.",
          key = "UniformAccess",
          module = "lovr.graphics",
          values = {
            {
              name = "read",
              description = "The Shader will use the resource in a read-only fashion."
            },
            {
              name = "write",
              description = "The Shader will use the resource in a write-only fashion."
            },
            {
              name = "readwrite",
              description = "The resource will be available for reading and writing."
            }
          }
        },
        {
          name = "VerticalAlign",
          summary = "Different ways to vertically align text.",
          description = "Different ways to vertically align text when using `lovr.graphics.print`.",
          key = "VerticalAlign",
          module = "lovr.graphics",
          related = {
            "HorizontalAlign",
            "lovr.graphics.print"
          },
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
          }
        },
        {
          name = "Winding",
          summary = "Different winding directions.",
          description = "Whether the points on triangles are specified in a clockwise or counterclockwise order.",
          key = "Winding",
          module = "lovr.graphics",
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
          name = "WrapMode",
          summary = "How to wrap Textures.",
          description = "The method used to render textures when texture coordinates are outside of the 0-1 range.",
          key = "WrapMode",
          module = "lovr.graphics",
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
      }
    },
    {
      name = "headset",
      tag = "modules",
      summary = "Connects to VR hardware.",
      description = "The `lovr.headset` module is where all the magical VR functionality is.  With it, you can access connected VR hardware and get information about the available space the player has.  Note that all units are reported in meters.  Position `(0, 0, 0)` is the center of the play area.",
      key = "lovr.headset",
      objects = {},
      functions = {
        {
          name = "animate",
          tag = "input",
          summary = "Animate a model to match its Device input state.",
          description = "Animates a device model to match its current input state.  The buttons and joysticks on a controller will move as they're pressed/moved and hand models will move to match skeletal input.\n\nThe model should have been created using `lovr.headset.newModel` with the `animated` flag set to `true`.",
          key = "lovr.headset.animate",
          module = "lovr.headset",
          notes = "Currently this function is supported for OpenVR controller models and Oculus hand models.\n\nThis function may animate using node-based animation or skeletal animation.  `Model:hasJoints` can be used on a Model so you know if a Shader with the `animated` ShaderFlag needs to be used to render the results properly.\n\nIt's possible to use models that weren't created with `lovr.headset.newModel` but they need to be set up carefully to have the same structure as the models provided by the headset SDK.",
          related = {
            "lovr.headset.newModel",
            "Model:animate",
            "Model:pose"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to use for the animation data.",
                  default = "'head'"
                },
                {
                  name = "model",
                  type = "Model",
                  description = "The model to animate."
                }
              },
              returns = {
                {
                  name = "success",
                  type = "boolean",
                  description = "Whether the animation was applied successfully to the Model.  If the Model was not compatible or animation data for the device was not available, this will be `false`."
                }
              }
            }
          }
        },
        {
          name = "getAngularVelocity",
          tag = "input",
          summary = "Get the angular velocity of a device.",
          description = "Returns the current angular velocity of a device.",
          key = "lovr.headset.getAngularVelocity",
          module = "lovr.headset",
          related = {
            "lovr.headset.getVelocity",
            "lovr.headset.getPosition",
            "lovr.headset.getOrientation"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the velocity of.",
                  default = "'head'"
                }
              },
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
          name = "getAxis",
          tag = "input",
          summary = "Get the state of an analog axis on a device.",
          description = "Get the current state of an analog axis on a device.  Some axes are multidimensional, for example a 2D touchpad or thumbstick with x/y axes.  For multidimensional axes, this function will return multiple values, one number for each axis.  In these cases, it can be useful to use the `select` function built in to Lua to select a particular axis component.",
          key = "lovr.headset.getAxis",
          module = "lovr.headset",
          notes = "The axis values will be between 0 and 1 for 1D axes, and between -1 and 1 for each component of a multidimensional axis.",
          related = {
            "DeviceAxis",
            "lovr.headset.isDown"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device."
                },
                {
                  name = "axis",
                  type = "DeviceAxis",
                  description = "The axis."
                }
              },
              returns = {
                {
                  name = "...",
                  type = "number",
                  description = "The current state of the components of the axis, or `nil` if the device does not have any information about the axis."
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
          notes = "This currently returns 0 on the Quest.",
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
          notes = "This currently returns 0 on the Quest.",
          related = {
            "lovr.headset.getBoundsWidth",
            "lovr.headset.getBoundsDepth",
            "lovr.headset.getBoundsGeometry"
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
          description = "Returns a list of points representing the boundaries of the play area, or `nil` if the current headset driver does not expose this information.",
          key = "lovr.headset.getBoundsGeometry",
          module = "lovr.headset",
          related = {
            "lovr.headset.getBoundsDimensions"
          },
          variants = {
            {
              arguments = {
                {
                  name = "t",
                  type = "table",
                  description = "A table to fill with the points.  If `nil`, a new table will be created.",
                  default = "nil"
                }
              },
              returns = {
                {
                  name = "points",
                  type = "table",
                  description = "A flat table of 3D points representing the play area boundaries."
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
          notes = "This currently returns 0 on the Quest.",
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
          notes = "The default near and far clipping planes are 0.1 meters and 100.0 meters.\n\nThis is not currently supported by the `vrapi` headset driver.",
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
          name = "getDisplayDimensions",
          tag = "headset",
          summary = "Get the dimensions of the headset display.",
          description = "Returns the texture dimensions of the headset display (for one eye), in pixels.",
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
                  description = "The width of the display."
                },
                {
                  name = "height",
                  type = "number",
                  description = "The height of the display."
                }
              }
            }
          }
        },
        {
          name = "getDisplayFrequency",
          tag = "headset",
          summary = "Get the refresh rate of the headset display.",
          description = "Returns the refresh rate of the headset display, in Hz.",
          key = "lovr.headset.getDisplayFrequency",
          module = "lovr.headset",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "frequency",
                  type = "number",
                  description = "The frequency of the display, or `nil` if I have no idea what it is."
                }
              }
            }
          }
        },
        {
          name = "getDisplayHeight",
          tag = "headset",
          summary = "Get the height of the headset display.",
          description = "Returns the height of the headset display (for one eye), in pixels.",
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
                  description = "The height of the display."
                }
              }
            }
          }
        },
        {
          name = "getDisplayMask",
          tag = "headset",
          summary = "Get a mesh that masks out the visible display area.",
          description = "Returns 2D triangle vertices that represent areas of the headset display that will never be seen by the user (due to the circular lenses).  This area can be masked out by rendering it to the depth buffer or stencil buffer.  Then, further drawing operations can skip rendering those pixels using the depth test (`lovr.graphics.setDepthTest`) or stencil test (`lovr.graphics.setStencilTest`), which improves performance.",
          key = "lovr.headset.getDisplayMask",
          module = "lovr.headset",
          examples = {
            {
              code = "function lovr.load()\n  lovr.graphics.setBackgroundColor(1, 1, 1)\n\n  shader = lovr.graphics.newShader([[\n    vec4 lovrMain() {\n      vec4 vertex = lovrVertex;\n\n      // Rescale mesh coordinates from (0,1) to (-1,1)\n      vertex.xy *= 2.;\n      vertex.xy -= 1.;\n\n      // Flip the mesh if it's being drawn in the right eye\n      if (lovrViewID == 1) {\n        vertex.x = -vertex.x;\n      }\n\n      return vertex;\n    }\n  ]], [[\n    // The fragment shader returns solid black for illustration purposes.  It could be transparent.\n    vec4 lovrMain() {\n      return vec4(0., 0., 0., 1.);\n    }\n  ]])\n\n  mask = lovr.headset.getDisplayMask()\n\n  if mask then\n    mesh = lovr.graphics.newMesh({ { 'lovrPosition', 'float', 2 } }, mask, 'triangles')\n  end\nend\n\nfunction lovr.draw()\n  if mask then\n    -- Mask out parts of the display that aren't visible to skip rendering those pixels later\n    lovr.graphics.setShader(shader)\n    mesh:draw()\n    lovr.graphics.setShader()\n\n    -- Draw a red cube\n    lovr.graphics.setColor(0xff0000)\n    lovr.graphics.cube('fill', 0, 1.7, -1, .5, lovr.timer.getTime())\n    lovr.graphics.setColor(0xffffff)\n  else\n    lovr.graphics.setColor(0x000000)\n    lovr.graphics.print('No mask found.', 0, 1.7, -3, .2)\n    lovr.graphics.setColor(0xffffff)\n  end\nend"
            }
          },
          related = {
            "lovr.graphics.newMesh",
            "lovr.graphics.setDepthTest",
            "lovr.graphics.setStencilTest"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "points",
                  type = "table",
                  description = "A table of points.  Each point is a table with two numbers between 0 and 1."
                }
              }
            }
          }
        },
        {
          name = "getDisplayWidth",
          tag = "headset",
          summary = "Get the width of the headset display.",
          description = "Returns the width of the headset display (for one eye), in pixels.",
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
                  description = "The width of the display."
                }
              }
            }
          }
        },
        {
          name = "getDriver",
          tag = "headset",
          summary = "Get the VR API currently in use for a device.",
          description = "Returns the `HeadsetDriver` that is currently in use, optionally for a specific device.  The order of headset drivers can be changed using `lovr.conf` to prefer or exclude specific VR APIs.",
          key = "lovr.headset.getDriver",
          module = "lovr.headset",
          variants = {
            {
              description = "Get the current headset driver that LÖVR is submitting frames to.",
              arguments = {},
              returns = {
                {
                  name = "driver",
                  type = "HeadsetDriver",
                  description = "The driver of the headset in use, e.g. \"OpenVR\"."
                }
              }
            },
            {
              description = "Get the current input driver for a device.",
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the active driver of.  This will be the first driver that is currently returning a pose for the device."
                }
              },
              returns = {
                {
                  name = "driver",
                  type = "HeadsetDriver",
                  description = "The driver of the headset in use, e.g. \"OpenVR\"."
                }
              }
            }
          }
        },
        {
          name = "getHands",
          tag = "input",
          summary = "Get a list of currently tracked hand devices.",
          description = "Returns a table with all of the currently tracked hand devices.",
          key = "lovr.headset.getHands",
          module = "lovr.headset",
          notes = "The hand paths will *always* be either `hand/left` or `hand/right`.",
          examples = {
            {
              code = "function lovr.update(dt)\n  for i, hand in ipairs(lovr.headset.getHands()) do\n    print(hand, lovr.headset.getPose(hand))\n  end\nend"
            }
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "hands",
                  type = "table",
                  description = "The currently tracked hand devices.",
                  arguments = {},
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "getMirrorTexture",
          tag = "headset",
          summary = "Get the Texture containing a view of what's in the headset.",
          description = "Returns a Texture that contains whatever is currently rendered to the headset.\n\nSometimes this can be `nil` if the current headset driver doesn't have a mirror texture, which can happen if the driver renders directly to the display.  Currently the `desktop`, `webxr`, and `vrapi` drivers do not have a mirror texture.\n\nIt also isn't guaranteed that the same Texture will be returned by subsequent calls to this function.  Currently, the `oculus` driver exhibits this behavior.",
          key = "lovr.headset.getMirrorTexture",
          module = "lovr.headset",
          related = {
            "lovr.mirror"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "mirror",
                  type = "Texture",
                  description = "The mirror texture."
                }
              }
            }
          }
        },
        {
          name = "getName",
          tag = "headset",
          summary = "Get the name of the connected headset display.",
          description = "Returns the name of the headset as a string.  The exact string that is returned depends on the hardware and VR SDK that is currently in use.",
          key = "lovr.headset.getName",
          module = "lovr.headset",
          notes = "<table>\n  <thead>\n    <tr>\n      <td>driver</td>\n      <td>name</td>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>desktop</td>\n      <td><code>Simulator</code></td>\n    </tr>\n    <tr>\n      <td>openvr</td>\n      <td>varies</td>\n    </tr>\n    <tr>\n      <td>openxr</td>\n      <td>varies</td>\n    </tr>\n    <tr>\n      <td>vrapi</td>\n      <td><code>Oculus Quest</code> or <code>Oculus Quest 2</code></td>\n    </tr>\n    <tr>\n      <td>webxr</td>\n      <td>always nil</td>\n    </tr>\n    <tr>\n      <td>oculus</td>\n      <td>varies</td>\n    </tr>\n    <tr>\n      <td>pico</td>\n      <td><code>Pico</code></td>\n    </tr>\n  </tbody> </table>",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "name",
                  type = "string",
                  description = "The name of the headset as a string."
                }
              }
            }
          }
        },
        {
          name = "getOrientation",
          tag = "input",
          summary = "Get the orientation of a device.",
          description = "Returns the current orientation of a device, in angle/axis form.",
          key = "lovr.headset.getOrientation",
          module = "lovr.headset",
          notes = "If the device isn't tracked, all zeroes will be returned.",
          related = {
            "lovr.headset.getPose",
            "lovr.headset.getPosition",
            "lovr.headset.getVelocity",
            "lovr.headset.getAngularVelocity",
            "lovr.headset.isTracked",
            "lovr.headset.getDriver"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the orientation of.",
                  default = "'head'"
                }
              },
              returns = {
                {
                  name = "angle",
                  type = "number",
                  description = "The amount of rotation around the axis of rotation, in radians."
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
          name = "getOriginType",
          tag = "headset",
          summary = "Get the type of tracking origin of the headset.",
          description = "Returns the type of origin used for the tracking volume.  The different types of origins are explained on the `HeadsetOrigin` page.",
          key = "lovr.headset.getOriginType",
          module = "lovr.headset",
          related = {
            "HeadsetOrigin"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "origin",
                  type = "HeadsetOrigin",
                  description = "The type of origin."
                }
              }
            }
          }
        },
        {
          name = "getPose",
          tag = "input",
          summary = "Get the pose of a device.",
          description = "Returns the current position and orientation of a device.",
          key = "lovr.headset.getPose",
          module = "lovr.headset",
          notes = "Units are in meters.\n\nIf the device isn't tracked, all zeroes will be returned.",
          related = {
            "lovr.headset.getPosition",
            "lovr.headset.getOrientation",
            "lovr.headset.getVelocity",
            "lovr.headset.getAngularVelocity",
            "lovr.headset.getSkeleton",
            "lovr.headset.isTracked",
            "lovr.headset.getDriver"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the pose of.",
                  default = "'head'"
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position."
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The amount of rotation around the axis of rotation, in radians."
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
          tag = "input",
          summary = "Get the position of a device.",
          description = "Returns the current position of a device, in meters, relative to the play area.",
          key = "lovr.headset.getPosition",
          module = "lovr.headset",
          notes = "If the device isn't tracked, all zeroes will be returned.",
          related = {
            "lovr.headset.getPose",
            "lovr.headset.getOrientation",
            "lovr.headset.getVelocity",
            "lovr.headset.getAngularVelocity",
            "lovr.headset.isTracked",
            "lovr.headset.getDriver"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the position of.",
                  default = "'head'"
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x position of the device."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y position of the device."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z position of the device."
                }
              }
            }
          }
        },
        {
          name = "getSkeleton",
          tag = "input",
          summary = "Get skeletal joint poses tracked by a device.",
          description = "Returns a list of joint poses tracked by a device.  Currently, only hand devices are able to track joints.",
          key = "lovr.headset.getSkeleton",
          module = "lovr.headset",
          related = {
            "lovr.headset.getPose",
            "lovr.headset.animate"
          },
          examples = {
            {
              code = "function lovr.draw()\n  for _, hand in ipairs({ 'left', 'right' }) do\n    for _, joint in ipairs(lovr.headset.getSkeleton(hand) or {}) do\n      lovr.graphics.points(unpack(joint, 1, 3))\n    end\n  end\nend"
            }
          },
          notes = "If the Device does not support tracking joints or the poses are unavailable, `nil` is returned.\n\nThe joint orientation is similar to the graphics coordinate system: -Z is the forwards direction, pointing towards the fingertips.  The +Y direction is \"up\", pointing out of the back of the hand.  The +X direction is to the right, perpendicular to X and Z.\n\nHand joints are returned in the following order:\n\n<table>\n  <thead>\n    <tr>\n      <td colspan=\"2\">Joint</td>\n      <td>Index</td>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td colspan=\"2\">Palm</td>\n      <td>1</td>\n    </tr>\n    <tr>\n      <td colspan=\"2\">Wrist</td>\n      <td>2</td>\n    </tr>\n    <tr>\n      <td rowspan=\"4\">Thumb</td>\n      <td>Metacarpal</td>\n      <td>3</td>\n    </tr>\n    <tr>\n      <td>Proximal</td>\n      <td>4</td>\n    </tr>\n    <tr>\n      <td>Distal</td>\n      <td>5</td>\n    </tr>\n    <tr>\n      <td>Tip</td>\n      <td>6</td>\n    </tr>\n    <tr>\n      <td rowspan=\"5\">Index</td>\n      <td>Metacarpal</td>\n      <td>7</td>\n    </tr>\n    <tr>\n      <td>Proximal</td>\n      <td>8</td>\n    </tr>\n    <tr>\n      <td>Intermediate</td>\n      <td>9</td>\n    </tr>\n    <tr>\n      <td>Distal</td>\n      <td>10</td>\n    </tr>\n    <tr>\n      <td>Tip</td>\n      <td>11</td>\n    </tr>\n    <tr>\n      <td rowspan=\"5\">Middle</td>\n      <td>Metacarpal</td>\n      <td>12</td>\n    </tr>\n    <tr>\n      <td>Proximal</td>\n      <td>13</td>\n    </tr>\n    <tr>\n      <td>Intermediate</td>\n      <td>14</td>\n    </tr>\n    <tr>\n      <td>Distal</td>\n      <td>15</td>\n    </tr>\n    <tr>\n      <td>Tip</td>\n      <td>16</td>\n    </tr>\n    <tr>\n      <td rowspan=\"5\">Ring</td>\n      <td>Metacarpal</td>\n      <td>17</td>\n    </tr>\n    <tr>\n      <td>Proximal</td>\n      <td>18</td>\n    </tr>\n    <tr>\n      <td>Intermediate</td>\n      <td>19</td>\n    </tr>\n    <tr>\n      <td>Distal</td>\n      <td>20</td>\n    </tr>\n    <tr>\n      <td>Tip</td>\n      <td>21</td>\n    </tr>\n    <tr>\n      <td rowspan=\"5\">Pinky</td>\n      <td>Metacarpal</td>\n      <td>22</td>\n    </tr>\n    <tr>\n      <td>Proximal</td>\n      <td>23</td>\n    </tr>\n    <tr>\n      <td>Intermediate</td>\n      <td>24</td>\n    </tr>\n    <tr>\n      <td>Distal</td>\n      <td>25</td>\n    </tr>\n    <tr>\n      <td>Tip</td>\n      <td>26</td>\n    </tr>\n  </tbody> </table>",
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The Device to query."
                }
              },
              returns = {
                {
                  name = "poses",
                  type = "table",
                  description = "A list of joint poses for the device.  Each pose is a table with 3 numbers for the position of the joint followed by 4 numbers for the angle/axis orientation of the joint."
                }
              }
            },
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The Device to query."
                },
                {
                  name = "t",
                  type = "table",
                  description = "A table to fill with the joint poses, instead of allocating a new one."
                }
              },
              returns = {
                {
                  name = "poses",
                  type = "table",
                  description = "A list of joint poses for the device.  Each pose is a table with 3 numbers for the position of the joint followed by 4 numbers for the angle/axis orientation of the joint."
                }
              }
            }
          }
        },
        {
          name = "getTime",
          summary = "Get the predicted display time.",
          description = "Returns the estimated time in the future at which the light from the pixels of the current frame will hit the eyes of the user.\n\nThis can be used as a replacement for `lovr.timer.getTime` for timestamps that are used for rendering to get a smoother result that is synchronized with the display of the headset.",
          key = "lovr.headset.getTime",
          module = "lovr.headset",
          notes = "This has a different epoch than `lovr.timer.getTime`, so it is not guaranteed to be close to that value.",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "time",
                  type = "number",
                  description = "The predicted display time, in seconds."
                }
              }
            }
          },
          related = {
            "lovr.timer.getTime"
          }
        },
        {
          name = "getVelocity",
          tag = "input",
          summary = "Get the linear velocity of a device.",
          description = "Returns the current linear velocity of a device, in meters per second.",
          key = "lovr.headset.getVelocity",
          module = "lovr.headset",
          related = {
            "lovr.headset.getAngularVelocity",
            "lovr.headset.getPose",
            "lovr.headset.getPosition",
            "lovr.headset.getOrientation"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the velocity of.",
                  default = "'head'"
                }
              },
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
          name = "getViewAngles",
          tag = "headset",
          summary = "Get the field of view angles of a view.",
          description = "Returns the view angles of one of the headset views.\n\nThese can be used with `Mat4:fov` to create a projection matrix.\n\nIf tracking data is unavailable for the view or the index is invalid, `nil` is returned.",
          key = "lovr.headset.getViewAngles",
          module = "lovr.headset",
          related = {
            "lovr.headset.getViewCount",
            "lovr.headset.getViewPose"
          },
          variants = {
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The view index."
                }
              },
              returns = {
                {
                  name = "left",
                  type = "number",
                  description = "The left view angle, in radians."
                },
                {
                  name = "right",
                  type = "number",
                  description = "The right view angle, in radians."
                },
                {
                  name = "top",
                  type = "number",
                  description = "The top view angle, in radians."
                },
                {
                  name = "bottom",
                  type = "number",
                  description = "The bottom view angle, in radians."
                }
              }
            }
          }
        },
        {
          name = "getViewCount",
          tag = "headset",
          summary = "Get the number of views used for rendering.",
          description = "Returns the number of views used for rendering.  Each view consists of a pose in space and a set of angle values that determine the field of view.\n\nThis is usually 2 for stereo rendering configurations, but it can also be different.  For example, one way of doing foveated rendering uses 2 views for each eye -- one low quality view with a wider field of view, and a high quality view with a narrower field of view.",
          key = "lovr.headset.getViewCount",
          module = "lovr.headset",
          related = {
            "lovr.headset.getViewPose",
            "lovr.headset.getViewAngles"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "count",
                  type = "number",
                  description = "The number of views."
                }
              }
            }
          }
        },
        {
          name = "getViewPose",
          tag = "headset",
          summary = "Get the pose of one of the views.",
          description = "Returns the pose of one of the headset views.  This info can be used to create view matrices or do other eye-dependent calculations.\n\nIf tracking data is unavailable for the view or the index is invalid, `nil` is returned.",
          key = "lovr.headset.getViewPose",
          module = "lovr.headset",
          related = {
            "lovr.headset.getViewCount",
            "lovr.headset.getViewAngles"
          },
          variants = {
            {
              arguments = {
                {
                  name = "view",
                  type = "number",
                  description = "The view index."
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the view position, in meters."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the view position, in meters."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the view position, in meters."
                },
                {
                  name = "angle",
                  type = "number",
                  description = "The amount of rotation around the rotation axis, in radians."
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
          name = "isDown",
          tag = "input",
          summary = "Get the state of a button on a device.",
          description = "Returns whether a button on a device is pressed.",
          key = "lovr.headset.isDown",
          module = "lovr.headset",
          related = {
            "DeviceButton",
            "lovr.headset.wasPressed",
            "lovr.headset.wasReleased",
            "lovr.headset.isTouched",
            "lovr.headset.getAxis"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device."
                },
                {
                  name = "button",
                  type = "DeviceButton",
                  description = "The button."
                }
              },
              returns = {
                {
                  name = "down",
                  type = "boolean",
                  description = "Whether the button on the device is currently pressed, or `nil` if the device does not have the specified button."
                }
              }
            }
          }
        },
        {
          name = "isTouched",
          tag = "input",
          summary = "Check if a button on a device is touched.",
          description = "Returns whether a button on a device is currently touched.",
          key = "lovr.headset.isTouched",
          module = "lovr.headset",
          related = {
            "DeviceButton",
            "lovr.headset.isDown",
            "lovr.headset.getAxis"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device."
                },
                {
                  name = "button",
                  type = "DeviceButton",
                  description = "The button."
                }
              },
              returns = {
                {
                  name = "touched",
                  type = "boolean",
                  description = "Whether the button on the device is currently touched, or `nil` if the device does not have the button or it isn't touch-sensitive."
                }
              }
            }
          }
        },
        {
          name = "isTracked",
          tag = "input",
          summary = "Check if a device is currently tracked.",
          description = "Returns whether any active headset driver is currently returning pose information for a device.",
          key = "lovr.headset.isTracked",
          module = "lovr.headset",
          notes = "If a device is tracked, it is guaranteed to return a valid pose until the next call to `lovr.headset.update`.",
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to get the pose of.",
                  default = "'head'"
                }
              },
              returns = {
                {
                  name = "tracked",
                  type = "boolean",
                  description = "Whether the device is currently tracked."
                }
              }
            }
          }
        },
        {
          name = "newModel",
          tag = "input",
          summary = "Get a Model for a device.",
          description = "Returns a new Model for the specified device.",
          key = "lovr.headset.newModel",
          module = "lovr.headset",
          related = {
            "lovr.headset.animate"
          },
          examples = {
            {
              code = "local models = {}\n\nfunction lovr.draw()\n  for i, hand in ipairs(lovr.headset.getHands()) do\n    models[hand] = models[hand] or lovr.headset.newModel(hand)\n\n    if models[hand] then\n      local x, y, z, angle, ax, ay, az = lovr.headset.getPose(hand)\n      models[hand]:draw(x, y, z, 1, angle, ax, ay, az)\n    end\n  end\nend"
            }
          },
          notes = "This is only supported on the `openvr` and `vrapi` drivers right now.",
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to load a model for.",
                  default = "'head'"
                },
                {
                  name = "options",
                  type = "table",
                  description = "Options for loading the model.",
                  table = {
                    {
                      name = "animated",
                      type = "boolean",
                      description = "Whether an animatable model should be loaded, for use with `lovr.headset.animate`.",
                      default = "false"
                    }
                  },
                  default = "{}"
                }
              },
              returns = {
                {
                  name = "model",
                  type = "Model",
                  description = "The new Model, or `nil` if a model could not be loaded."
                }
              }
            }
          }
        },
        {
          name = "renderTo",
          tag = "headset",
          summary = "Render to the headset using a function.",
          description = "Renders to each eye of the headset using a function.\n\nThis function takes care of setting the appropriate graphics transformations to ensure that the scene is rendered as though it is being viewed through each eye of the player.  It also takes care of setting the correct projection for the headset lenses.\n\nIf the headset module is enabled, this function is called automatically by `lovr.run` with `lovr.draw` as the callback.",
          key = "lovr.headset.renderTo",
          module = "lovr.headset",
          notes = "When using the `pico` headset driver, headset rendering is asynchronous and the callback passed to `lovr.headset.renderTo` will not be called immediately.\n\nAt the beginning of the callback, the display is cleared to the background color.  The background color can be changed using `lovr.graphics.setBackgroundColor`.\n\nIf the callback is `nil`, an empty frame cleared to current graphics background color will be submitted to the headset.",
          variants = {
            {
              arguments = {
                {
                  name = "callback",
                  type = "function",
                  description = "The function used to render.  Any functions called will render to the headset instead of to the window.",
                  arguments = {},
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
          notes = "The default clip distances are 0.1 and 100.0.",
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
          name = "vibrate",
          tag = "input",
          summary = "Make a device go BZZZ!",
          description = "Causes the device to vibrate with a custom strength, duration, and frequency, if possible.",
          key = "lovr.headset.vibrate",
          module = "lovr.headset",
          notes = "When using the `openvr` headset driver on an HTC Vive, the value for the `duration` currently must be less than .004 seconds.  Call this function several frames in a row for stronger or prolonged vibration patterns.\n\nOn the Oculus Quest, devices can only be vibrated once per frame.  Any attempts after the first will return `false`.",
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device to vibrate.",
                  default = "'head'"
                },
                {
                  name = "strength",
                  type = "number",
                  description = "The strength of the vibration (amplitude), between 0 and 1.",
                  default = "1"
                },
                {
                  name = "duration",
                  type = "number",
                  description = "The duration of the vibration, in seconds.",
                  default = ".5"
                },
                {
                  name = "frequency",
                  type = "number",
                  description = "The frequency of the vibration, in hertz.  0 will use a default frequency.",
                  default = "0"
                }
              },
              returns = {
                {
                  name = "vibrated",
                  type = "boolean",
                  description = "Whether the vibration was successfully triggered by an active headset driver."
                }
              }
            }
          }
        },
        {
          name = "wasPressed",
          tag = "input",
          summary = "Check if a button was just pressed.",
          description = "Returns whether a button on a device was pressed this frame.",
          key = "lovr.headset.wasPressed",
          module = "lovr.headset",
          notes = "Some headset backends are not able to return pressed/released information.  These drivers will always return false for `lovr.headset.wasPressed` and `lovr.headset.wasReleased`.\n\nTypically the internal `lovr.headset.update` function will update pressed/released status.",
          related = {
            "DeviceButton",
            "lovr.headset.isDown",
            "lovr.headset.wasReleased",
            "lovr.headset.isTouched",
            "lovr.headset.getAxis"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device."
                },
                {
                  name = "button",
                  type = "DeviceButton",
                  description = "The button to check."
                }
              },
              returns = {
                {
                  name = "pressed",
                  type = "boolean",
                  description = "Whether the button on the device was pressed this frame."
                }
              }
            }
          }
        },
        {
          name = "wasReleased",
          tag = "input",
          summary = "Check if a button was just released.",
          description = "Returns whether a button on a device was released this frame.",
          key = "lovr.headset.wasReleased",
          module = "lovr.headset",
          notes = "Some headset backends are not able to return pressed/released information.  These drivers will always return false for `lovr.headset.wasPressed` and `lovr.headset.wasReleased`.\n\nTypically the internal `lovr.headset.update` function will update pressed/released status.",
          related = {
            "DeviceButton",
            "lovr.headset.isDown",
            "lovr.headset.wasPressed",
            "lovr.headset.isTouched",
            "lovr.headset.getAxis"
          },
          variants = {
            {
              arguments = {
                {
                  name = "device",
                  type = "Device",
                  description = "The device."
                },
                {
                  name = "button",
                  type = "DeviceButton",
                  description = "The button to check."
                }
              },
              returns = {
                {
                  name = "released",
                  type = "boolean",
                  description = "Whether the button on the device was released this frame."
                }
              }
            }
          }
        }
      },
      enums = {
        {
          name = "Device",
          description = "Different types of input devices supported by the `lovr.headset` module.",
          key = "Device",
          module = "lovr.headset",
          related = {
            "DeviceAxis",
            "DeviceButton",
            "lovr.headset.getPose",
            "lovr.headset.getPosition",
            "lovr.headset.getOrientation",
            "lovr.headset.getVelocity",
            "lovr.headset.getAngularVelocity",
            "lovr.headset.getSkeleton",
            "lovr.headset.isTracked",
            "lovr.headset.isDown",
            "lovr.headset.isTouched",
            "lovr.headset.wasPressed",
            "lovr.headset.wasReleased",
            "lovr.headset.getAxis",
            "lovr.headset.vibrate",
            "lovr.headset.animate"
          },
          values = {
            {
              name = "head",
              description = "The headset."
            },
            {
              name = "hand/left",
              description = "The left controller."
            },
            {
              name = "hand/right",
              description = "The right controller."
            },
            {
              name = "left",
              description = "A shorthand for hand/left."
            },
            {
              name = "right",
              description = "A shorthand for hand/right."
            },
            {
              name = "elbow/left",
              description = "A device tracking the left elbow."
            },
            {
              name = "elbow/right",
              description = "A device tracking the right elbow."
            },
            {
              name = "shoulder/left",
              description = "A device tracking the left shoulder."
            },
            {
              name = "shoulder/right",
              description = "A device tracking the right shoulder."
            },
            {
              name = "chest",
              description = "A device tracking the chest."
            },
            {
              name = "waist",
              description = "A device tracking the waist."
            },
            {
              name = "knee/left",
              description = "A device tracking the left knee."
            },
            {
              name = "knee/right",
              description = "A device tracking the right knee."
            },
            {
              name = "foot/left",
              description = "A device tracking the left foot or ankle."
            },
            {
              name = "foot/right",
              description = "A device tracking the right foot or ankle."
            },
            {
              name = "camera",
              description = "A device used as a camera in the scene."
            },
            {
              name = "keyboard",
              description = "A tracked keyboard."
            },
            {
              name = "eye/left",
              description = "The left eye."
            },
            {
              name = "eye/right",
              description = "The right eye."
            },
            {
              name = "beacon/1",
              description = "The first tracking device (i.e. lighthouse)."
            },
            {
              name = "beacon/2",
              description = "The second tracking device (i.e. lighthouse)."
            },
            {
              name = "beacon/3",
              description = "The third tracking device (i.e. lighthouse)."
            },
            {
              name = "beacon/4",
              description = "The fourth tracking device (i.e. lighthouse)."
            }
          }
        },
        {
          name = "DeviceAxis",
          description = "Axes on an input device.",
          key = "DeviceAxis",
          module = "lovr.headset",
          related = {
            "lovr.headset.getAxis",
            "DeviceButton"
          },
          values = {
            {
              name = "trigger",
              description = "A trigger (1D)."
            },
            {
              name = "thumbstick",
              description = "A thumbstick (2D)."
            },
            {
              name = "touchpad",
              description = "A touchpad (2D)."
            },
            {
              name = "grip",
              description = "A grip button or grab gesture (1D)."
            }
          }
        },
        {
          name = "DeviceButton",
          description = "Buttons on an input device.",
          key = "DeviceButton",
          module = "lovr.headset",
          values = {
            {
              name = "trigger",
              description = "The trigger button."
            },
            {
              name = "thumbstick",
              description = "The thumbstick."
            },
            {
              name = "touchpad",
              description = "The touchpad."
            },
            {
              name = "grip",
              description = "The grip button."
            },
            {
              name = "menu",
              description = "The menu button."
            },
            {
              name = "a",
              description = "The A button."
            },
            {
              name = "b",
              description = "The B button."
            },
            {
              name = "x",
              description = "The X button."
            },
            {
              name = "y",
              description = "The Y button."
            },
            {
              name = "proximity",
              description = "The proximity sensor on a headset."
            }
          }
        },
        {
          name = "HeadsetDriver",
          summary = "VR APIs.",
          description = "These are all of the supported VR APIs that LÖVR can use to power the lovr.headset module.  You can change the order of headset drivers using `lovr.conf` to prefer or exclude specific VR APIs.\n\nAt startup, LÖVR searches through the list of drivers in order.  One headset driver will be used for rendering to the VR display, and all supported headset drivers will be used for device input.  The way this works is that when poses or button input is requested, the input drivers are queried (in the order they appear in `conf.lua`) to see if any of them currently have data for the specified device.  The first one that returns data will be used to provide the result. This allows projects to support multiple types of hardware devices.",
          key = "HeadsetDriver",
          module = "lovr.headset",
          values = {
            {
              name = "desktop",
              description = "A VR simulator using keyboard/mouse."
            },
            {
              name = "oculus",
              description = "Oculus Desktop SDK."
            },
            {
              name = "openvr",
              description = "OpenVR."
            },
            {
              name = "openxr",
              description = "OpenXR."
            },
            {
              name = "vrapi",
              description = "Oculus Mobile SDK."
            },
            {
              name = "pico",
              description = "Pico."
            },
            {
              name = "webxr",
              description = "WebXR."
            }
          }
        },
        {
          name = "HeadsetOrigin",
          summary = "Different types of coordinate space origins.",
          description = "Represents the different types of origins for coordinate spaces.  An origin of \"floor\" means that the origin is on the floor in the middle of a room-scale play area.  An origin of \"head\" means that no positional tracking is available, and consequently the origin is always at the position of the headset.",
          key = "HeadsetOrigin",
          module = "lovr.headset",
          values = {
            {
              name = "head",
              description = "The origin is at the head."
            },
            {
              name = "floor",
              description = "The origin is on the floor."
            }
          }
        }
      },
      sections = {
        {
          name = "Headset",
          tag = "headset",
          description = "Functions that return information about the active head mounted display (HMD)."
        },
        {
          name = "Input",
          tag = "input",
          description = "Functions for accessing input devices, like controllers, hands, trackers, or gamepads."
        },
        {
          name = "Play area",
          tag = "playArea",
          description = "Retrieve information about the size and shape of the room the player is in, and provides information about the \"chaperone\", a visual indicator that appears whenever a player is about to run into a wall."
        }
      }
    },
    {
      name = "math",
      tag = "modules",
      summary = "Contains useful math helpers.",
      description = "The `lovr.math` module provides math helpers commonly used for 3D applications.",
      key = "lovr.math",
      objects = {
        {
          name = "Curve",
          summary = "A Bézier curve.",
          description = "A Curve is an object that represents a Bézier curve in three dimensions.  Curves are defined by an arbitrary number of control points (note that the curve only passes through the first and last control point).\n\nOnce a Curve is created with `lovr.math.newCurve`, you can use `Curve:evaluate` to get a point on the curve or `Curve:render` to get a list of all of the points on the curve.  These points can be passed directly to `lovr.graphics.points` or `lovr.graphics.line` to render the curve.\n\nNote that for longer or more complicated curves (like in a drawing application) it can be easier to store the path as several Curve objects.",
          key = "Curve",
          module = "lovr.math",
          constructors = {
            "lovr.math.newCurve",
            "Curve:slice"
          },
          methods = {
            {
              name = "addPoint",
              summary = "Add a new control point to the Curve.",
              description = "Inserts a new control point into the Curve at the specified index.",
              key = "Curve:addPoint",
              module = "lovr.math",
              notes = "An error will be thrown if the index is less than one or more than the number of control points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the control point."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the control point."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the control point."
                    },
                    {
                      name = "index",
                      type = "number",
                      description = "The index to insert the control point at.  If nil, the control point is added to the end of the list of control points.",
                      default = "nil"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Curve:getPointCount",
                "Curve:getPoint",
                "Curve:setPoint",
                "Curve:removePoint"
              }
            },
            {
              name = "evaluate",
              summary = "Turn a number from 0 to 1 into a point on the Curve.",
              description = "Returns a point on the Curve given a parameter `t` from 0 to 1.  0 will return the first control point, 1 will return the last point, .5 will return a point in the \"middle\" of the Curve, etc.",
              key = "Curve:evaluate",
              module = "lovr.math",
              notes = "An error will be thrown if `t` is not between 0 and 1, or if the Curve has less than two points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "t",
                      type = "number",
                      description = "The parameter to evaluate the Curve at."
                    }
                  },
                  returns = {
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
                  }
                }
              },
              related = {
                "Curve:getTangent",
                "Curve:render",
                "Curve:slice"
              }
            },
            {
              name = "getPoint",
              summary = "Get a control point of the Curve.",
              description = "Returns a control point of the Curve.",
              key = "Curve:getPoint",
              module = "lovr.math",
              notes = "An error will be thrown if the index is less than one or more than the number of control points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index to retrieve."
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x coordinate of the control point."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y coordinate of the control point."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z coordinate of the control point."
                    }
                  }
                }
              },
              related = {
                "Curve:getPointCount",
                "Curve:setPoint",
                "Curve:addPoint",
                "Curve:removePoint"
              }
            },
            {
              name = "getPointCount",
              summary = "Get the number of control points in the Curve.",
              description = "Returns the number of control points in the Curve.",
              key = "Curve:getPointCount",
              module = "lovr.math",
              related = {
                "Curve:getPoint",
                "Curve:setPoint",
                "Curve:addPoint",
                "Curve:removePoint"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "count",
                      type = "number",
                      description = "The number of control points."
                    }
                  }
                }
              }
            },
            {
              name = "getTangent",
              summary = "Get the direction of the Curve at a point.",
              description = "Returns a direction vector for the Curve given a parameter `t` from 0 to 1.  0 will return the direction at the first control point, 1 will return the direction at the last point, .5 will return the direction at the \"middle\" of the Curve, etc.",
              key = "Curve:getTangent",
              module = "lovr.math",
              notes = "The direction vector returned by this function will have a length of one.",
              variants = {
                {
                  arguments = {
                    {
                      name = "t",
                      type = "number",
                      description = "Where on the Curve to compute the direction."
                    }
                  },
                  returns = {
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
                  }
                }
              },
              related = {
                "Curve:evaluate",
                "Curve:render",
                "Curve:slice"
              }
            },
            {
              name = "removePoint",
              summary = "Remove a control point from the Curve.",
              description = "Removes a control point from the Curve.",
              key = "Curve:removePoint",
              module = "lovr.math",
              notes = "An error will be thrown if the index is less than one or more than the number of control points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index of the control point to remove."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Curve:getPointCount",
                "Curve:getPoint",
                "Curve:setPoint",
                "Curve:addPoint"
              }
            },
            {
              name = "render",
              summary = "Get a list of points on the Curve.",
              description = "Returns a list of points on the Curve.  The number of points can be specified to get a more or less detailed representation, and it is also possible to render a subsection of the Curve.",
              key = "Curve:render",
              module = "lovr.math",
              notes = "This function will always return 2 points if the Curve is a line with only 2 control points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "n",
                      type = "number",
                      description = "The number of points to use.",
                      default = "32"
                    },
                    {
                      name = "t1",
                      type = "number",
                      description = "How far along the curve to start rendering.",
                      default = "0"
                    },
                    {
                      name = "t2",
                      type = "number",
                      description = "How far along the curve to stop rendering.",
                      default = "1"
                    }
                  },
                  returns = {
                    {
                      name = "t",
                      type = "table",
                      description = "A (flat) table of 3D points along the curve."
                    }
                  }
                }
              },
              related = {
                "Curve:evaluate",
                "Curve:slice",
                "lovr.graphics.points",
                "lovr.graphics.line"
              }
            },
            {
              name = "setPoint",
              summary = "Set a control point of the Curve.",
              description = "Changes the position of a control point on the Curve.",
              key = "Curve:setPoint",
              module = "lovr.math",
              notes = "An error will be thrown if the index is less than one or more than the number of control points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "index",
                      type = "number",
                      description = "The index to modify."
                    },
                    {
                      name = "x",
                      type = "number",
                      description = "The new x coordinate."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The new y coordinate."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The new z coordinate."
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "Curve:getPointCount",
                "Curve:getPoint",
                "Curve:addPoint",
                "Curve:removePoint"
              }
            },
            {
              name = "slice",
              summary = "Get a new Curve from a slice of an existing one.",
              description = "Returns a new Curve created by slicing the Curve at the specified start and end points.",
              key = "Curve:slice",
              module = "lovr.math",
              notes = "The new Curve will have the same number of control points as the existing curve.\n\nAn error will be thrown if t1 or t2 are not between 0 and 1, or if the Curve has less than two points.",
              variants = {
                {
                  arguments = {
                    {
                      name = "t1",
                      type = "number",
                      description = "The starting point to slice at."
                    },
                    {
                      name = "t2",
                      type = "number",
                      description = "The ending point to slice at."
                    }
                  },
                  returns = {
                    {
                      name = "curve",
                      type = "Curve",
                      description = "A new Curve."
                    }
                  }
                }
              },
              related = {
                "Curve:evaluate",
                "Curve:render"
              }
            }
          }
        },
        {
          name = "Mat4",
          summary = "A 4x4 matrix.",
          description = "A `mat4` is a math type that holds 16 values in a 4x4 grid.",
          key = "Mat4",
          module = "lovr.math",
          constructors = {
            "lovr.math.newMat4",
            "lovr.math.mat4"
          },
          related = {
            "Vec3",
            "Quat"
          },
          methods = {
            {
              name = "fov",
              summary = "Set a projection using raw FoV angles.",
              description = "Sets a projection matrix using raw projection angles and clipping planes.\n\nThis can be used for asymmetric or oblique projections.",
              key = "Mat4:fov",
              module = "lovr.math",
              related = {
                "Mat4:orthographic",
                "Mat4:perspective",
                "lovr.graphics.setProjection"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "left",
                      type = "number",
                      description = "The left half-angle of the projection, in radians."
                    },
                    {
                      name = "right",
                      type = "number",
                      description = "The right half-angle of the projection, in radians."
                    },
                    {
                      name = "up",
                      type = "number",
                      description = "The top half-angle of the projection, in radians."
                    },
                    {
                      name = "down",
                      type = "number",
                      description = "The bottom half-angle of the projection, in radians."
                    },
                    {
                      name = "near",
                      type = "number",
                      description = "The near plane of the projection."
                    },
                    {
                      name = "far",
                      type = "number",
                      description = "The far plane of the projection."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "identity",
              summary = "Reset the matrix to the identity.",
              description = "Resets the matrix to the identity, effectively setting its translation to zero, its scale to 1, and clearing any rotation.",
              key = "Mat4:identity",
              module = "lovr.math",
              related = {
                "lovr.graphics.origin"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "invert",
              summary = "Invert the matrix.",
              description = "Inverts the matrix, causing it to represent the opposite of its old transform.",
              key = "Mat4:invert",
              module = "lovr.math",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "lookAt",
              summary = "Create a view transform that looks from a position to target position.",
              description = "Sets a view transform matrix that moves and orients camera to look at a target point.\n\nThis is useful for changing camera position and orientation. The resulting Mat4 matrix can be passed to `lovr.graphics.transform()` directly (without inverting) before rendering the scene.\n\nThe lookAt() function produces same result as target() after matrix inversion.",
              key = "Mat4:lookAt",
              module = "lovr.math",
              related = {
                "Mat4:target",
                "Quat:direction"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "from",
                      type = "Vec3",
                      description = "The position of the viewer."
                    },
                    {
                      name = "to",
                      type = "Vec3",
                      description = "The position of the target."
                    },
                    {
                      name = "up",
                      type = "Vec3",
                      description = "The up vector of the viewer.",
                      default = "Vec3(0, 1, 0)"
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "mul",
              summary = "Multiply a matrix with another matrix or a vector.",
              description = "Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns the vector.",
              key = "Mat4:mul",
              module = "lovr.math",
              notes = "When multiplying by a vec4, the vector is treated as either a point if its w component is 1, or a direction vector if the w is 0 (the matrix translation won't be applied).",
              variants = {
                {
                  arguments = {
                    {
                      name = "n",
                      type = "Mat4",
                      description = "The matrix."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix, containing the result."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "v3",
                      type = "Vec3",
                      description = "A 3D vector, treated as a point."
                    }
                  },
                  returns = {
                    {
                      name = "v3",
                      type = "Vec3",
                      description = "The transformed vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "v4",
                      type = "Vec4",
                      description = "A 4D vector."
                    }
                  },
                  returns = {
                    {
                      name = "v4",
                      type = "Vec4",
                      description = "The transformed vector."
                    }
                  }
                }
              },
              related = {
                "Mat4:translate",
                "Mat4:rotate",
                "Mat4:scale"
              }
            },
            {
              name = "orthographic",
              summary = "Turn the matrix into an orthographic projection.",
              description = "Sets this matrix to represent an orthographic projection, useful for 2D/isometric rendering.\n\nThis can be used with `lovr.graphics.setProjection`, or it can be sent to a `Shader` for use in GLSL.",
              key = "Mat4:orthographic",
              module = "lovr.math",
              related = {
                "Mat4:perspective",
                "Mat4:fov",
                "lovr.graphics.setProjection"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "left",
                      type = "number",
                      description = "The left edge of the projection."
                    },
                    {
                      name = "right",
                      type = "number",
                      description = "The right edge of the projection."
                    },
                    {
                      name = "top",
                      type = "number",
                      description = "The top edge of the projection."
                    },
                    {
                      name = "bottom",
                      type = "number",
                      description = "The bottom edge of the projection."
                    },
                    {
                      name = "near",
                      type = "number",
                      description = "The position of the near clipping plane."
                    },
                    {
                      name = "far",
                      type = "number",
                      description = "The position of the far clipping plane."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "perspective",
              summary = "Turn the matrix into a perspective projection.",
              description = "Sets this matrix to represent a perspective projection.\n\nThis can be used with `lovr.graphics.setProjection`, or it can be sent to a `Shader` for use in GLSL.",
              key = "Mat4:perspective",
              module = "lovr.math",
              related = {
                "Mat4:orthographic",
                "Mat4:fov",
                "lovr.graphics.setProjection"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "near",
                      type = "number",
                      description = "The near plane."
                    },
                    {
                      name = "far",
                      type = "number",
                      description = "The far plane."
                    },
                    {
                      name = "fov",
                      type = "number",
                      description = "The vertical field of view (in radians)."
                    },
                    {
                      name = "aspect",
                      type = "number",
                      description = "The horizontal aspect ratio of the projection (width / height)."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "rotate",
              summary = "Rotate the matrix.",
              description = "Rotates the matrix using a quaternion or an angle/axis rotation.",
              key = "Mat4:rotate",
              module = "lovr.math",
              related = {
                "Mat4:translate",
                "Mat4:scale",
                "Mat4:identity"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "q",
                      type = "Quat",
                      description = "The rotation to apply to the matrix."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The angle component of the angle/axis rotation (radians)."
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
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "scale",
              summary = "Scale the matrix.",
              description = "Scales the matrix.",
              key = "Mat4:scale",
              module = "lovr.math",
              related = {
                "Mat4:translate",
                "Mat4:rotate",
                "Mat4:identity"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "scale",
                      type = "Vec3",
                      description = "The 3D scale to apply."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "sx",
                      type = "number",
                      description = "The x component of the scale to apply."
                    },
                    {
                      name = "sy",
                      type = "number",
                      description = "The y component of the scale to apply.",
                      default = "sx"
                    },
                    {
                      name = "sz",
                      type = "number",
                      description = "The z component of the scale to apply.",
                      default = "sx"
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "set",
              summary = "Set the components of the matrix.",
              description = "Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.",
              key = "Mat4:set",
              module = "lovr.math",
              related = {
                "Mat4:unpack"
              },
              variants = {
                {
                  description = "Resets the matrix to the identity matrix.",
                  arguments = {},
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The input matrix."
                    }
                  }
                },
                {
                  description = "Copies the values from an existing matrix.",
                  arguments = {
                    {
                      name = "n",
                      type = "mat4",
                      description = "An existing matrix to copy the values from."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The input matrix."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "position",
                      type = "Vec3",
                      description = "The translation of the matrix.",
                      default = "0, 0, 0"
                    },
                    {
                      name = "scale",
                      type = "Vec3",
                      description = "The scale of the matrix.",
                      default = "1, 1, 1"
                    },
                    {
                      name = "rotation",
                      type = "Quat",
                      description = "The rotation of the matrix.",
                      default = "0, 0, 0, 1"
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The input matrix."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "position",
                      type = "Vec3",
                      description = "The translation of the matrix.",
                      default = "0, 0, 0"
                    },
                    {
                      name = "rotation",
                      type = "Quat",
                      description = "The rotation of the matrix.",
                      default = "0, 0, 0, 1"
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The input matrix."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "...",
                      type = "number",
                      description = "16 numbers to use as the raw values of the matrix (column-major)."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The input matrix."
                    }
                  }
                },
                {
                  description = "Sets the diagonal values to a number and everything else to 0.",
                  arguments = {
                    {
                      name = "d",
                      type = "number",
                      description = "A number to use for the diagonal elements."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The input matrix."
                    }
                  }
                }
              }
            },
            {
              name = "target",
              summary = "Create a model transform that targets from a position to target position.",
              description = "Sets a model transform matrix that moves to `from` and orients model towards `to` point.\n\nThis is used when rendered model should always point torwards a point of interest. The resulting Mat4 object can be used as model pose.\n\nThe target() function produces same result as lookAt() after matrix inversion.",
              key = "Mat4:target",
              module = "lovr.math",
              related = {
                "Mat4:lookAt",
                "Quat:direction"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "from",
                      type = "Vec3",
                      description = "The position of the viewer."
                    },
                    {
                      name = "to",
                      type = "Vec3",
                      description = "The position of the target."
                    },
                    {
                      name = "up",
                      type = "Vec3",
                      description = "The up vector of the viewer.",
                      default = "Vec3(0, 1, 0)"
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "translate",
              summary = "Translate the matrix.",
              description = "Translates the matrix.",
              key = "Mat4:translate",
              module = "lovr.math",
              related = {
                "Mat4:rotate",
                "Mat4:scale",
                "Mat4:identity"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The translation vector."
                    }
                  },
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                },
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
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "transpose",
              summary = "Transpose the matrix.",
              description = "Transposes the matrix, mirroring its values along the diagonal.",
              key = "Mat4:transpose",
              module = "lovr.math",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The original matrix."
                    }
                  }
                }
              }
            },
            {
              name = "unpack",
              summary = "Get the individual components of the matrix.",
              description = "Returns the components of matrix, either as 10 separated numbers representing the position, scale, and rotation, or as 16 raw numbers representing the individual components of the matrix in column-major order.",
              key = "Mat4:unpack",
              module = "lovr.math",
              related = {
                "Mat4:set"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "raw",
                      type = "boolean",
                      description = "Whether to return the 16 raw components."
                    }
                  },
                  returns = {
                    {
                      name = "...",
                      type = "number",
                      description = "The requested components of the matrix."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "Quat",
          summary = "A quaternion.",
          description = "A `quat` is a math type that represents a 3D rotation, stored as four numbers.",
          key = "Quat",
          module = "lovr.math",
          constructors = {
            "lovr.math.newQuat",
            "lovr.math.quat"
          },
          related = {
            "Vec3",
            "Mat4"
          },
          methods = {
            {
              name = "conjugate",
              summary = "Conjugate (invert) the quaternion.",
              description = "Conjugates the input quaternion in place, returning the input.  If the quaternion is normalized, this is the same as inverting it.  It negates the (x, y, z) components of the quaternion.",
              key = "Quat:conjugate",
              module = "lovr.math",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "q",
                      type = "Quat",
                      description = "The original quaternion."
                    }
                  }
                }
              }
            },
            {
              name = "direction",
              summary = "Get the direction of the quaternion.",
              description = "Creates a new temporary vec3 facing the forward direction, rotates it by this quaternion, and returns the vector.",
              key = "Quat:direction",
              module = "lovr.math",
              related = {
                "Mat4:lookAt"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The direction vector."
                    }
                  }
                }
              }
            },
            {
              name = "length",
              summary = "Get the length of the quaternion.",
              description = "Returns the length of the quaternion.",
              key = "Quat:length",
              module = "lovr.math",
              related = {
                "Quat:normalize"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the quaternion."
                    }
                  }
                }
              }
            },
            {
              name = "mul",
              summary = "Multiply a quaternion by another quaternion or a vector.",
              description = "Multiplies this quaternion by another value.  If the value is a quaternion, the rotations in the two quaternions are applied sequentially and the result is stored in the first quaternion.  If the value is a vector, then the input vector is rotated by the quaternion and returned.",
              key = "Quat:mul",
              module = "lovr.math",
              variants = {
                {
                  arguments = {
                    {
                      name = "r",
                      type = "quat",
                      description = "A quaternion to combine with the original."
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "v3",
                      type = "vec3",
                      description = "A vector to rotate."
                    }
                  },
                  returns = {
                    {
                      name = "v3",
                      type = "vec3",
                      description = "Vector rotated by quaternion."
                    }
                  }
                }
              }
            },
            {
              name = "normalize",
              summary = "Normalize the length of the quaternion to 1.",
              description = "Adjusts the values in the quaternion so that its length becomes 1.",
              key = "Quat:normalize",
              module = "lovr.math",
              notes = "A common source of bugs with quaternions is to forget to normalize them after performing a series of operations on them.  Try normalizing a quaternion if some of the calculations aren't working quite right!",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "q",
                      type = "Quat",
                      description = "The original quaternion."
                    }
                  }
                }
              },
              related = {
                "Quat:length"
              }
            },
            {
              name = "set",
              summary = "Set the components of the quaternion.",
              description = "Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:\n\n- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.\n- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.\n- An existing quaternion can be passed in to copy its values.\n- A single direction vector can be specified to turn its direction (relative to the default\n  forward direction of \"negative z\") into a rotation.\n- Two direction vectors can be specified to set the quaternion equal to the rotation between the\n  two vectors.\n- A matrix can be passed in to extract the rotation of the matrix into a quaternion.",
              key = "Quat:set",
              module = "lovr.math",
              related = {
                "Quat:unpack"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "angle",
                      type = "number",
                      description = "The angle to use for the rotation, in radians.",
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
                      default = "0"
                    },
                    {
                      name = "az",
                      type = "number",
                      description = "The z component of the axis of rotation.",
                      default = "0"
                    },
                    {
                      name = "raw",
                      type = "boolean",
                      description = "Whether the components should be interpreted as raw `(x, y, z, w)` components.",
                      default = "false"
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "r",
                      type = "quat",
                      description = "An existing quaternion to copy the values from."
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                },
                {
                  description = "Sets the values from a direction vector.",
                  arguments = {
                    {
                      name = "v",
                      type = "vec3",
                      description = "A normalized direction vector."
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                },
                {
                  description = "Sets the values to represent the rotation between two vectors.",
                  arguments = {
                    {
                      name = "v",
                      type = "vec3",
                      description = "A normalized direction vector."
                    },
                    {
                      name = "u",
                      type = "vec3",
                      description = "Another normalized direction vector."
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "m",
                      type = "mat4",
                      description = "A matrix to use the rotation from."
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                },
                {
                  description = "Reset the quaternion to the identity (0, 0, 0, 1).",
                  arguments = {},
                  returns = {
                    {
                      name = "q",
                      type = "quat",
                      description = "The original quaternion."
                    }
                  }
                }
              }
            },
            {
              name = "slerp",
              summary = "Moves this quaternion some amount towards another one.",
              description = "Performs a spherical linear interpolation between this quaternion and another one, which can be used for smoothly animating between two rotations.\n\nThe amount of interpolation is controlled by a parameter `t`.  A `t` value of zero leaves the original quaternion unchanged, whereas a `t` of one sets the original quaternion exactly equal to the target.  A value between `0` and `1` returns a rotation between the two based on the value.",
              key = "Quat:slerp",
              module = "lovr.math",
              related = {
                "Vec3:lerp"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "r",
                      type = "Quat",
                      description = "The quaternion to slerp towards."
                    },
                    {
                      name = "t",
                      type = "number",
                      description = "The lerping parameter."
                    }
                  },
                  returns = {
                    {
                      name = "q",
                      type = "Quat",
                      description = "The original quaternion, containing the new lerped values."
                    }
                  }
                }
              }
            },
            {
              name = "unpack",
              summary = "Get the components of the quaternion.",
              description = "Returns the components of the quaternion as numbers, either in an angle/axis representation or as raw quaternion values.",
              key = "Quat:unpack",
              module = "lovr.math",
              related = {
                "Quat:set"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "raw",
                      type = "boolean",
                      description = "Whether the values should be returned as raw values instead of angle/axis.",
                      default = "false"
                    }
                  },
                  returns = {
                    {
                      name = "a",
                      type = "number",
                      description = "The angle in radians, or the x value."
                    },
                    {
                      name = "b",
                      type = "number",
                      description = "The x component of the rotation axis or the y value."
                    },
                    {
                      name = "c",
                      type = "number",
                      description = "The y component of the rotation axis or the z value."
                    },
                    {
                      name = "d",
                      type = "number",
                      description = "The z component of the rotation axis or the w value."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "RandomGenerator",
          summary = "A pseudo-random number generator.",
          description = "A RandomGenerator is a standalone object that can be used to independently generate pseudo-random numbers. If you just need basic randomness, you can use `lovr.math.random` without needing to create a random generator.",
          key = "RandomGenerator",
          module = "lovr.math",
          constructors = {
            "lovr.math.newRandomGenerator"
          },
          methods = {
            {
              name = "getSeed",
              summary = "Get the seed value of the RandomGenerator.",
              description = "Returns the seed used to initialize the RandomGenerator.",
              key = "RandomGenerator:getSeed",
              module = "lovr.math",
              notes = "Since the seed is a 64 bit integer, each 32 bits of the seed are returned separately to avoid precision issues.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "low",
                      type = "number",
                      description = "The lower 32 bits of the seed."
                    },
                    {
                      name = "high",
                      type = "number",
                      description = "The upper 32 bits of the seed."
                    }
                  }
                }
              },
              related = {
                "lovr.math.newRandomGenerator"
              }
            },
            {
              name = "getState",
              summary = "Get the current state of the RandomGenerator.",
              description = "Returns the current state of the RandomGenerator.  This can be used with `RandomGenerator:setState` to reliably restore a previous state of the generator.",
              key = "RandomGenerator:getState",
              module = "lovr.math",
              notes = "The seed represents the starting state of the RandomGenerator, whereas the state represents the current state of the generator.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "state",
                      type = "string",
                      description = "The serialized state."
                    }
                  }
                }
              }
            },
            {
              name = "random",
              summary = "Get a random number.",
              description = "Returns the next uniformly distributed pseudo-random number from the RandomGenerator's sequence.",
              key = "RandomGenerator:random",
              module = "lovr.math",
              related = {
                "lovr.math.random",
                "RandomGenerator:randomNormal"
              },
              variants = {
                {
                  description = "Generate a pseudo-random floating point number in the range `[0,1)`",
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "A pseudo-random number."
                    }
                  }
                },
                {
                  description = "Generate a pseudo-random integer in the range `[1,high]`",
                  arguments = {
                    {
                      name = "high",
                      type = "number",
                      description = "The maximum number to generate."
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "A pseudo-random number."
                    }
                  }
                },
                {
                  description = "Generate a pseudo-random integer in the range `[low,high]`",
                  arguments = {
                    {
                      name = "low",
                      type = "number",
                      description = "The minimum number to generate."
                    },
                    {
                      name = "high",
                      type = "number",
                      description = "The maximum number to generate."
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "A pseudo-random number."
                    }
                  }
                }
              }
            },
            {
              name = "randomNormal",
              summary = "Get a random number from a normal distribution.",
              description = "Returns a pseudo-random number from a normal distribution (a bell curve).  You can control the center of the bell curve (the mean value) and the overall width (sigma, or standard deviation).",
              key = "RandomGenerator:randomNormal",
              module = "lovr.math",
              related = {
                "lovr.math.randomNormal",
                "RandomGenerator:random"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "sigma",
                      type = "number",
                      description = "The standard deviation of the distribution.  This can be thought of how \"wide\" the range of numbers is or how much variability there is.",
                      default = "1"
                    },
                    {
                      name = "mu",
                      type = "number",
                      description = "The average value returned.",
                      default = "0"
                    }
                  },
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "A normally distributed pseudo-random number."
                    }
                  }
                }
              }
            },
            {
              name = "setSeed",
              summary = "Reinitialize the RandomGenerator with a new seed.",
              description = "Seed the RandomGenerator with a new seed.  Each seed will cause the RandomGenerator to produce a unique sequence of random numbers.",
              key = "RandomGenerator:setSeed",
              module = "lovr.math",
              notes = "For precise 64 bit seeds, you should specify the lower and upper 32 bits of the seed separately. Otherwise, seeds larger than 2^53 will start to lose precision.",
              variants = {
                {
                  arguments = {
                    low = {
                      type = "number",
                      description = "The lower 32 bits of the seed."
                    },
                    high = {
                      type = "number",
                      description = "The upper 32 bits of the seed."
                    },
                    seed = {
                      type = "number",
                      description = "The random seed."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setState",
              summary = "Set the state of the RandomGenerator.",
              description = "Sets the state of the RandomGenerator, as previously obtained using `RandomGenerator:getState`. This can be used to reliably restore a previous state of the generator.",
              key = "RandomGenerator:setState",
              module = "lovr.math",
              notes = "The seed represents the starting state of the RandomGenerator, whereas the state represents the current state of the generator.",
              variants = {
                {
                  arguments = {
                    {
                      name = "state",
                      type = "string",
                      description = "The serialized state."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Vec2",
          summary = "A 2D vector.",
          description = "A vector object that holds two numbers.",
          key = "Vec2",
          module = "lovr.math",
          constructors = {
            "lovr.math.newVec2",
            "lovr.math.vec2"
          },
          related = {
            "Vec3",
            "Vec4"
          },
          methods = {
            {
              name = "add",
              summary = "Add a vector or a number to the vector.",
              description = "Adds a vector or a number to the vector.",
              key = "Vec2:add",
              module = "lovr.math",
              related = {
                "Vec2:sub",
                "Vec2:mul",
                "Vec2:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The other vector."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "A number to add to each component."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "distance",
              summary = "Get the distance to another vector.",
              description = "Returns the distance to another vector.",
              key = "Vec2:distance",
              module = "lovr.math",
              related = {
                "Vec2:length"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The vector to measure the distance to."
                    }
                  },
                  returns = {
                    {
                      name = "distance",
                      type = "number",
                      description = "The distance to `u`."
                    }
                  }
                }
              }
            },
            {
              name = "div",
              summary = "Divides the vector by a vector or a number.",
              description = "Divides the vector by a vector or a number.",
              key = "Vec2:div",
              module = "lovr.math",
              related = {
                "Vec2:add",
                "Vec2:sub",
                "Vec2:mul"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The other vector to divide the components by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The number to divide each component by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "dot",
              summary = "Get the dot product with another vector.",
              description = "Returns the dot product between this vector and another one.",
              key = "Vec2:dot",
              module = "lovr.math",
              notes = "This is computed as:\n\n    dot = v.x * u.x + v.y * u.y + v.z * u.z\n\nThe vectors are not normalized before computing the dot product.",
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The vector to compute the dot product with."
                    }
                  },
                  returns = {
                    {
                      name = "dot",
                      type = "number",
                      description = "The dot product between `v` and `u`."
                    }
                  }
                }
              }
            },
            {
              name = "length",
              summary = "Get the length of the vector.",
              description = "Returns the length of the vector.",
              key = "Vec2:length",
              module = "lovr.math",
              notes = "The length is equivalent to this:\n\n    math.sqrt(v.x * v.x + v.y * v.y)",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the vector."
                    }
                  }
                }
              },
              related = {
                "Vec2:normalize",
                "Vec2:distance"
              }
            },
            {
              name = "lerp",
              summary = "Moves this vector some amount towards another one.",
              description = "Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.",
              key = "Vec2:lerp",
              module = "lovr.math",
              related = {
                "Quat:slerp"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The vector to lerp towards."
                    },
                    {
                      name = "t",
                      type = "number",
                      description = "The lerping parameter."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector, containing the new lerped values."
                    }
                  }
                }
              }
            },
            {
              name = "mul",
              summary = "Multiply the vector by a vector or a number.",
              description = "Multiplies the vector by a vector or a number.",
              key = "Vec2:mul",
              module = "lovr.math",
              related = {
                "Vec2:add",
                "Vec2:sub",
                "Vec2:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The other vector to multiply the components by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The number to multiply each component by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "normalize",
              summary = "Normalize the length of the vector to 1.",
              description = "Adjusts the values in the vector so that its direction stays the same but its length becomes 1.",
              key = "Vec2:normalize",
              module = "lovr.math",
              related = {
                "Vec2:length"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "set",
              summary = "Set the components of the vector.",
              description = "Sets the components of the vector, either from numbers or an existing vector.",
              key = "Vec2:set",
              module = "lovr.math",
              related = {
                "Vec2:unpack"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The new x value of the vector.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The new y value of the vector.",
                      default = "x"
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The input vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The vector to copy the values from."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The input vector."
                    }
                  }
                }
              }
            },
            {
              name = "sub",
              summary = "Subtract a vector or a number from the vector.",
              description = "Subtracts a vector or a number from the vector.",
              key = "Vec2:sub",
              module = "lovr.math",
              related = {
                "Vec2:add",
                "Vec2:mul",
                "Vec2:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The other vector."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "A number to subtract from each component."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "unpack",
              summary = "Get the components of the vector.",
              description = "Returns the 2 components of the vector as numbers.",
              key = "Vec2:unpack",
              module = "lovr.math",
              related = {
                "Vec2:set"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x value."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y value."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "Vec3",
          summary = "A 3D vector.",
          description = "A vector object that holds three numbers.",
          key = "Vec3",
          module = "lovr.math",
          constructors = {
            "lovr.math.newVec3",
            "lovr.math.vec3"
          },
          related = {
            "Vec2",
            "Vec4"
          },
          methods = {
            {
              name = "add",
              summary = "Add a vector or a number to the vector.",
              description = "Adds a vector or a number to the vector.",
              key = "Vec3:add",
              module = "lovr.math",
              related = {
                "Vec3:sub",
                "Vec3:mul",
                "Vec3:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The other vector."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "A number to add to each component."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "cross",
              summary = "Get the cross product with another vector.",
              description = "Sets this vector to be equal to the cross product between this vector and another one.  The new `v` will be perpendicular to both the old `v` and `u`.",
              key = "Vec3:cross",
              module = "lovr.math",
              notes = "The vectors are not normalized before or after computing the cross product.",
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The vector to compute the cross product with."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector, with the cross product as its values."
                    }
                  }
                }
              },
              related = {
                "Vec3:dot"
              }
            },
            {
              name = "distance",
              summary = "Get the distance to another vector.",
              description = "Returns the distance to another vector.",
              key = "Vec3:distance",
              module = "lovr.math",
              related = {
                "Vec3:length"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The vector to measure the distance to."
                    }
                  },
                  returns = {
                    {
                      name = "distance",
                      type = "number",
                      description = "The distance to `u`."
                    }
                  }
                }
              }
            },
            {
              name = "div",
              summary = "Divides the vector by a vector or a number.",
              description = "Divides the vector by a vector or a number.",
              key = "Vec3:div",
              module = "lovr.math",
              related = {
                "Vec3:add",
                "Vec3:sub",
                "Vec3:mul"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The other vector to divide the components by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The number to divide each component by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "dot",
              summary = "Get the dot product with another vector.",
              description = "Returns the dot product between this vector and another one.",
              key = "Vec3:dot",
              module = "lovr.math",
              notes = "This is computed as:\n\n    dot = v.x * u.x + v.y * u.y + v.z * u.z\n\nThe vectors are not normalized before computing the dot product.",
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The vector to compute the dot product with."
                    }
                  },
                  returns = {
                    {
                      name = "dot",
                      type = "number",
                      description = "The dot product between `v` and `u`."
                    }
                  }
                }
              },
              related = {
                "Vec3:cross"
              }
            },
            {
              name = "length",
              summary = "Get the length of the vector.",
              description = "Returns the length of the vector.",
              key = "Vec3:length",
              module = "lovr.math",
              notes = "The length is equivalent to this:\n\n    math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the vector."
                    }
                  }
                }
              },
              related = {
                "Vec3:normalize",
                "Vec3:distance"
              }
            },
            {
              name = "lerp",
              summary = "Moves this vector some amount towards another one.",
              description = "Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.",
              key = "Vec3:lerp",
              module = "lovr.math",
              related = {
                "Quat:slerp"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The vector to lerp towards."
                    },
                    {
                      name = "t",
                      type = "number",
                      description = "The lerping parameter."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector, containing the new lerped values."
                    }
                  }
                }
              }
            },
            {
              name = "mul",
              summary = "Multiply the vector by a vector or a number.",
              description = "Multiplies the vector by a vector or a number.",
              key = "Vec3:mul",
              module = "lovr.math",
              related = {
                "Vec3:add",
                "Vec3:sub",
                "Vec3:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The other vector to multiply the components by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The number to multiply each component by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "normalize",
              summary = "Normalize the length of the vector to 1.",
              description = "Adjusts the values in the vector so that its direction stays the same but its length becomes 1.",
              key = "Vec3:normalize",
              module = "lovr.math",
              related = {
                "Vec3:length"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "set",
              summary = "Set the components of the vector.",
              description = "Sets the components of the vector, either from numbers or an existing vector.",
              key = "Vec3:set",
              module = "lovr.math",
              related = {
                "Vec3:unpack"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The new x value of the vector.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The new y value of the vector.",
                      default = "x"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The new z value of the vector.",
                      default = "x"
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The input vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The vector to copy the values from."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The input vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "m",
                      type = "Mat4",
                      description = "The matrix to use the position of."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The input vector."
                    }
                  }
                }
              }
            },
            {
              name = "sub",
              summary = "Subtract a vector or a number from the vector.",
              description = "Subtracts a vector or a number from the vector.",
              key = "Vec3:sub",
              module = "lovr.math",
              related = {
                "Vec3:add",
                "Vec3:mul",
                "Vec3:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec3",
                      description = "The other vector."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "A number to subtract from each component."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec3",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "unpack",
              summary = "Get the components of the vector.",
              description = "Returns the 3 components of the vector as numbers.",
              key = "Vec3:unpack",
              module = "lovr.math",
              related = {
                "Vec3:set"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x value."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y value."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z value."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "Vec4",
          summary = "A 4D vector.",
          description = "A vector object that holds four numbers.",
          key = "Vec4",
          module = "lovr.math",
          constructors = {
            "lovr.math.newVec4",
            "lovr.math.vec4"
          },
          related = {
            "Vec2",
            "Vec3"
          },
          methods = {
            {
              name = "add",
              summary = "Add a vector or a number to the vector.",
              description = "Adds a vector or a number to the vector.",
              key = "Vec4:add",
              module = "lovr.math",
              related = {
                "Vec4:sub",
                "Vec4:mul",
                "Vec4:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The other vector."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "A number to add to each component."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "distance",
              summary = "Get the distance to another vector.",
              description = "Returns the distance to another vector.",
              key = "Vec4:distance",
              module = "lovr.math",
              related = {
                "Vec4:length"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The vector to measure the distance to."
                    }
                  },
                  returns = {
                    {
                      name = "distance",
                      type = "number",
                      description = "The distance to `u`."
                    }
                  }
                }
              }
            },
            {
              name = "div",
              summary = "Divides the vector by a vector or a number.",
              description = "Divides the vector by a vector or a number.",
              key = "Vec4:div",
              module = "lovr.math",
              related = {
                "Vec4:add",
                "Vec4:sub",
                "Vec4:mul"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The other vector to divide the components by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The number to divide each component by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "dot",
              summary = "Get the dot product with another vector.",
              description = "Returns the dot product between this vector and another one.",
              key = "Vec4:dot",
              module = "lovr.math",
              notes = "This is computed as:\n\n    dot = v.x * u.x + v.y * u.y + v.z * u.z + v.w * u.w\n\nThe vectors are not normalized before computing the dot product.",
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The vector to compute the dot product with."
                    }
                  },
                  returns = {
                    {
                      name = "dot",
                      type = "number",
                      description = "The dot product between `v` and `u`."
                    }
                  }
                }
              }
            },
            {
              name = "length",
              summary = "Get the length of the vector.",
              description = "Returns the length of the vector.",
              key = "Vec4:length",
              module = "lovr.math",
              notes = "The length is equivalent to this:\n\n    math.sqrt(v.x * v.x + v.y * v.y * v.z + v.z + v.w * v.w)",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "length",
                      type = "number",
                      description = "The length of the vector."
                    }
                  }
                }
              },
              related = {
                "Vec4:normalize",
                "Vec4:distance"
              }
            },
            {
              name = "lerp",
              summary = "Moves this vector some amount towards another one.",
              description = "Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.",
              key = "Vec4:lerp",
              module = "lovr.math",
              related = {
                "Quat:slerp"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The vector to lerp towards."
                    },
                    {
                      name = "t",
                      type = "number",
                      description = "The lerping parameter."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector, containing the new lerped values."
                    }
                  }
                }
              }
            },
            {
              name = "mul",
              summary = "Multiply the vector by a vector or a number.",
              description = "Multiplies the vector by a vector or a number.",
              key = "Vec4:mul",
              module = "lovr.math",
              related = {
                "Vec4:add",
                "Vec4:sub",
                "Vec4:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The other vector to multiply the components by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The number to multiply each component by."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "normalize",
              summary = "Normalize the length of the vector to 1.",
              description = "Adjusts the values in the vector so that its direction stays the same but its length becomes 1.",
              key = "Vec4:normalize",
              module = "lovr.math",
              related = {
                "Vec4:length"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "set",
              summary = "Set the components of the vector.",
              description = "Sets the components of the vector, either from numbers or an existing vector.",
              key = "Vec4:set",
              module = "lovr.math",
              related = {
                "Vec4:unpack"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "The new x value of the vector.",
                      default = "0"
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The new y value of the vector.",
                      default = "x"
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The new z value of the vector.",
                      default = "x"
                    },
                    {
                      name = "w",
                      type = "number",
                      description = "The new w value of the vector.",
                      default = "x"
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The input vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec4",
                      description = "The vector to copy the values from."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec4",
                      description = "The input vector."
                    }
                  }
                }
              }
            },
            {
              name = "sub",
              summary = "Subtract a vector or a number from the vector.",
              description = "Subtracts a vector or a number from the vector.",
              key = "Vec4:sub",
              module = "lovr.math",
              related = {
                "Vec2:add",
                "Vec2:mul",
                "Vec2:div"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "u",
                      type = "Vec2",
                      description = "The other vector."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "x",
                      type = "number",
                      description = "A number to subtract from each component."
                    }
                  },
                  returns = {
                    {
                      name = "v",
                      type = "Vec2",
                      description = "The original vector."
                    }
                  }
                }
              }
            },
            {
              name = "unpack",
              summary = "Get the components of the vector.",
              description = "Returns the 4 components of the vector as numbers.",
              key = "Vec4:unpack",
              module = "lovr.math",
              related = {
                "Vec4:set"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "x",
                      type = "number",
                      description = "The x value."
                    },
                    {
                      name = "y",
                      type = "number",
                      description = "The y value."
                    },
                    {
                      name = "z",
                      type = "number",
                      description = "The z value."
                    },
                    {
                      name = "w",
                      type = "number",
                      description = "The w value."
                    }
                  }
                }
              }
            }
          }
        },
        {
          name = "Vectors",
          summary = "What is your vector victor.",
          description = "LÖVR has math objects for vectors, matrices, and quaternions, collectively called \"vector objects\".  Vectors are useful because they can represent a multidimensional quantity (like a 3D position) using just a single value.",
          key = "Vectors",
          module = "lovr.math",
          constructors = {
            "lovr.math.vec2",
            "lovr.math.vec3",
            "lovr.math.vec4",
            "lovr.math.quat",
            "lovr.math.mat4",
            "lovr.math.newVec2",
            "lovr.math.newVec3",
            "lovr.math.newVec4",
            "lovr.math.newQuat",
            "lovr.math.newMat4"
          },
          notes = "Most LÖVR functions that accept positions, orientations, transforms, velocities, etc. also accept vector objects, so they can be used interchangeably with numbers:\n\n    function lovr.draw()\n      -- position and size are vec3's, rotation is a quat\n      lovr.graphics.box('fill', position, size, rotation)\n    end\n\n### Temporary vs. Permanent\n\nVectors can be created in two different ways: **permanent** and **temporary**.\n\n**Permanent** vectors behave like normal Lua values.  They are individual objects that are garbage collected when no longer needed.  They're created using the usual `lovr.math.new<Type>` syntax:\n\n    self.position = lovr.math.newVec3(x, y, z)\n\n**Temporary** vectors are created from a shared pool of vector objects.  This makes them faster because they use temporary memory and do not need to be garbage collected.  To make a temporary vector, leave off the `new` prefix:\n\n    local position = lovr.math.vec3(x, y, z)\n\nAs a further shorthand, these vector constructors are placed on the global scope.  If you prefer to keep the global scope clean, this can be configured using the `t.math.globals` flag in `lovr.conf`.\n\n    local position = vec3(x1, y1, z1) + vec3(x2, y2, z2)\n\nTemporary vectors, with all their speed, come with an important restriction: they can only be used during the frame in which they were created.  Saving them into variables and using them later on will throw an error:\n\n    local position = vec3(1, 2, 3)\n\n    function lovr.update(dt)\n      -- Reusing a temporary vector across frames will error:\n      position:add(vec3(dt))\n    end\n\nIt's possible to overflow the temporary vector pool.  If that happens, `lovr.math.drain` can be used to periodically drain the pool, invalidating any existing temporary vectors.\n\n### Metamethods\n\nVectors have metamethods, allowing them to be used using the normal math operators like `+`, `-`, `*`, `/`, etc.\n\n    print(vec3(2, 4, 6) * .5 + vec3(10, 20, 30))\n\nThese metamethods will create new temporary vectors.\n\n### Components and Swizzles\n\nThe raw components of a vector can be accessed like normal fields:\n\n    print(vec3(1, 2, 3).z) --> 3\n    print(mat4()[16]) --> 1\n\nAlso, multiple fields can be accessed and combined into a new (temporary) vector, called swizzling:\n\n    local position = vec3(10, 5, 1)\n    print(position.xy) --> vec2(10, 5)\n    print(position.xyy) --> vec3(10, 5, 5)\n    print(position.zyxz) --> vec4(1, 5, 10, 1)\n\nThe following fields are supported for vectors:\n\n- `x`, `y`, `z`, `w`\n- `r`, `g`, `b`, `a`\n- `s`, `t`, `p`, `q`\n\nQuaternions support `x`, `y`, `z`, and `w`.\n\nMatrices use numbers for accessing individual components in \"column-major\" order.\n\nAll fields can also be assigned to.\n\n    -- Swap the components of a 2D vector\n    v.xy = v.yx\n\nThe `unpack` function can be used (on any vector type) to access all of the individual components of a vector object.  For quaternions you can choose whether you want to unpack the angle/axis representation or the raw quaternion components.  Similarly, matrices support raw unpacking as well as decomposition into translation/scale/rotation values.",
          methods = {}
        }
      },
      functions = {
        {
          name = "drain",
          tag = "vectors",
          summary = "Drain the temporary vector pool.",
          description = "Drains the temporary vector pool, invalidating existing temporary vectors.\n\nThis is called automatically at the end of each frame.",
          key = "lovr.math.drain",
          module = "lovr.math",
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "gammaToLinear",
          tag = "mathOther",
          summary = "	Convert a color from gamma space to linear space.",
          description = "Converts a color from gamma space to linear space.",
          key = "lovr.math.gammaToLinear",
          module = "lovr.math",
          related = {
            "lovr.math.linearToGamma"
          },
          variants = {
            {
              arguments = {
                {
                  name = "gr",
                  type = "number",
                  description = "The red component of the gamma-space color."
                },
                {
                  name = "gg",
                  type = "number",
                  description = "The green component of the gamma-space color."
                },
                {
                  name = "gb",
                  type = "number",
                  description = "The blue component of the gamma-space color."
                }
              },
              returns = {
                {
                  name = "lr",
                  type = "number",
                  description = "The red component of the resulting linear-space color."
                },
                {
                  name = "lg",
                  type = "number",
                  description = "The green component of the resulting linear-space color."
                },
                {
                  name = "lb",
                  type = "number",
                  description = "The blue component of the resulting linear-space color."
                }
              }
            },
            {
              description = "A table can also be used.",
              arguments = {
                {
                  name = "color",
                  type = "table",
                  description = "A table containing the components of a gamma-space color."
                }
              },
              returns = {
                {
                  name = "lr",
                  type = "number",
                  description = "The red component of the resulting linear-space color."
                },
                {
                  name = "lg",
                  type = "number",
                  description = "The green component of the resulting linear-space color."
                },
                {
                  name = "lb",
                  type = "number",
                  description = "The blue component of the resulting linear-space color."
                }
              }
            },
            {
              description = "Convert a single color channel.",
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The color channel to convert."
                }
              },
              returns = {
                {
                  name = "y",
                  type = "number",
                  description = "The converted color channel."
                }
              }
            }
          }
        },
        {
          name = "getRandomSeed",
          tag = "random",
          summary = "Get the random seed.",
          description = "Get the seed used to initialize the random generator.",
          key = "lovr.math.getRandomSeed",
          module = "lovr.math",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "seed",
                  type = "number",
                  description = "The new seed."
                }
              }
            }
          }
        },
        {
          name = "linearToGamma",
          tag = "mathOther",
          summary = "	Convert a color from linear space to gamma space.",
          description = "Converts a color from linear space to gamma space.",
          key = "lovr.math.linearToGamma",
          module = "lovr.math",
          related = {
            "lovr.math.gammaToLinear"
          },
          variants = {
            {
              arguments = {
                {
                  name = "lr",
                  type = "number",
                  description = "The red component of the linear-space color."
                },
                {
                  name = "lg",
                  type = "number",
                  description = "The green component of the linear-space color."
                },
                {
                  name = "lb",
                  type = "number",
                  description = "The blue component of the linear-space color."
                }
              },
              returns = {
                {
                  name = "gr",
                  type = "number",
                  description = "The red component of the resulting gamma-space color."
                },
                {
                  name = "gg",
                  type = "number",
                  description = "The green component of the resulting gamma-space color."
                },
                {
                  name = "gb",
                  type = "number",
                  description = "The blue component of the resulting gamma-space color."
                }
              }
            },
            {
              description = "A table can also be used.",
              arguments = {
                {
                  name = "color",
                  type = "table",
                  description = "A table containing the components of a linear-space color."
                }
              },
              returns = {
                {
                  name = "gr",
                  type = "number",
                  description = "The red component of the resulting gamma-space color."
                },
                {
                  name = "gg",
                  type = "number",
                  description = "The green component of the resulting gamma-space color."
                },
                {
                  name = "gb",
                  type = "number",
                  description = "The blue component of the resulting gamma-space color."
                }
              }
            },
            {
              description = "Convert a single color channel.",
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The color channel to convert."
                }
              },
              returns = {
                {
                  name = "y",
                  type = "number",
                  description = "The converted color channel."
                }
              }
            }
          }
        },
        {
          name = "mat4",
          tag = "vectors",
          summary = "Create a temporary Mat4.",
          description = "Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.",
          key = "lovr.math.mat4",
          module = "lovr.math",
          related = {
            "lovr.math.newMat4",
            "Mat4"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "newCurve",
          tag = "mathOther",
          summary = "Create a new Curve.",
          description = "Creates a new `Curve` from a list of control points.",
          key = "lovr.math.newCurve",
          module = "lovr.math",
          variants = {
            {
              description = "Create a Curve from a set of initial control points.",
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the first control point."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the first control point."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the first control point."
                },
                {
                  name = "...",
                  type = "*",
                  description = "Additional control points."
                }
              },
              returns = {
                {
                  name = "curve",
                  type = "Curve",
                  description = "The new Curve."
                }
              }
            },
            {
              description = "Create a Curve from a (flat) table of points.",
              arguments = {
                {
                  name = "points",
                  type = "table",
                  description = "A table of points, as above."
                }
              },
              returns = {
                {
                  name = "curve",
                  type = "Curve",
                  description = "The new Curve."
                }
              }
            },
            {
              description = "Create an empty Curve, reserving space ahead of time for a certain number of control points.",
              arguments = {
                {
                  name = "n",
                  type = "number",
                  description = "The number of points to reserve for the Curve."
                }
              },
              returns = {
                {
                  name = "curve",
                  type = "Curve",
                  description = "The new Curve."
                }
              }
            }
          }
        },
        {
          name = "newMat4",
          tag = "vectors",
          summary = "Create a new Mat4.",
          description = "Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.",
          key = "lovr.math.newMat4",
          module = "lovr.math",
          related = {
            "lovr.math.mat4",
            "Mat4"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "newQuat",
          tag = "vectors",
          summary = "Create a new Quat.",
          description = "Creates a new quaternion.  This function takes the same arguments as `Quat:set`.",
          key = "lovr.math.newQuat",
          module = "lovr.math",
          related = {
            "lovr.math.quat",
            "Quat"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "newRandomGenerator",
          tag = "random",
          summary = "Create a new RandomGenerator.",
          description = "Creates a new `RandomGenerator`, which can be used to generate random numbers. If you just want some random numbers, you can use `lovr.math.random`. Individual RandomGenerator objects are useful if you need more control over the random sequence used or need a random generator isolated from other instances.",
          key = "lovr.math.newRandomGenerator",
          module = "lovr.math",
          variants = {
            {
              description = "Create a RandomGenerator with a default seed.",
              arguments = {},
              returns = {
                {
                  name = "randomGenerator",
                  type = "RandomGenerator",
                  description = "The new RandomGenerator."
                }
              }
            },
            {
              arguments = {
                {
                  name = "seed",
                  type = "number",
                  description = "The initial seed for the RandomGenerator."
                }
              },
              returns = {
                {
                  name = "randomGenerator",
                  type = "RandomGenerator",
                  description = "The new RandomGenerator."
                }
              }
            },
            {
              description = "This variant allows creation of random generators with precise 64-bit seed values, since Lua's number format loses precision with really big numbers.",
              arguments = {
                {
                  name = "low",
                  type = "number",
                  description = "The lower 32 bits of the seed."
                },
                {
                  name = "high",
                  type = "number",
                  description = "The upper 32 bits of the seed."
                }
              },
              returns = {
                {
                  name = "randomGenerator",
                  type = "RandomGenerator",
                  description = "The new RandomGenerator."
                }
              }
            }
          }
        },
        {
          name = "newVec2",
          tag = "vectors",
          summary = "Create a new Vec2.",
          description = "Creates a new 2D vector.  This function takes the same arguments as `Vec2:set`.",
          key = "lovr.math.newVec2",
          module = "lovr.math",
          related = {
            "lovr.math.vec2",
            "Vec2"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "newVec3",
          tag = "vectors",
          summary = "Create a new Vec3.",
          description = "Creates a new 3D vector.  This function takes the same arguments as `Vec3:set`.",
          key = "lovr.math.newVec3",
          module = "lovr.math",
          related = {
            "lovr.math.vec3",
            "Vec3"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "newVec4",
          tag = "vectors",
          summary = "Create a new Vec4.",
          description = "Creates a new 4D vector.  This function takes the same arguments as `Vec4:set`.",
          key = "lovr.math.newVec4",
          module = "lovr.math",
          related = {
            "lovr.math.vec4",
            "Vec4"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "noise",
          tag = "random",
          summary = "Generate perlin noise.",
          description = "Returns a 1D, 2D, 3D, or 4D perlin noise value.  The number will be between 0 and 1, and it will always be 0.5 when the inputs are integers.",
          key = "lovr.math.noise",
          module = "lovr.math",
          related = {
            "lovr.math.random"
          },
          variants = {
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the input."
                }
              },
              returns = {
                {
                  name = "noise",
                  type = "number",
                  description = "The noise value, between 0 and 1."
                }
              }
            },
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the input."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the input."
                }
              },
              returns = {
                {
                  name = "noise",
                  type = "number",
                  description = "The noise value, between 0 and 1."
                }
              }
            },
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the input."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the input."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the input."
                }
              },
              returns = {
                {
                  name = "noise",
                  type = "number",
                  description = "The noise value, between 0 and 1."
                }
              }
            },
            {
              arguments = {
                {
                  name = "x",
                  type = "number",
                  description = "The x coordinate of the input."
                },
                {
                  name = "y",
                  type = "number",
                  description = "The y coordinate of the input."
                },
                {
                  name = "z",
                  type = "number",
                  description = "The z coordinate of the input."
                },
                {
                  name = "w",
                  type = "number",
                  description = "The w coordinate of the input."
                }
              },
              returns = {
                {
                  name = "noise",
                  type = "number",
                  description = "The noise value, between 0 and 1."
                }
              }
            }
          }
        },
        {
          name = "quat",
          tag = "vectors",
          summary = "Create a temporary Quat.",
          description = "Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.",
          key = "lovr.math.quat",
          module = "lovr.math",
          related = {
            "lovr.math.newQuat",
            "Quat"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "random",
          tag = "random",
          summary = "Get a random number.",
          description = "Returns a uniformly distributed pseudo-random number.  This function has improved randomness over Lua's `math.random` and also guarantees that the sequence of random numbers will be the same on all platforms (given the same seed).",
          key = "lovr.math.random",
          module = "lovr.math",
          notes = "You can set the random seed using `lovr.math.setRandomSeed`.",
          related = {
            "lovr.math.randomNormal",
            "RandomGenerator",
            "lovr.math.noise"
          },
          variants = {
            {
              description = "Generate a pseudo-random floating point number in the range `[0,1)`",
              arguments = {},
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "A pseudo-random number."
                }
              }
            },
            {
              description = "Generate a pseudo-random integer in the range `[1,high]`",
              arguments = {
                {
                  name = "high",
                  type = "number",
                  description = "The maximum number to generate."
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "A pseudo-random number."
                }
              }
            },
            {
              description = "Generate a pseudo-random integer in the range `[low,high]`",
              arguments = {
                {
                  name = "low",
                  type = "number",
                  description = "The minimum number to generate."
                },
                {
                  name = "high",
                  type = "number",
                  description = "The maximum number to generate."
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "A pseudo-random number."
                }
              }
            }
          }
        },
        {
          name = "randomNormal",
          tag = "random",
          summary = "Get a random number from a normal distribution.",
          description = "Returns a pseudo-random number from a normal distribution (a bell curve).  You can control the center of the bell curve (the mean value) and the overall width (sigma, or standard deviation).",
          key = "lovr.math.randomNormal",
          module = "lovr.math",
          related = {
            "lovr.math.random",
            "RandomGenerator"
          },
          variants = {
            {
              arguments = {
                {
                  name = "sigma",
                  type = "number",
                  description = "The standard deviation of the distribution.  This can be thought of how \"wide\" the range of numbers is or how much variability there is.",
                  default = "1"
                },
                {
                  name = "mu",
                  type = "number",
                  description = "The average value returned.",
                  default = "0"
                }
              },
              returns = {
                {
                  name = "x",
                  type = "number",
                  description = "A normally distributed pseudo-random number."
                }
              }
            }
          }
        },
        {
          name = "setRandomSeed",
          tag = "random",
          summary = "Set the random seed.",
          description = "Seed the random generator with a new seed.  Each seed will cause `lovr.math.random` and `lovr.math.randomNormal` to produce a unique sequence of random numbers.  This is done once automatically at startup by `lovr.run`.",
          key = "lovr.math.setRandomSeed",
          module = "lovr.math",
          variants = {
            {
              arguments = {
                {
                  name = "seed",
                  type = "number",
                  description = "The new seed."
                }
              },
              returns = {}
            }
          }
        },
        {
          name = "vec2",
          tag = "vectors",
          summary = "Create a temporary Vec2.",
          description = "Creates a temporary 2D vector.  This function takes the same arguments as `Vec2:set`.",
          key = "lovr.math.vec2",
          module = "lovr.math",
          related = {
            "lovr.math.newVec2",
            "Vec2"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "vec3",
          tag = "vectors",
          summary = "Create a temporary Vec3.",
          description = "Creates a temporary 3D vector.  This function takes the same arguments as `Vec3:set`.",
          key = "lovr.math.vec3",
          module = "lovr.math",
          related = {
            "lovr.math.newVec3",
            "Vec3"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        },
        {
          name = "vec4",
          tag = "vectors",
          summary = "Create a temporary Vec4.",
          description = "Creates a temporary 4D vector.  This function takes the same arguments as `Vec4:set`.",
          key = "lovr.math.vec4",
          module = "lovr.math",
          related = {
            "lovr.math.newVec4",
            "Vec4"
          },
          variants = {
            {
              arguments = {},
              returns = {}
            }
          }
        }
      },
      enums = {},
      sections = {
        {
          name = "Randomization",
          tag = "random",
          description = "Functions for generating random numbers and noise."
        },
        {
          name = "Vectors",
          tag = "vectors",
          description = "A collection of vector objects.  Check out the `Vectors` guide for an introduction."
        },
        {
          name = "Other",
          tag = "mathOther",
          description = "Other miscellaneous math objects/helpers."
        }
      }
    },
    {
      name = "physics",
      tag = "modules",
      summary = "Simulates 3D physics.",
      description = "The `lovr.physics` module simulates 3D rigid body physics.",
      key = "lovr.physics",
      objects = {
        {
          name = "BallJoint",
          summary = "A ball and socket joint.",
          description = "A BallJoint is a type of `Joint` that acts like a ball and socket between two colliders.  It allows the colliders to rotate freely around an anchor point, but does not allow the colliders' distance from the anchor point to change.",
          key = "BallJoint",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newBallJoint"
          },
          related = {
            "Collider"
          },
          extends = "Joint",
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
              name = "getResponseTime",
              summary = "Get the response time of the joint.",
              description = "Returns the response time of the joint.  See `World:setResponseTime` for more info.",
              key = "BallJoint:getResponseTime",
              module = "lovr.physics",
              related = {
                "DistanceJoint:getResponseTime",
                "DistanceJoint:setResponseTime",
                "World:getResponseTime",
                "World:setResponseTime"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "responseTime",
                      type = "number",
                      description = "The response time setting for the joint."
                    }
                  }
                }
              }
            },
            {
              name = "getTightness",
              summary = "Get the joint tightness.",
              description = "Returns the tightness of the joint.  See `World:setTightness` for how this affects the joint.",
              key = "BallJoint:getTightness",
              module = "lovr.physics",
              related = {
                "DistanceJoint:getTightness",
                "DistanceJoint:setTightness",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "tightness",
                      type = "number",
                      description = "The tightness of the joint."
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
            },
            {
              name = "setResponseTime",
              summary = "Set the response time of the joint.",
              description = "Sets the response time of the joint.  See `World:setResponseTime` for more info.",
              key = "BallJoint:setResponseTime",
              module = "lovr.physics",
              related = {
                "DistanceJoint:getResponseTime",
                "DistanceJoint:setResponseTime",
                "World:getResponseTime",
                "World:setResponseTime"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "responseTime",
                      type = "number",
                      description = "The new response time setting for the joint."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setTightness",
              summary = "Set the joint tightness.",
              description = "Sets the tightness of the joint.  See `World:setTightness` for how this affects the joint.",
              key = "BallJoint:setTightness",
              module = "lovr.physics",
              related = {
                "DistanceJoint:getTightness",
                "DistanceJoint:setTightness",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "tightness",
                      type = "number",
                      description = "The tightness of the joint."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "BoxShape",
          summary = "A box Shape.",
          description = "A type of `Shape` that can be used for cubes or boxes.",
          key = "BoxShape",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newBoxShape",
            "World:newBoxCollider"
          },
          extends = "Shape",
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
          constructors = {
            "lovr.physics.newCapsuleShape",
            "World:newCapsuleCollider"
          },
          extends = "Shape",
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
          constructors = {
            "World:newCollider",
            "World:newBoxCollider",
            "World:newCapsuleCollider",
            "World:newCylinderCollider",
            "World:newSphereCollider"
          },
          methods = {
            {
              name = "addShape",
              summary = "Add a Shape to the Collider.",
              description = "Attaches a Shape to the collider.  Attached shapes will collide with other shapes in the world.",
              key = "Collider:addShape",
              module = "lovr.physics",
              related = {
                "Collider:removeShape",
                "Collider:getShapes",
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
              notes = "If the Collider is asleep, it will need to be woken up with `Collider:setAwake` for this function to have any affect.",
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
              },
              related = {
                "Collider:applyTorque"
              }
            },
            {
              name = "applyTorque",
              summary = "Apply torque to the Collider.",
              description = "Applies torque to the Collider.",
              key = "Collider:applyTorque",
              module = "lovr.physics",
              notes = "If the Collider is asleep, it will need to be woken up with `Collider:setAwake` for this function to have any affect.",
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
              },
              related = {
                "Collider:applyForce"
              }
            },
            {
              name = "destroy",
              summary = "Destroy the Collider.",
              description = "Destroy the Collider, removing it from the World.",
              key = "Collider:destroy",
              module = "lovr.physics",
              notes = "Calling functions on the collider after destroying it is a bad idea.",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              related = {
                "World:destroy",
                "Shape:destroy",
                "Joint:destroy"
              }
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
              description = "Returns the angular damping parameters of the Collider.  Angular damping makes things less \"spinny\", making them slow down their angular velocity over time.",
              key = "Collider:getAngularDamping",
              module = "lovr.physics",
              notes = "Angular damping can also be set on the World.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied."
                    }
                  }
                }
              },
              related = {
                "World:getAngularDamping",
                "World:setAngularDamping"
              }
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
              name = "getJoints",
              summary = "Get a list of Joints attached to the Collider.",
              description = "Returns a list of Joints attached to the Collider.",
              key = "Collider:getJoints",
              module = "lovr.physics",
              related = {
                "Joint"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "joints",
                      type = "table",
                      description = "A list of Joints attached to the Collider."
                    }
                  }
                }
              }
            },
            {
              name = "getLinearDamping",
              summary = "Get the linear damping of the Collider.",
              description = "Returns the Collider's linear damping parameters.  Linear damping is similar to drag or air resistance, slowing the Collider down over time.",
              key = "Collider:getLinearDamping",
              module = "lovr.physics",
              notes = "A linear damping of 0 means the Collider won't slow down over time.  This is the default.\n\nLinear damping can also be set on the World using `World:setLinearDamping`, which will affect all new colliders.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied."
                    }
                  }
                }
              },
              related = {
                "World:getLinearDamping",
                "World:setLinearDamping"
              }
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
                "Collider:setPosition",
                "Collider:getPose",
                "Collider:setPose"
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
              name = "getPose",
              summary = "Get the pose of the Collider.",
              description = "Returns the position and orientation of the Collider.",
              key = "Collider:getPose",
              module = "lovr.physics",
              related = {
                "Collider:getPosition",
                "Collider:getOrientation"
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
                    },
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
                "Collider:setOrientation",
                "Collider:getPose",
                "Collider:setPose"
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
              name = "getShapes",
              summary = "Get a list of Shapes attached to the Collider.",
              description = "Returns a list of Shapes attached to the Collider.",
              key = "Collider:getShapes",
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
              notes = "Collision between tags can be enabled and disabled using `World:enableCollisionBetween` and `World:disableCollisionBetween`.",
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
              related = {
                "World:disableCollisionBetween",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween",
                "lovr.physics.newWorld"
              }
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
              notes = "Colliders can only be in one World at a time.",
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
              related = {
                "World"
              }
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
              notes = "If sleeping is enabled, the simulation will put the Collider to sleep if it hasn't moved in a while. Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nIt is possible to set the default value for new colliders using `World:setSleepingAllowed`.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`.",
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
              related = {
                "World:isSleepingAllowed",
                "World:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              }
            },
            {
              name = "removeShape",
              summary = "Remove a Shape from the Collider.",
              description = "Removes a Shape from the Collider.",
              key = "Collider:removeShape",
              module = "lovr.physics",
              notes = "Colliders without any shapes won't collide with anything.",
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
              related = {
                "Collider:addShape",
                "Collider:getShapes",
                "Shape"
              }
            },
            {
              name = "setAngularDamping",
              summary = "Set the angular damping of the Collider.",
              description = "Sets the angular damping of the Collider.  Angular damping makes things less \"spinny\", causing them to slow down their angular velocity over time. Damping is only applied when angular velocity is over the threshold value.",
              key = "Collider:setAngularDamping",
              module = "lovr.physics",
              notes = "Angular damping can also be set on the World.",
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied.",
                      default = "0"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "World:getAngularDamping",
                "World:setAngularDamping"
              }
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
              description = "Sets the Collider's linear damping parameter.  Linear damping is similar to drag or air resistance, slowing the Collider down over time. Damping is only applied when linear velocity is over the threshold value.",
              key = "Collider:setLinearDamping",
              module = "lovr.physics",
              notes = "A linear damping of 0 means the Collider won't slow down over time.  This is the default.\n\nLinear damping can also be set on the World using `World:setLinearDamping`, which will affect all new colliders.",
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied.",
                      default = "0"
                    }
                  },
                  returns = {}
                }
              },
              related = {
                "World:getLinearDamping",
                "World:setLinearDamping"
              }
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
                "Collider:setPosition",
                "Collider:getPose",
                "Collider:setPose"
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
              name = "setPose",
              summary = "Set the pose of the Collider.",
              description = "Sets the position and orientation of the Collider.",
              key = "Collider:setPose",
              module = "lovr.physics",
              related = {
                "Collider:setPosition",
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
                    },
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
                "Collider:setOrientation",
                "Collider:getPose",
                "Collider:setPose"
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
              notes = "If sleeping is enabled, the simulation will put the Collider to sleep if it hasn't moved in a while. Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nIt is possible to set the default value for new colliders using `World:setSleepingAllowed`.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`.",
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
              related = {
                "World:isSleepingAllowed",
                "World:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              }
            },
            {
              name = "setTag",
              summary = "Set the Collider's tag.",
              description = "Sets the Collider's tag.",
              key = "Collider:setTag",
              module = "lovr.physics",
              notes = "Collision between tags can be enabled and disabled using `World:enableCollisionBetween` and `World:disableCollisionBetween`.",
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
              related = {
                "World:disableCollisionBetween",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween",
                "lovr.physics.newWorld"
              }
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
          }
        },
        {
          name = "CylinderShape",
          summary = "A cylinder Shape.",
          description = "A type of `Shape` that can be used for cylinder-shaped things.",
          key = "CylinderShape",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newCylinderShape",
            "World:newCylinderCollider"
          },
          extends = "Shape",
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
          constructors = {
            "lovr.physics.newDistanceJoint"
          },
          related = {
            "Collider"
          },
          extends = "Joint",
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
              name = "getResponseTime",
              summary = "Get the response time of the joint.",
              description = "Returns the response time of the joint.  See `World:setResponseTime` for more info.",
              key = "DistanceJoint:getResponseTime",
              module = "lovr.physics",
              related = {
                "BallJoint:getResponseTime",
                "BallJoint:setResponseTime",
                "World:getResponseTime",
                "World:setResponseTime"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "responseTime",
                      type = "number",
                      description = "The response time setting for the joint."
                    }
                  }
                }
              }
            },
            {
              name = "getTightness",
              summary = "Get the joint tightness.",
              description = "Returns the tightness of the joint.  See `World:setTightness` for how this affects the joint.",
              key = "DistanceJoint:getTightness",
              module = "lovr.physics",
              related = {
                "BallJoint:getTightness",
                "BallJoint:setTightness",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "tightness",
                      type = "number",
                      description = "The tightness of the joint."
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
            },
            {
              name = "setResponseTime",
              summary = "Set the response time of the joint.",
              description = "Sets the response time of the joint.  See `World:setResponseTime` for more info.",
              key = "DistanceJoint:setResponseTime",
              module = "lovr.physics",
              related = {
                "BallJoint:getResponseTime",
                "BallJoint:setResponseTime",
                "World:getResponseTime",
                "World:setResponseTime"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "responseTime",
                      type = "number",
                      description = "The new response time setting for the joint."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setTightness",
              summary = "Set the joint tightness.",
              description = "Sets the tightness of the joint.  See `World:setTightness` for how this affects the joint.",
              key = "DistanceJoint:setTightness",
              module = "lovr.physics",
              related = {
                "BallJoint:getTightness",
                "BallJoint:setTightness",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "tightness",
                      type = "number",
                      description = "The tightness of the joint."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "HingeJoint",
          summary = "A hinge joint.",
          description = "A HingeJoint is a type of `Joint` that only allows colliders to rotate on a single axis.",
          key = "HingeJoint",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newHingeJoint"
          },
          related = {
            "Collider"
          },
          extends = "Joint",
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
                      description = "The hinge angle, in radians."
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
                      description = "The lower limit, in radians."
                    },
                    {
                      name = "upper",
                      type = "number",
                      description = "The upper limit, in radians."
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
                      description = "The lower limit, in radians."
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
                      description = "The upper limit, in radians."
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
                      description = "The lower limit, in radians."
                    },
                    {
                      name = "upper",
                      type = "number",
                      description = "The upper limit, in radians."
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
                      description = "The lower limit, in radians."
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
                      description = "The upper limit, in radians."
                    }
                  },
                  returns = {}
                }
              }
            }
          }
        },
        {
          name = "Joint",
          summary = "Joins two Colliders together.",
          description = "A Joint is a physics object that constrains the movement of two Colliders.",
          key = "Joint",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newHingeJoint",
            "lovr.physics.newSliderJoint"
          },
          related = {
            "Collider"
          },
          methods = {
            {
              name = "destroy",
              summary = "Destroy the Joint.",
              description = "Destroy the Joint, removing it from Colliders it's attached to.",
              key = "Joint:destroy",
              module = "lovr.physics",
              notes = "Calling functions on the Joint after destroying it is a bad idea.",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              related = {
                "Collider:destroy",
                "Shape:destroy",
                "World:destroy"
              }
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
              name = "isEnabled",
              summary = "Check if the Joint is enabled.",
              description = "Returns whether the Joint is enabled.",
              key = "Joint:isEnabled",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether the Joint is enabled."
                    }
                  }
                }
              }
            },
            {
              name = "setEnabled",
              summary = "Enable or disable the Joint.",
              description = "Enable or disable the Joint.",
              key = "Joint:setEnabled",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "enabled",
                      type = "boolean",
                      description = "Whether the Joint should be enabled."
                    }
                  },
                  returns = {}
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
          }
        },
        {
          name = "Shape",
          summary = "Defines the shape of Colliders.",
          description = "A Shape is a physics object that can be attached to colliders to define their shape.",
          key = "Shape",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newBoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newCylinderShape",
            "lovr.physics.newSphereShape",
            "World:newBoxCollider",
            "World:newCapsuleCollider",
            "World:newCylinderCollider",
            "World:newSphereCollider"
          },
          methods = {
            {
              name = "destroy",
              summary = "Destroy the Shape.",
              description = "Destroy the Shape, removing it from Colliders it's attached to.",
              key = "Shape:destroy",
              module = "lovr.physics",
              notes = "Calling functions on the Shape after destroying it is a bad idea.",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              },
              related = {
                "Collider:destroy",
                "Joint:destroy",
                "World:destroy"
              }
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
              notes = "A Shape can only be attached to one Collider at a time.",
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
              related = {
                "Collider",
                "Collider:addShape",
                "Collider:removeShape"
              }
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
              name = "isSensor",
              summary = "Check if the Shape is a sensor.",
              description = "Returns whether the Shape is a sensor.  Sensors do not trigger any collision response, but they still report collisions in `World:collide`.",
              key = "Shape:isSensor",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "sensor",
                      type = "boolean",
                      description = "Whether the Shape is a sensor."
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
              notes = "If the Shape isn't attached to a Collider, this will error.",
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
              },
              related = {
                "Shape:getPosition",
                "Shape:setPosition"
              }
            },
            {
              name = "setPosition",
              summary = "Set the Shape's position.",
              description = "Set the position of the Shape relative to its Collider.",
              key = "Shape:setPosition",
              module = "lovr.physics",
              notes = "If the Shape isn't attached to a Collider, this will error.",
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
              },
              related = {
                "Shape:getOrientation",
                "Shape:setOrientation"
              }
            },
            {
              name = "setSensor",
              summary = "Set the sensor status for the Shape.",
              description = "Sets whether this Shape is a sensor.  Sensors do not trigger any collision response, but they still report collisions in `World:collide`.",
              key = "Shape:setSensor",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {
                    {
                      name = "sensor",
                      type = "boolean",
                      description = "Whether the Shape should be a sensor."
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
          }
        },
        {
          name = "SliderJoint",
          summary = "A slider joint.",
          description = "A SliderJoint is a type of `Joint` that only allows colliders to move on a single axis.",
          key = "SliderJoint",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newSliderJoint"
          },
          related = {
            "Collider"
          },
          extends = "Joint",
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
          }
        },
        {
          name = "SphereShape",
          summary = "A sphere Shape.",
          description = "A type of `Shape` that can be used for spheres.",
          key = "SphereShape",
          module = "lovr.physics",
          constructors = {
            "lovr.physics.newSphereShape",
            "World:newSphereCollider"
          },
          extends = "Shape",
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
          constructors = {
            "lovr.physics.newWorld"
          },
          notes = "Be sure to update the World in `lovr.update` using `World:update`, otherwise everything will stand still.",
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
          methods = {
            {
              name = "collide",
              tag = "worldCollision",
              summary = "Attempt to collide two shapes.",
              description = "Attempt to collide two shapes.  Internally this uses joints and forces to ensure the colliders attached to the shapes do not pass through each other.  Collisions can be customized using friction and restitution (bounciness) parameters, and default to using a mix of the colliders' friction and restitution parameters.  Usually this is called automatically by `World:update`.",
              key = "World:collide",
              module = "lovr.physics",
              notes = "For friction, numbers in the range of 0-1 are common, but larger numbers can also be used.\n\nFor restitution, numbers in the range 0-1 should be used.\n\nThis function respects collision tags, so using `World:disableCollisionBetween` and `World:enableCollisionBetween` will change the behavior of this function.",
              related = {
                "World:computeOverlaps",
                "World:overlaps",
                "World:disableCollisionBetween",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween"
              },
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
              }
            },
            {
              name = "computeOverlaps",
              tag = "worldCollision",
              summary = "Compute pairs of shapes that are close to each other.",
              description = "Detects which pairs of shapes in the world are near each other and could be colliding.  After calling this function, the `World:overlaps` iterator can be used to iterate over the overlaps, and `World:collide` can be used to resolve a collision for the shapes (if any). Usually this is called automatically by `World:update`.",
              key = "World:computeOverlaps",
              module = "lovr.physics",
              examples = {
                {
                  code = "world:computeOverlaps()\nfor shapeA, shapeB in world:overlaps() do\n  local areColliding = world:collide(shapeA, shapeB)\n  print(shapeA, shapeB, areColliding)\nend"
                }
              },
              related = {
                "World:overlaps",
                "World:collide",
                "World:update"
              },
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "destroy",
              tag = "worldBasics",
              summary = "Destroy the World!!  Muahaha!",
              description = "Destroy the World!",
              key = "World:destroy",
              module = "lovr.physics",
              notes = "Bad things will happen if you destroy the world and then try to access it or anything that was in it.",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "disableCollisionBetween",
              tag = "worldCollision",
              summary = "Disable collision between two tags.",
              description = "Disables collision between two collision tags.",
              key = "World:disableCollisionBetween",
              module = "lovr.physics",
              notes = "Tags must be set up when creating the World, see `lovr.physics.newWorld`.\n\nBy default, collision is enabled between all tags.",
              related = {
                "lovr.physics.newWorld",
                "World:enableCollisionBetween",
                "World:isCollisionEnabledBetween"
              },
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
              }
            },
            {
              name = "enableCollisionBetween",
              tag = "worldCollision",
              summary = "Enable collision between two tags.",
              description = "Enables collision between two collision tags.",
              key = "World:enableCollisionBetween",
              module = "lovr.physics",
              notes = "Tags must be set up when creating the World, see `lovr.physics.newWorld`.\n\nBy default, collision is enabled between all tags.",
              related = {
                "lovr.physics.newWorld",
                "World:disableCollisionBetween",
                "World:isCollisionEnabledBetween"
              },
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
              }
            },
            {
              name = "getAngularDamping",
              tag = "worldProperties",
              summary = "Get the angular damping of the World.",
              description = "Returns the angular damping parameters of the World.  Angular damping makes things less \"spinny\", making them slow down their angular velocity over time.",
              key = "World:getAngularDamping",
              module = "lovr.physics",
              notes = "Angular damping can also be set on individual colliders.",
              related = {
                "Collider:getAngularDamping",
                "Collider:setAngularDamping"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied."
                    }
                  }
                }
              }
            },
            {
              name = "getColliders",
              tag = "colliders",
              summary = "Get a table of all Colliders in the World.",
              description = "Returns a table of all Colliders in the World.",
              key = "World:getColliders",
              module = "lovr.physics",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "colliders",
                      type = "table",
                      description = "A table of `Collider` objects."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "t",
                      type = "table",
                      description = "A table to fill with Colliders and return."
                    }
                  },
                  returns = {
                    {
                      name = "colliders",
                      type = "table",
                      description = "A table of `Collider` objects."
                    }
                  }
                }
              }
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
              description = "Returns the linear damping parameters of the World.  Linear damping is similar to drag or air resistance, slowing down colliders over time as they move.",
              key = "World:getLinearDamping",
              module = "lovr.physics",
              notes = "A linear damping of 0 means colliders won't slow down over time.  This is the default.\n\nLinear damping can also be set on individual colliders.",
              related = {
                "Collider:getLinearDamping",
                "Collider:setLinearDamping"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied."
                    }
                  }
                }
              }
            },
            {
              name = "getResponseTime",
              tag = "worldProperties",
              summary = "Get the response time of the World.",
              description = "Returns the response time factor of the World.\n\nThe response time controls how relaxed collisions and joints are in the physics simulation, and functions similar to inertia.  A low response time means collisions are resolved quickly, and higher values make objects more spongy and soft.\n\nThe value can be any positive number.  It can be changed on a per-joint basis for `DistanceJoint` and `BallJoint` objects.",
              key = "World:getResponseTime",
              module = "lovr.physics",
              related = {
                "BallJoint:getResponseTime",
                "BallJoint:setResponseTime",
                "DistanceJoint:getResponseTime",
                "DistanceJoint:setResponseTime",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "responseTime",
                      type = "number",
                      description = "The response time setting for the World."
                    }
                  }
                }
              }
            },
            {
              name = "getTightness",
              summary = "Get the joint tightness.",
              description = "Returns the tightness of the joint.  See `World:setTightness` for how this affects the joint.",
              key = "World:getTightness",
              module = "lovr.physics",
              related = {
                "DistanceJoint:getTightness",
                "DistanceJoint:setTightness",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "tightness",
                      type = "number",
                      description = "The tightness of the joint."
                    }
                  }
                }
              }
            },
            {
              name = "isCollisionEnabledBetween",
              tag = "worldCollision",
              summary = "Check if two tags can collide.",
              description = "Returns whether collisions are currently enabled between two tags.",
              key = "World:isCollisionEnabledBetween",
              module = "lovr.physics",
              notes = "Tags must be set up when creating the World, see `lovr.physics.newWorld`.\n\nBy default, collision is enabled between all tags.",
              related = {
                "lovr.physics.newWorld",
                "World:disableCollisionBetween",
                "World:enableCollisionBetween"
              },
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
              }
            },
            {
              name = "isSleepingAllowed",
              tag = "worldProperties",
              summary = "Check if colliders can go to sleep.",
              description = "Returns whether colliders can go to sleep in the World.",
              key = "World:isSleepingAllowed",
              module = "lovr.physics",
              notes = "If sleeping is enabled, the World will try to detect colliders that haven't moved for a while and put them to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nThis can be set on individual colliders.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`.",
              related = {
                "Collider:isSleepingAllowed",
                "Collider:setSleepingAllowed",
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
                      description = "Whether colliders can sleep."
                    }
                  }
                }
              }
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
                "World:newMeshCollider",
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
                "World:newMeshCollider",
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
              related = {
                "World:newBoxCollider",
                "World:newCapsuleCollider",
                "World:newCylinderCollider",
                "World:newMeshCollider",
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
              notes = "This function creates a collider without any shapes attached to it, which means it won't collide with anything.  To add a shape to the collider, use `Collider:addShape`, or use one of the following functions to create the collider:\n\n- `World:newBoxCollider`\n- `World:newCapsuleCollider`\n- `World:newCylinderCollider`\n- `World:newSphereCollider`",
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
              }
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
                "World:newMeshCollider",
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
              name = "newMeshCollider",
              tag = "colliders",
              summary = "Add a Collider with a MeshShape to the World.",
              description = "Adds a new Collider to the World with a MeshShape already attached.",
              key = "World:newMeshCollider",
              module = "lovr.physics",
              related = {
                "Collider",
                "World:newCollider",
                "World:newBoxCollider",
                "World:newCapsuleCollider",
                "World:newCylinderCollider",
                "World:newSphereCollider",
                "Model:getTriangles"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "vertices",
                      type = "table",
                      description = "The table of vertices in the mesh.  Each vertex is a table with 3 numbers."
                    },
                    {
                      name = "indices",
                      type = "table",
                      description = "A table of triangle indices representing how the vertices are connected in the Mesh."
                    }
                  },
                  returns = {
                    {
                      name = "collider",
                      type = "Collider",
                      description = "The new Collider."
                    }
                  }
                },
                {
                  arguments = {
                    {
                      name = "model",
                      type = "Model",
                      description = "A Model to use for the mesh data.  Similar to calling `Model:getTriangles` and passing it to this function, but has better performance."
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
                "World:newCylinderCollider",
                "World:newMeshCollider"
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
              examples = {
                {
                  code = "world:computeOverlaps()\nfor shapeA, shapeB in world:overlaps() do\n  local areColliding = world:collide(shapeA, shapeB)\n  print(shapeA, shapeB, areColliding)\nend"
                }
              },
              related = {
                "World:computeOverlaps",
                "World:collide",
                "World:update"
              },
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
              }
            },
            {
              name = "raycast",
              tag = "worldBasics",
              summary = "Cast a ray through the World.",
              description = "Casts a ray through the World, calling a function every time the ray intersects with a Shape.",
              key = "World:raycast",
              module = "lovr.physics",
              notes = "The callback is passed the shape that was hit, the hit position (in world coordinates), and the normal vector of the hit.",
              examples = {
                {
                  code = "function lovr.load()\n  world = lovr.physics.newWorld()\n  world:newSphereCollider(0, 0, 0, 2)\n\n  -- Cast a ray through the sphere\n  local x1, y1, z1 = .5, 3, 0\n  local x2, y2, z2 = -.5, -2, 0\n  world:raycast(x1, y1, z1, x2, y2, z2, function(shape, x, y, z, nx, ny, nz)\n    print('Collision detected!', shape, x, y, z, nx, ny, nz)\n  end)\nend"
                }
              },
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
              }
            },
            {
              name = "setAngularDamping",
              tag = "worldProperties",
              summary = "Set the angular damping of the World.",
              description = "Sets the angular damping of the World.  Angular damping makes things less \"spinny\", making them slow down their angular velocity over time. Damping is only applied when angular velocity is over the threshold value.",
              key = "World:setAngularDamping",
              module = "lovr.physics",
              notes = "Angular damping can also be set on individual colliders.",
              related = {
                "Collider:getAngularDamping",
                "Collider:setAngularDamping"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The angular damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied.",
                      default = "0"
                    }
                  },
                  returns = {}
                }
              }
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
              description = "Sets the linear damping of the World.  Linear damping is similar to drag or air resistance, slowing down colliders over time as they move. Damping is only applied when linear velocity is over the threshold value.",
              key = "World:setLinearDamping",
              module = "lovr.physics",
              notes = "A linear damping of 0 means colliders won't slow down over time.  This is the default.\n\nLinear damping can also be set on individual colliders.",
              related = {
                "Collider:getLinearDamping",
                "Collider:setLinearDamping"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "damping",
                      type = "number",
                      description = "The linear damping."
                    },
                    {
                      name = "threshold",
                      type = "number",
                      description = "Velocity limit below which the damping is not applied.",
                      default = "0"
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setResponseTime",
              tag = "worldProperties",
              summary = "Set the response time of the World.",
              description = "Sets the response time factor of the World.\n\nThe response time controls how relaxed collisions and joints are in the physics simulation, and functions similar to inertia.  A low response time means collisions are resolved quickly, and higher values make objects more spongy and soft.\n\nThe value can be any positive number.  It can be changed on a per-joint basis for `DistanceJoint` and `BallJoint` objects.",
              key = "World:setResponseTime",
              module = "lovr.physics",
              related = {
                "BallJoint:getResponseTime",
                "BallJoint:setResponseTime",
                "DistanceJoint:getResponseTime",
                "DistanceJoint:setResponseTime",
                "World:getTightness",
                "World:setTightness"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "responseTime",
                      type = "number",
                      description = "The new response time setting for the World."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "setSleepingAllowed",
              tag = "worldProperties",
              summary = "Set whether colliders can go to sleep.",
              description = "Sets whether colliders can go to sleep in the World.",
              key = "World:setSleepingAllowed",
              module = "lovr.physics",
              notes = "If sleeping is enabled, the World will try to detect colliders that haven't moved for a while and put them to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.\n\nThis can be set on individual colliders.\n\nColliders can be manually put to sleep or woken up using `Collider:setAwake`.",
              related = {
                "Collider:isSleepingAllowed",
                "Collider:setSleepingAllowed",
                "Collider:isAwake",
                "Collider:setAwake"
              },
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
              }
            },
            {
              name = "setTightness",
              tag = "worldProperties",
              summary = "Set the tightness of joints in the World.",
              description = "Sets the tightness of joints in the World.\n\nThe tightness controls how much force is applied to colliders connected by joints.  With a value of 0, no force will be applied and joints won't have any effect.  With a tightness of 1, a strong force will be used to try to keep the Colliders constrained.  A tightness larger than 1 will overcorrect the joints, which can sometimes be desirable.  Negative tightness values are not supported.",
              key = "World:setTightness",
              module = "lovr.physics",
              related = {
                "BallJoint:getTightness",
                "BallJoint:setTightness",
                "DistanceJoint:getTightness",
                "DistanceJoint:setTightness",
                "World:getResponseTime",
                "World:setResponseTime"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "tightness",
                      type = "number",
                      description = "The new tightness for the World."
                    }
                  },
                  returns = {}
                }
              }
            },
            {
              name = "update",
              tag = "worldBasics",
              summary = "Update the World.",
              description = "Updates the World, advancing the physics simulation forward in time and resolving collisions between colliders in the World.",
              key = "World:update",
              module = "lovr.physics",
              notes = "It is common to pass the `dt` variable from `lovr.update` into this function.\n\nThe default collision resolver function is:\n\n    function defaultResolver(world)\n      world:computeOverlaps()\n      for shapeA, shapeB in world:overlaps() do\n        world:collide(shapeA, shapeB)\n      end\n    end\n\nAdditional logic could be introduced to the collision resolver function to add custom collision behavior or to change the collision parameters (like friction and restitution) on a per-collision basis.\n\n> If possible, use a fixed timestep value for updating the World. It will greatly improve the\n> accuracy of the simulation and reduce bugs. For more information on implementing a fixed\n> timestep loop, see [this article](http://gafferongames.com/game-physics/fix-your-timestep/).",
              related = {
                "World:computeOverlaps",
                "World:overlaps",
                "World:collide"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "dt",
                      type = "number",
                      description = "The amount of time to advance the simulation forward."
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
              }
            }
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
          notes = "A ball joint is like a ball and socket between the two colliders.  It tries to keep the distance between the colliders and the anchor position the same, but does not constrain the angle between them.",
          related = {
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newHingeJoint",
            "lovr.physics.newSliderJoint"
          },
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
          }
        },
        {
          name = "newBoxShape",
          tag = "shapes",
          summary = "Create a new BoxShape.",
          description = "Creates a new BoxShape.",
          key = "lovr.physics.newBoxShape",
          module = "lovr.physics",
          notes = "A Shape can be attached to a Collider using `Collider:addShape`.",
          related = {
            "BoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newCylinderShape",
            "lovr.physics.newSphereShape"
          },
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
          }
        },
        {
          name = "newCapsuleShape",
          tag = "shapes",
          summary = "Create a new CapsuleShape.",
          description = "Creates a new CapsuleShape.  Capsules are cylinders with hemispheres on each end.",
          key = "lovr.physics.newCapsuleShape",
          module = "lovr.physics",
          notes = "A Shape can be attached to a Collider using `Collider:addShape`.",
          related = {
            "CapsuleShape",
            "lovr.physics.newBoxShape",
            "lovr.physics.newCylinderShape",
            "lovr.physics.newSphereShape"
          },
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
          }
        },
        {
          name = "newCylinderShape",
          tag = "shapes",
          summary = "Create a new CylinderShape.",
          description = "Creates a new CylinderShape.",
          key = "lovr.physics.newCylinderShape",
          module = "lovr.physics",
          notes = "A Shape can be attached to a Collider using `Collider:addShape`.",
          related = {
            "CylinderShape",
            "lovr.physics.newBoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newSphereShape"
          },
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
          }
        },
        {
          name = "newDistanceJoint",
          tag = "joints",
          summary = "Create a new DistanceJoint.",
          description = "Creates a new DistanceJoint.",
          key = "lovr.physics.newDistanceJoint",
          module = "lovr.physics",
          notes = "A distance joint tries to keep the two colliders a fixed distance apart.  The distance is determined by the initial distance between the anchor points.  The joint allows for rotation on the anchor points.",
          related = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newHingeJoint",
            "lovr.physics.newSliderJoint"
          },
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
          }
        },
        {
          name = "newHingeJoint",
          tag = "joints",
          summary = "Create a new HingeJoint.",
          description = "Creates a new HingeJoint.",
          key = "lovr.physics.newHingeJoint",
          module = "lovr.physics",
          notes = "A hinge joint constrains two colliders to allow rotation only around the hinge's axis.",
          related = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newSliderJoint"
          },
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
          }
        },
        {
          name = "newSliderJoint",
          tag = "joints",
          summary = "Create a new SliderJoint.",
          description = "Creates a new SliderJoint.",
          key = "lovr.physics.newSliderJoint",
          module = "lovr.physics",
          notes = "A slider joint constrains two colliders to only allow movement along the slider's axis.",
          related = {
            "lovr.physics.newBallJoint",
            "lovr.physics.newDistanceJoint",
            "lovr.physics.newHingeJoint"
          },
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
          }
        },
        {
          name = "newSphereShape",
          tag = "shapes",
          summary = "Create a new SphereShape.",
          description = "Creates a new SphereShape.",
          key = "lovr.physics.newSphereShape",
          module = "lovr.physics",
          notes = "A Shape can be attached to a Collider using `Collider:addShape`.",
          related = {
            "SphereShape",
            "lovr.physics.newBoxShape",
            "lovr.physics.newCapsuleShape",
            "lovr.physics.newCylinderShape"
          },
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
          }
        },
        {
          name = "newWorld",
          tag = "world",
          summary = "Create a new World.",
          description = "Creates a new physics World, which tracks the overall physics simulation, holds collider objects, and resolves collisions between them.",
          key = "lovr.physics.newWorld",
          module = "lovr.physics",
          notes = "A World must be updated with `World:update` in `lovr.update` for the physics simulation to advance.",
          examples = {
            {
              description = "Create a new world, add a collider to it, and update it, printing out its position as it falls.",
              code = "function lovr.load()\n  world = lovr.physics.newWorld()\n  box = world:newBoxCollider()\nend\n\nfunction lovr.update(dt)\n  world:update(dt)\n  print(box:getPosition())\nend"
            }
          },
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
          }
        }
      },
      enums = {
        {
          name = "JointType",
          summary = "Types of physics joints.",
          description = "Represents the different types of physics Joints available.",
          key = "JointType",
          module = "lovr.physics",
          related = {
            "Joint",
            "BallJoint",
            "DistanceJoint",
            "HingeJoint",
            "SliderJoint"
          },
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
          }
        },
        {
          name = "ShapeType",
          summary = "Types of physics shapes.",
          description = "Represents the different types of physics Shapes available.",
          key = "ShapeType",
          module = "lovr.physics",
          related = {
            "Shape",
            "BoxShape",
            "CapsuleShape",
            "CylinderShape",
            "SphereShape"
          },
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
          }
        }
      },
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
      }
    },
    {
      name = "system",
      tag = "modules",
      summary = "Provides information about the current operating system and platform.",
      description = "The `lovr.system` provides information about the current operating system, and platform, and hardware.",
      key = "lovr.system",
      objects = {},
      functions = {
        {
          name = "getCoreCount",
          summary = "Get the number of logical cores.",
          description = "Returns the number of logical cores on the system.",
          key = "lovr.system.getCoreCount",
          module = "lovr.system",
          related = {
            "lovr.thread"
          },
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "cores",
                  type = "number",
                  description = "The number of logical cores on the system."
                }
              }
            }
          }
        },
        {
          name = "getOS",
          summary = "Get the current operating system.",
          description = "Returns the current operating system.",
          key = "lovr.system.getOS",
          module = "lovr.system",
          variants = {
            {
              arguments = {},
              returns = {
                {
                  name = "os",
                  type = "string",
                  description = "Either \"Windows\", \"macOS\", \"Linux\", \"Android\" or \"Web\"."
                }
              }
            }
          }
        },
        {
          name = "requestPermission",
          summary = "Request permission to use a feature.",
          description = "Requests permission to use a feature.  Usually this will pop up a dialog box that the user needs to confirm.  Once the permission request has been acknowledged, the `lovr.permission` callback will be called with the result.  Currently, this is only used for requesting microphone access on Android devices.",
          key = "lovr.system.requestPermission",
          module = "lovr.system",
          related = {
            "lovr.permission"
          },
          variants = {
            {
              arguments = {
                {
                  name = "permission",
                  type = "Permission",
                  description = "The permission to request."
                }
              },
              returns = {}
            }
          }
        }
      },
      enums = {
        {
          name = "Permission",
          summary = "Application permissions.",
          description = "These are the different permissions that need to be requested using `lovr.system.requestPermission` on some platforms.",
          key = "Permission",
          module = "lovr.system",
          related = {
            "lovr.system.requestPermission"
          },
          values = {
            {
              name = "audiocapture",
              description = "Requests microphone access."
            }
          }
        }
      }
    },
    {
      name = "thread",
      tag = "modules",
      summary = "Allows the creation of background threads.",
      description = "The `lovr.thread` module provides functions for creating threads and communicating between them.\n\nThese are operating system level threads, which are different from Lua coroutines.\n\nThreads are useful for performing expensive background computation without affecting the framerate or performance of the main thread.  Some examples of this include asset loading, networking and network requests, and physics simulation.\n\nThreads come with some caveats:\n\n- Threads run in a bare Lua environment.  The `lovr` module (and any of lovr's modules) need to\n  be required before they can be used.\n  - To get `require` to work properly, add `require 'lovr.filesystem'` to the thread code.\n- Threads are completely isolated from other threads.  They do not have access to the variables\n  or functions of other threads, and communication between threads must be coordinated through\n  `Channel` objects.\n- The graphics module (or any functions that perform rendering) cannot be used in a thread.\n  Note that this includes creating graphics objects like Models and Textures.  There are \"data\"\n  equivalent `ModelData` and `Image` objects that can be used in threads though.\n- `lovr.event.pump` cannot be called from a thread.\n- Crashes or problems can happen if two threads access the same object at the same time, so\n  special care must be taken to coordinate access to objects from multiple threads.",
      key = "lovr.thread",
      objects = {
        {
          name = "Channel",
          summary = "A message channel for communicating between threads.",
          description = "A Channel is an object used to communicate between `Thread` objects.  Channels are obtained by name using `lovr.thread.getChannel`.  Different threads can send messages on the same Channel to communicate with each other.  Messages can be sent and received on a Channel using `Channel:push` and `Channel:pop`, and are received in a first-in-first-out fashion. The following types of data can be passed through Channels: nil, boolean, number, string, and any LÖVR object.",
          key = "Channel",
          module = "lovr.thread",
          constructors = {
            "lovr.thread.getChannel"
          },
          methods = {
            {
              name = "clear",
              summary = "Clear all messages from the Channel.",
              description = "Removes all pending messages from the Channel.",
              key = "Channel:clear",
              module = "lovr.thread",
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            },
            {
              name = "hasRead",
              summary = "Get whether a message has been read.",
              description = "Returns whether or not the message with the given ID has been read.  Every call to `Channel:push` returns a message ID.",
              key = "Channel:hasRead",
              module = "lovr.thread",
              related = {
                "Channel:push"
              },
              variants = {
                {
                  arguments = {
                    {
                      name = "id",
                      type = "number",
                      description = "The ID of the message to check."
                    }
                  },
                  returns = {
                    {
                      name = "read",
                      type = "boolean",
                      description = "Whether the message has been read."
                    }
                  }
                }
              }
            },
            {
              name = "peek",
              summary = "Look at a message from the Channel without popping it.",
              description = "Returns a message from the Channel without popping it from the queue.  If the Channel is empty, `nil` is returned.  This can be useful to determine if the Channel is empty.",
              key = "Channel:peek",
              module = "lovr.thread",
              notes = "The second return value can be used to detect if a `nil` message is in the queue.",
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "message",
                      type = "*",
                      description = "The message, or `nil` if there is no message."
                    },
                    {
                      name = "present",
                      type = "boolean",
                      description = "Whether a message was returned (use to detect nil)."
                    }
                  }
                }
              },
              related = {
                "Channel:pop"
              }
            },
            {
              name = "pop",
              summary = "Pop a message from the Channel.",
              description = "Pops a message from the Channel.  If the Channel is empty, an optional timeout argument can be used to wait for a message, otherwise `nil` is returned.",
              key = "Channel:pop",
              module = "lovr.thread",
              notes = "Threads can get stuck forever waiting on Channel messages, so be careful.",
              variants = {
                {
                  arguments = {
                    {
                      name = "wait",
                      type = "number",
                      description = "How long to wait for a message to be popped, in seconds.  `true` can be used to wait forever and `false` can be used to avoid waiting.",
                      default = "false"
                    }
                  },
                  returns = {
                    {
                      name = "message",
                      type = "*",
                      description = "The received message, or `nil` if nothing was received."
                    }
                  }
                }
              },
              related = {
                "Channel:peek",
                "Channel:push"
              }
            },
            {
              name = "push",
              summary = "Push a message onto the Channel.",
              description = "Pushes a message onto the Channel.  The following types of data can be pushed: nil, boolean, number, string, and userdata.  Tables should be serialized to strings.",
              key = "Channel:push",
              module = "lovr.thread",
              notes = "Threads can get stuck forever waiting on Channel messages, so be careful.",
              variants = {
                {
                  arguments = {
                    {
                      name = "message",
                      type = "*",
                      description = "The message to push."
                    },
                    {
                      name = "wait",
                      type = "number",
                      description = "How long to wait for the message to be popped, in seconds.  `true` can be used to wait forever and `false` can be used to avoid waiting.",
                      default = "false"
                    }
                  },
                  returns = {
                    {
                      name = "id",
                      type = "number",
                      description = "The ID of the pushed message."
                    },
                    {
                      name = "read",
                      type = "boolean",
                      description = "Whether the message was read by another thread before the wait timeout."
                    }
                  }
                }
              },
              related = {
                "Channel:pop",
                "Channel:hasRead"
              }
            }
          }
        },
        {
          name = "Thread",
          summary = "A separate thread of execution that can run code in parallel with other threads.",
          description = "A Thread is an object that runs a chunk of Lua code in the background.  Threads are completely isolated from other threads, meaning they have their own Lua context and can't access the variables and functions of other threads.  Communication between threads is limited and is accomplished by using `Channel` objects.\n\nTo get `require` to work properly, add `require 'lovr.filesystem'` to the thread code.",
          key = "Thread",
          module = "lovr.thread",
          constructors = {
            "lovr.thread.newThread"
          },
          related = {
            "lovr.threaderror",
            "lovr.system.getCoreCount",
            "Channel"
          },
          methods = {
            {
              name = "getError",
              summary = "Get the Thread's error message.",
              description = "Returns the message for the error that occurred on the Thread, or nil if no error has occurred.",
              key = "Thread:getError",
              module = "lovr.thread",
              related = {
                "lovr.threaderror"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "error",
                      type = "string",
                      description = "The error message, or `nil` if no error has occurred on the Thread."
                    }
                  }
                }
              }
            },
            {
              name = "isRunning",
              summary = "Check if the Thread is running.",
              description = "Returns whether or not the Thread is currently running.",
              key = "Thread:isRunning",
              module = "lovr.thread",
              related = {
                "Thread:start"
              },
              variants = {
                {
                  arguments = {},
                  returns = {
                    {
                      name = "running",
                      type = "boolean",
                      description = "Whether or not the Thread is running."
                    }
                  }
                }
              }
            },
            {
              name = "start",
              summary = "Start the Thread.",
              description = "Starts the Thread.",
              key = "Thread:start",
              module = "lovr.thread",
              variants = {
                {
                  arguments = {
                    {
                      name = "...arguments",
                      type = "*",
                      description = "Up to 4 arguments to pass to the Thread's function."
                    }
                  },
                  returns = {}
                }
              },
              examples = {
                {
                  code = "function lovr.load()\n  lovr.thread.newThread([[\n    print(...)\n  ]]):start(lovr.getVersion())\nend"
                }
              }
            },
            {
              name = "wait",
              summary = "Wait for the Thread to complete.",
              description = "Waits for the Thread to complete, then returns.",
              key = "Thread:wait",
              module = "lovr.thread",
              related = {
                "Thread:isRunning"
              },
              variants = {
                {
                  arguments = {},
                  returns = {}
                }
              }
            }
          }
        }
      },
      functions = {
        {
          name = "getChannel",
          summary = "Get a Channel for communicating between threads.",
          description = "Returns a named Channel for communicating between threads.",
          key = "lovr.thread.getChannel",
          module = "lovr.thread",
          related = {
            "Channel"
          },
          variants = {
            {
              arguments = {
                {
                  name = "name",
                  type = "string",
                  description = "The name of the Channel to get."
                }
              },
              returns = {
                {
                  name = "channel",
                  type = "Channel",
                  description = "The Channel with the specified name."
                }
              }
            }
          }
        },
        {
          name = "newThread",
          summary = "Create a new Thread.",
          description = "Creates a new Thread from Lua code.",
          key = "lovr.thread.newThread",
          module = "lovr.thread",
          notes = "The Thread won\\'t start running immediately.  Use `Thread:start` to start it.\n\nThe string argument is assumed to be a filename if there isn't a newline in the first 1024 characters.  For really short thread code, an extra newline can be added to trick LÖVR into loading it properly.",
          variants = {
            {
              arguments = {
                {
                  name = "code",
                  type = "string",
                  description = "The code to run in the Thread."
                }
              },
              returns = {
                {
                  name = "thread",
                  type = "Thread",
                  description = "The new Thread."
                }
              }
            },
            {
              arguments = {
                {
                  name = "filename",
                  type = "string",
                  description = "A file containing code to run in the Thread."
                }
              },
              returns = {
                {
                  name = "thread",
                  type = "Thread",
                  description = "The new Thread."
                }
              }
            },
            {
              arguments = {
                {
                  name = "blob",
                  type = "Blob",
                  description = "The code to run in the Thread."
                }
              },
              returns = {
                {
                  name = "thread",
                  type = "Thread",
                  description = "The new Thread."
                }
              }
            }
          },
          related = {
            "Thread:start",
            "lovr.threaderror"
          }
        }
      },
      enums = {},
      related = {
        "lovr.system.getCoreCount"
      }
    },
    {
      name = "timer",
      tag = "modules",
      summary = "Exposes a high resolution timer.",
      description = "The `lovr.timer` module provides a few functions that deal with time.  All times are measured in seconds.",
      key = "lovr.timer",
      objects = {},
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
          notes = "The return value of this function will remain the same until `lovr.timer.step` is called.  This function should not be used to measure times for game behavior or benchmarking, use `lovr.timer.getTime` for that.",
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
          related = {
            "lovr.timer.getTime",
            "lovr.update"
          }
        },
        {
          name = "getFPS",
          summary = "Get the current frames per second.",
          description = "Returns the current frames per second, averaged over the last 90 frames.",
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
          related = {
            "lovr.headset.getTime"
          },
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
          description = "Steps the timer, returning the new delta time.  This is called automatically in `lovr.run` and it's used to calculate the new `dt` to pass to `lovr.update`.",
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
      enums = {}
    }
  },
  callbacks = {
    {
      name = "conf",
      tag = "callbacks",
      summary = "Called to read configuration settings at startup.",
      description = "The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special file that's loaded before the rest of the framework initializes.",
      key = "lovr.conf",
      module = "lovr",
      related = {
        "lovr.load"
      },
      examples = {
        {
          description = "A noop conf.lua that sets all configuration settings to their defaults:",
          code = "function lovr.conf(t)\n\n  -- Set the project version and identity\n  t.version = '0.15.0'\n  t.identity = 'default'\n\n  -- Set save directory precedence\n  t.saveprecedence = true\n\n  -- Enable or disable different modules\n  t.modules.audio = true\n  t.modules.data = true\n  t.modules.event = true\n  t.modules.graphics = true\n  t.modules.headset = true\n  t.modules.math = true\n  t.modules.physics = true\n  t.modules.system = true\n  t.modules.thread = true\n  t.modules.timer = true\n\n  -- Audio\n  t.audio.spatializer = nil\n  t.audio.start = true\n\n  -- Graphics\n  t.graphics.debug = false\n\n  -- Headset settings\n  t.headset.drivers = { 'openxr', 'oculus', 'vrapi', 'pico', 'openvr', 'webxr', 'desktop' }\n  t.headset.supersample = false\n  t.headset.offset = 1.7\n  t.headset.msaa = 4\n\n  -- Math settings\n  t.math.globals = true\n\n  -- Configure the desktop window\n  t.window.width = 1080\n  t.window.height = 600\n  t.window.fullscreen = false\n  t.window.msaa = 0\n  t.window.vsync = 1\n  t.window.title = 'LÖVR'\n  t.window.icon = nil\nend"
        }
      },
      notes = "Disabling the headset module can improve startup time a lot if you aren't intending to use `lovr.headset`.\n\nYou can set `t.window` to nil to avoid creating the window. You can do it yourself later by using `lovr.graphics.createWindow`.\n\nIf the `lovr.graphics` module is disabled or the window isn't created, attempting to use any functionality requiring graphics may cause a crash.\n\nEnabling the `t.graphics.debug` flag will add additional error checks and will send messages from the GPU driver to the `lovr.log` callback.  This will decrease performance but can help provide information on performance problems or other bugs.\n\nThe `headset.offset` field is a vertical offset applied to the scene for headsets that do not center their tracking origin on the floor.  This can be thought of as a \"default user height\". Setting this offset makes it easier to design experiences that work in both seated and standing VR configurations.",
      variants = {
        {
          arguments = {
            {
              name = "t",
              type = "table",
              description = "The table to edit the configuration settings on.",
              table = {
                {
                  name = "version",
                  type = "string",
                  description = "The version of LÖVR this project targets (not used yet)."
                },
                {
                  name = "identity",
                  type = "string",
                  description = "A unique label for this project."
                },
                {
                  name = "saveprecedence",
                  type = "boolean",
                  description = "Whether the files in the save directory should have precedence over files in the source archive."
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
                      name = "data",
                      type = "boolean",
                      description = "Whether the data module should be enabled."
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
                      name = "system",
                      type = "boolean",
                      description = "Whether the system module should be enabled."
                    },
                    {
                      name = "thread",
                      type = "boolean",
                      description = "Whether the thread module should be enabled."
                    },
                    {
                      name = "timer",
                      type = "boolean",
                      description = "Whether the timer module should be enabled."
                    }
                  }
                },
                {
                  name = "audio",
                  type = "table",
                  description = "Configuration for the audio module.",
                  table = {
                    {
                      name = "spatializer",
                      type = "string",
                      description = "An audio spatializer to use (`simple`, `oculus`, or `phonon`).  If `nil`, all of them are attempted."
                    },
                    {
                      name = "start",
                      type = "boolean",
                      description = "Whether the playback device should be automatically started."
                    }
                  }
                },
                {
                  name = "graphics",
                  type = "table",
                  description = "Configuration for the graphics module.",
                  table = {
                    {
                      name = "debug",
                      type = "boolean",
                      description = "Whether debug messages from the GPU should get sent to lovr.log."
                    }
                  }
                },
                {
                  name = "headset",
                  type = "table",
                  description = "Configuration for the headset.",
                  table = {
                    {
                      name = "drivers",
                      type = "table",
                      description = "An ordered list of preferred headset drivers."
                    },
                    {
                      name = "supersample",
                      type = "number",
                      description = "A scaling factor to apply to the headset texture.  Improves visual quality but reduces performance.  Can also be a boolean."
                    },
                    {
                      name = "offset",
                      type = "number",
                      description = "The vertical offset for seated experiences."
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The amount of antialiasing to use when rendering to the headset."
                    }
                  }
                },
                {
                  name = "math",
                  type = "table",
                  description = "Configuration for the math module.",
                  table = {
                    {
                      name = "globals",
                      type = "boolean",
                      description = "Whether vector object functions should be added to the global scope."
                    }
                  }
                },
                {
                  name = "window",
                  type = "table",
                  description = "Configuration for the window.",
                  table = {
                    {
                      name = "width",
                      type = "number",
                      description = "The width of the window."
                    },
                    {
                      name = "height",
                      type = "number",
                      description = "The height of the window."
                    },
                    {
                      name = "fullscreen",
                      type = "boolean",
                      description = "Whether the window is fullscreen."
                    },
                    {
                      name = "resizable",
                      type = "boolean",
                      description = "Whether the window is fullscreen."
                    },
                    {
                      name = "msaa",
                      type = "number",
                      description = "The number of antialiasing samples to use."
                    },
                    {
                      name = "title",
                      type = "string",
                      description = "The window title."
                    },
                    {
                      name = "icon",
                      type = "string",
                      description = "The path to the window icon file."
                    },
                    {
                      name = "vsync",
                      type = "number",
                      description = "0 to disable vsync, 1 to enable."
                    }
                  }
                }
              }
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
      description = "This callback is called every frame.  Use it to render the scene.  If a VR headset is connected, anything rendered by this function will appear in the headset display.  The display is cleared to the background color before this function is called.",
      key = "lovr.draw",
      module = "lovr",
      related = {
        "lovr.mirror",
        "lovr.headset.renderTo",
        "lovr.graphics.setBackgroundColor"
      },
      variants = {
        {
          arguments = {},
          returns = {}
        }
      }
    },
    {
      name = "errhand",
      tag = "callbacks",
      summary = "Called when an error occurs.",
      description = "The \"lovr.errhand\" callback is run whenever an error occurs.  It receives two parameters. The first is a string containing the error message. The second is either nil, or a string containing a traceback (as returned by \"debug.traceback()\"); if nil, this means \"lovr.errhand\" is being called in the stack where the error occurred, and it can call \"debug.traceback()\" itself.\n\n\"lovr.errhand\" should return a handler function to run in a loop to show the error screen. This handler function is of the same type as the one returned by \"lovr.run\" and has the same requirements (such as pumping events). If an error occurs while this handler is running, the program will terminate immediately-- \"lovr.errhand\" will not be given a second chance. Errors which occur inside \"lovr.errhand\" or in the handler it returns may not be cleanly reported, so be careful.\n\nA default error handler is supplied that renders the error message as text to the headset and to the window.",
      key = "lovr.errhand",
      module = "lovr",
      examples = {
        {
          code = "function lovr.errhand(message, traceback)\n  traceback = traceback or debug.traceback('', 3)\n  print('ohh NOOOO!', message)\n  print(traceback)\n  return function()\n    lovr.graphics.print('There was an error', 0, 2, -5)\n  end\nend"
        }
      },
      related = {
        "lovr.quit"
      },
      variants = {
        {
          arguments = {
            {
              name = "message",
              type = "string",
              description = "The error message."
            },
            {
              name = "traceback",
              type = "string",
              description = "A traceback string, or nil."
            }
          },
          returns = {
            {
              name = "handler",
              type = "function",
              description = "The error handler function.  It should return nil to continue running, \"restart\" to restart the app, or a number representing an exit status.",
              arguments = {},
              returns = {
                {
                  name = "result",
                  type = "*"
                }
              }
            }
          }
        }
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
      name = "keypressed",
      tag = "callbacks",
      summary = "Called when a key is pressed.",
      description = "This callback is called when a key is pressed.",
      key = "lovr.keypressed",
      module = "lovr",
      related = {
        "lovr.keyreleased",
        "lovr.textinput"
      },
      variants = {
        {
          arguments = {
            {
              name = "key",
              type = "KeyCode",
              description = "The key that was pressed."
            },
            {
              name = "scancode",
              type = "number",
              description = "The id of the key (ignores keyboard layout, may vary between keyboards)."
            },
            {
              name = "isrepeat",
              type = "boolean",
              description = "Whether the event is the result of a key repeat instead of an actual press."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "keyreleased",
      tag = "callbacks",
      summary = "Called when a key is released.",
      description = "This callback is called when a key is released.",
      key = "lovr.keyreleased",
      module = "lovr",
      related = {
        "lovr.keypressed",
        "lovr.textinput"
      },
      variants = {
        {
          arguments = {
            {
              name = "key",
              type = "KeyCode",
              description = "The key that was released."
            },
            {
              name = "scancode",
              type = "number",
              description = "The id of the key (ignores keyboard layout, may vary between keyboards)."
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
      related = {
        "lovr.quit"
      },
      examples = {
        {
          code = "function lovr.load(args)\n  model = lovr.graphics.newModel('cena.gltf')\n  texture = lovr.graphics.newTexture('cena.png')\n  levelGeometry = lovr.graphics.newMesh(1000)\n  effects = lovr.graphics.newShader('vert.glsl', 'frag.glsl')\n  loadLevel(1)\nend"
        }
      },
      notes = "If the project was loaded from a restart using `lovr.event.restart`, the return value from the previously-run `lovr.restart` callback will be made available to this callback as the `restart` key in the `args` table.\n\nThe `args` table follows the [Lua standard](https://en.wikibooks.org/wiki/Lua_Programming/command_line_parameter).  The arguments passed in from the shell are put into a global table named `arg` and passed to `lovr.load`, but with indices offset such that the \"script\" (the project path) is at index 0.  So all arguments (if any) intended for the project are at successive indices starting with 1, and the executable and its \"internal\" arguments are in normal order but stored in negative indices.",
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
      }
    },
    {
      name = "log",
      tag = "callbacks",
      summary = "Called when a message is logged.",
      description = "This callback is called when a message is logged.  The default implementation of this callback prints the message to the console using `print`, but it's possible to override this callback to render messages in VR, write them to a file, filter messages, and more.\n\nThe message can have a \"tag\" that is a short string representing the sender, and a \"level\" indicating how severe the message is.\n\nThe `t.graphics.debug` flag in `lovr.conf` can be used to get log messages from the GPU driver (tagged as `GL`).  It is also possible to emit your own log messages using `lovr.event.push`.",
      key = "lovr.log",
      module = "lovr",
      related = {
        "lovr.graphics.print"
      },
      variants = {
        {
          arguments = {
            {
              name = "message",
              type = "string",
              description = "The log message.  It may end in a newline."
            },
            {
              name = "level",
              type = "string",
              description = "The log level (`debug`, `info`, `warn`, or `error`)."
            },
            {
              name = "tag",
              type = "string",
              description = "The log tag."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "mirror",
      tag = "callbacks",
      summary = "Called to render content to the desktop window.",
      description = "This callback is called every frame after rendering to the headset and is usually used to render a mirror of the headset display onto the desktop window.  It can be overridden for custom mirroring behavior.  For example, you could render a single eye instead of a stereo view, apply postprocessing effects, add 2D UI, or render the scene from an entirely different viewpoint for a third person camera.",
      key = "lovr.mirror",
      module = "lovr",
      related = {
        "lovr.headset.renderTo",
        "lovr.headset.getMirrorTexture",
        "lovr.graphics.createWindow",
        "lovr.graphics.setProjection",
        "lovr.draw"
      },
      examples = {
        {
          description = "The default `lovr.mirror` implementation draws the headset mirror texture to the window if the headset is active, or just calls `lovr.draw` if there isn't a headset.",
          code = "function lovr.mirror()\n  if lovr.headset then\n    local texture = lovr.headset.getMirrorTexture()\n    if texture then\n      lovr.graphics.fill(texture)\n    end\n  else\n    lovr.graphics.clear()\n    lovr.draw()\n  end\nend"
        }
      },
      notes = "When this callback is called, the camera is located at `(0, 0, 0)` and is looking down the negative-z axis.\n\nNote that the usual graphics state applies while `lovr.mirror` is invoked, so you may need to reset graphics state at the end of `lovr.draw` to get the result you want.",
      variants = {
        {
          arguments = {},
          returns = {}
        }
      }
    },
    {
      name = "permission",
      tag = "callbacks",
      summary = "Called when a permission request is answered.",
      description = "This callback contains a permission response previously requested with `lovr.system.requestPermission`.  The callback contains information on whether permission was granted or denied.",
      key = "lovr.permission",
      module = "lovr",
      related = {
        "lovr.system.requestPermission"
      },
      variants = {
        {
          arguments = {
            {
              name = "permission",
              type = "Permission",
              description = "The type of permission."
            },
            {
              name = "granted",
              type = "boolean",
              description = "Whether permission was granted or denied."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "quit",
      tag = "callbacks",
      summary = "Called before quitting.",
      description = "This callback is called right before the application is about to quit.  Use it to perform any necessary cleanup work.  A truthy value can be returned from this callback to abort quitting.",
      key = "lovr.quit",
      module = "lovr",
      examples = {
        {
          code = "function lovr.quit()\n  if shouldQuit() then\n    return false\n  else\n    return true\n  end\nend"
        }
      },
      related = {
        "lovr.event.quit",
        "lovr.load"
      },
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
      }
    },
    {
      name = "resize",
      tag = "callbacks",
      summary = "Called when the window is resized.",
      description = "This callback is called when the desktop window is resized.",
      key = "lovr.resize",
      module = "lovr",
      related = {
        "lovr.graphics.getDimensions",
        "lovr.graphics.getWidth",
        "lovr.graphics.getHeight",
        "lovr.headset.getDisplayDimensions",
        "lovr.conf"
      },
      variants = {
        {
          arguments = {
            {
              name = "width",
              type = "number",
              description = "The new width of the window."
            },
            {
              name = "height",
              type = "number",
              description = "The new height of the window."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "restart",
      tag = "callbacks",
      summary = "Called when restarting.",
      description = "This callback is called when a restart from `lovr.event.restart` is happening.  A value can be returned to send it to the next LÖVR instance, available as the `restart` key in the argument table passed to `lovr.load`.  Object instances can not be used as the restart value, since they are destroyed as part of the cleanup process.",
      key = "lovr.restart",
      module = "lovr",
      related = {
        "lovr.event.restart",
        "lovr.load",
        "lovr.quit"
      },
      examples = {
        {
          code = "function lovr.restart()\n  return currentLevel:getName()\nend"
        }
      },
      notes = "Only nil, booleans, numbers, and strings are supported types for the return value.",
      variants = {
        {
          arguments = {},
          returns = {
            {
              name = "cookie",
              type = "*",
              description = "The value to send to the next `lovr.load`."
            }
          }
        }
      }
    },
    {
      name = "run",
      tag = "callbacks",
      summary = "The main entry point.",
      description = "This callback is the main entry point for a LÖVR program.  It is responsible for calling `lovr.load` and returning the main loop function.",
      key = "lovr.run",
      module = "lovr",
      examples = {
        {
          description = "The default `lovr.run`:",
          code = "function lovr.run()\n  lovr.timer.step()\n  if lovr.load then lovr.load() end\n  return function()\n    lovr.event.pump()\n    for name, a, b, c, d in lovr.event.poll() do\n      if name == 'quit' and (not lovr.quit or not lovr.quit()) then\n        return a or 0\n      end\n      if lovr.handlers[name] then lovr.handlers[name](a, b, c, d) end\n    end\n    local dt = lovr.timer.step()\n    if lovr.headset then\n      lovr.headset.update(dt)\n    end\n    if lovr.audio then\n      lovr.audio.update()\n      if lovr.headset then\n        lovr.audio.setOrientation(lovr.headset.getOrientation())\n        lovr.audio.setPosition(lovr.headset.getPosition())\n        lovr.audio.setVelocity(lovr.headset.getVelocity())\n      end\n    end\n    if lovr.update then lovr.update(dt) end\n    if lovr.graphics then\n      lovr.graphics.origin()\n      if lovr.draw then\n        if lovr.headset then\n          lovr.headset.renderTo(lovr.draw)\n        end\n        if lovr.graphics.hasWindow() then\n          lovr.mirror()\n        end\n      end\n      lovr.graphics.present()\n    end\n    lovr.math.drain()\n  end\nend"
        }
      },
      related = {
        "lovr.load",
        "lovr.quit"
      },
      variants = {
        {
          arguments = {},
          returns = {
            {
              name = "loop",
              type = "function",
              description = "The main loop function.  It should return nil to continue running, \"restart\" to restart the app, or a number representing an exit status.\n\nMost users should overload lovr.load, lovr.update and lovr.draw instead, since if a custom lovr.run does not do everything it is expected that some features may not work. For example, if lovr.run does not respond to \"quit\" events the program will not be able to quit, and if it does not call \"present\" then no graphics will be drawn.",
              arguments = {},
              returns = {
                {
                  name = "result",
                  type = "*"
                }
              }
            }
          }
        }
      }
    },
    {
      name = "textinput",
      tag = "callbacks",
      summary = "Called when text has been entered.",
      description = "This callback is called when text has been entered.\n\nFor example, when `shift + 1` is pressed on an American keyboard, `lovr.textinput` will be called with `!`.",
      key = "lovr.textinput",
      module = "lovr",
      notes = "Some characters in UTF-8 unicode take multiple bytes to encode.  Due to the way Lua works, the length of these strings will be bigger than 1 even though they are just a single character. `lovr.graphics.print` is compatible with UTF-8 but doing other string processing on these strings may require a library.  Lua 5.3+ has support for working with UTF-8 strings.",
      related = {
        "lovr.keypressed",
        "lovr.keyreleased"
      },
      variants = {
        {
          arguments = {
            {
              name = "text",
              type = "string",
              description = "The UTF-8 encoded character."
            },
            {
              name = "code",
              type = "number",
              description = "The integer codepoint of the character."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "threaderror",
      tag = "callbacks",
      summary = "Called when an error occurs in a thread.",
      description = "The `lovr.threaderror` callback is called whenever an error occurs in a Thread.  It receives the Thread object where the error occurred and an error message.\n\nThe default implementation of this callback will call `lovr.errhand` with the error.",
      key = "lovr.threaderror",
      module = "lovr",
      related = {
        "Thread",
        "Thread:getError",
        "lovr.errhand"
      },
      variants = {
        {
          arguments = {
            {
              name = "thread",
              type = "Thread",
              description = "The Thread that errored."
            },
            {
              name = "message",
              type = "string",
              description = "The error message."
            }
          },
          returns = {}
        }
      }
    },
    {
      name = "update",
      tag = "callbacks",
      summary = "Called every frame to update the application logic.",
      description = "The `lovr.update` callback should be used to update your game's logic.  It receives a single parameter, `dt`, which represents the amount of elapsed time between frames.  You can use this value to scale timers, physics, and animations in your game so they play at a smooth, consistent speed.",
      key = "lovr.update",
      module = "lovr",
      examples = {
        {
          code = "function lovr.update(dt)\n  ball.vy = ball.vy + ball.gravity * dt\n  ball.y = ball.y + ball.vy * dt\nend"
        }
      },
      related = {
        "lovr.timer.getDelta"
      },
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
      }
    }
  }
}