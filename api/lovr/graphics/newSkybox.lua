return {
  tag = 'graphicsObjects',
  summary = 'Create a new Skybox.',
  description = 'Creates a new Skybox from a set of 6 images.',
  arguments = {
    right = {
      type = 'string',
      description = 'The filename of the image for the right face of the skybox.'
    },
    left = {
      type = 'string',
      description = 'The filename of the image for the left face of the skybox.'
    },
    top = {
      type = 'string',
      description = 'The filename of the image for the top face of the skybox.'
    },
    bottom = {
      type = 'string',
      description = 'The filename of the image for the bottom face of the skybox.'
    },
    back = {
      type = 'string',
      description = 'The filename of the image for the back face of the skybox.'
    },
    front = {
      type = 'string',
      description = 'The filename of the image for the front face of the skybox.'
    },
    images = {
      type = 'table',
      description = 'A table containing 6 images, as described above.'
    }
  },
  returns = {
    skybox = {
      type = 'Skybox',
      description = 'The new Skybox.'
    }
  },
  variants = {
    {
      arguments = { 'right', 'left', 'top', 'bottom', 'back', 'front' },
      returns = { 'skybox' }
    },
    {
      arguments = { 'images' },
      returns = { 'skybox' }
    }
  }
}
