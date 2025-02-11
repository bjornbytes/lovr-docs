return {
  tag = 'headset-misc',
  summary = 'Get the supported headset features.',
  description = 'Returns a table of features that are supported by the current headset runtime.',
  arguments = {},
  returns = {
    features = {
      type = 'table',
      description = '',
      table = {
        {
          name = 'overlay',
          type = 'boolean',
          description = [[
            Whether LÖVR is able to run as an overlay on top of other VR applications.  When
            unsupported, the `t.headset.overlay` option in `lovr.conf` will be ignored.  Currently
            this will also be false if `t.headset.overlay` is false.
          ]]
        },
        {
          name = 'proximity',
          type = 'boolean',
          description = [[
            Whether the headset provides access to its proximity sensor.  When unsupported,
            `lovr.headset.isMounted` will always return true and `lovr.mount` will never be called.
          ]]
        },
        {
          name = 'passthrough',
          type = 'boolean',
          description = [[
            Whether the headset supports one of the non-opaque passthrough modes.  When unsupported,
            `lovr.headset.getPassthroughModes` will only return 'opaque'.
          ]]
        },
        {
          name = 'refreshRate',
          type = 'boolean',
          description = [[
            Whether the headset display supports querying and changing the refresh rate.  When
            unsupported, `lovr.headset.getRefreshRate` will always return nil and
            `lovr.headset.setRefreshRate` will always return false.
          ]]
        },
        {
          name = 'depthSubmission',
          type = 'boolean',
          description = 'Whether `t.headset.submitdepth` in `lovr.conf` is active and supported.'
        },
        {
          name = 'eyeTracking',
          type = 'boolean',
          description = [[
            Whether the headset supports eye gaze tracking.  When unsupported, the `eye/*` devices
            will always be untracked.
          ]]
        },
        {
          name = 'handTracking',
          type = 'boolean',
          description = [[
            Whether hand tracking is supported.  When false, `lovr.headset.getSkeleton` will always
            return nil.
          ]]
        },
        {
          name = 'handTrackingElbow',
          type = 'boolean',
          description = 'Whether the hand tracker is able to return data for the `elbow/*` devices.'
        },
        {
          name = 'keyboardTracking',
          type = 'boolean',
          description = 'Whether the system supports tracked keyboards for the `keyboard` device.'
        },
        {
          name = 'viveTrackers',
          type = 'boolean',
          description = 'Whether the system supports Vive trackers.'
        },
        {
          name = 'handModel',
          type = 'boolean',
          description = [[
            Whether `lovr.headset.newModel` is able to load models for the user\'s hands.
          ]]
        },
        {
          name = 'controllerModel',
          type = 'boolean',
          description = 'Whether `lovr.headset.newModel` supports loading controller models.'
        },
        {
          name = 'controllerSkeleton',
          type = 'boolean',
          description = [[
            Whether the `t.headset.controllerskeleton` option in `lovr.conf` is supported and
            whether the `controller` key in the `lovr.headset.getSkeleton` table is supported.  When
            this is false, it is not possible to determine whether hand tracking data is coming from
            the user's actual hands or if it's estimated from controller button inputs.
          ]]
        },
        {
          name = 'cubeBackground',
          type = 'boolean',
          description = 'Whether `lovr.headset.setBackground` supports cubemap textures.'
        },
        {
          name = 'equirectBackground',
          type = 'boolean',
          description = 'Whether `lovr.headset.setBackground` supports equirectangular textures.'
        },
        {
          name = 'layerColor',
          type = 'boolean',
          description = 'Whether `Layer:setColor` is supported.'
        },
        {
          name = 'layerCurve',
          type = 'boolean',
          description = 'Whether `Layer:setCurve` is supported.'
        },
        {
          name = 'layerDepthTest',
          type = 'boolean',
          description = [[
            Whether Layers are able to depth sort with the rest of the 3D scene, and with each
            other.  When unsupported, layers will always render on top of the 3D scene and any
            layers that come before them in the layer list.
          ]]
        },
        {
          name = 'layerFilter',
          type = 'boolean',
          description = 'Whether the `filter` option is supported for Layers.'
        }
      }
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'features' }
    }
  },
  related = {
    'lovr.headset.getName'
  }
}
