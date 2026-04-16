return {
  summary = 'A 3D model.',
  description = [[
    Models are 3D model assets loaded from files.  Currently, OBJ, glTF, and binary STL files are
    supported.

    A model can be drawn using `Pass:draw`.  A specific mesh or part of a mesh can be drawn using
    `Pass:drawPart`.

    The raw CPU data for a model is held in a `ModelData` object.

    Models have a hierarchy of nodes which can have their transforms modified.  Meshes are attached
    to these nodes.  The same mesh can be attached to multiple nodes, allowing it to be drawn
    multiple times while only storing a single copy of its data.

    Models can have animations.  Animations have keyframes which affect the transforms of nodes.
    Right now each model can only be drawn with a single animated pose per frame.

    Models can have materials, which are collections of properties and textures that define how its
    surface is affected by lighting.  Meshes are split up into multiple parts, and each part can
    have its own material.
  ]],
  extends = 'Object',
  constructors = {
    'lovr.graphics.newModel',
    'lovr.headset.newModel',
    'Model:clone'
  },
  sections = {
    {
      name = 'Nodes',
      links = {
        'Model:getRootNode',
        'Model:getNodeCount',
        'Model:getNodeName',
        'Model:getNodeChild',
        'Model:getNodeChildren',
        'Model:getNodeSibling',
        'Model:getNodeParent',
        'Model:getNodeMesh',
        'Model:isNodeVisible',
        'Model:setNodeVisible',
        'Model:getNodePosition',
        'Model:setNodePosition',
        'Model:getNodeOrientation',
        'Model:setNodeOrientation',
        'Model:getNodeScale',
        'Model:setNodeScale',
        'Model:getNodePose',
        'Model:setNodePose',
        'Model:getNodeTransform',
        'Model:setNodeTransform',
        'Model:resetNodeTransforms'
      }
    },
    {
      name = 'Animation',
      links = {
        'Model:getAnimationCount',
        'Model:getAnimationName',
        'Model:getAnimationDuration',
        'Model:hasJoints',
        'Model:animate'
      }
    },
    {
      name = 'Blend Shapes',
      links = {
        'Model:resetBlendShapes',
        'Model:getBlendShapeWeight',
        'Model:setBlendShapeWeight',
        'Model:getBlendShapeCount',
        'Model:getBlendShapeName',
        'Model:getMeshBlendShapeCount',
        'Model:getMeshBlendShapeName'
      }
    },
    {
      name = 'Bounds',
      links = {
        'Model:getWidth',
        'Model:getHeight',
        'Model:getDepth',
        'Model:getDimensions',
        'Model:getCenter',
        'Model:getBoundingBox'
      }
    },
    {
      name = 'Meshes',
      links = {
        'Model:meshes',
        'Model:getMeshCount',
        'Model:getMeshVertexCount',
        'Model:getMeshIndexCount',
        'Model:getMeshPartCount',
        'Model:getMeshDrawMode',
        'Model:getMeshDrawRange',
        'Model:getMeshMaterial'
      }
    },
    {
      name = 'Textures',
      links = {
        'Model:getTextureCount',
        'Model:getTexture',
        'Model:getMaterialCount',
        'Model:getMaterialName',
        'Model:getMaterial'
      }
    },
    {
      name = 'Miscellaneous',
      links = {
        'Model:clone',
        'Model:buildRaytracer',
        'Model:getMetadata',
        'Model:getVertexBuffer',
        'Model:getIndexBuffer',
        'Model:getMesh'
      }
    }
  }
}
