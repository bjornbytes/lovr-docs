return {
  summary = 'An object that loads and stores data for 3D models.',
  description = [[
    A ModelData is a container object that loads and holds data contained in 3D model files.  This
    can include a variety of things like the node structure of the asset, the vertex data it
    contains, contains, the `Image` and `Material` properties, and any included animations.

    The current supported formats are OBJ, glTF, and STL.

    Usually you can just load a `Model` directly, but using a `ModelData` can be helpful if you want
    to load models in a thread or access more low-level information about the Model.
  ]],
  extends = 'Object',
  constructor = 'lovr.data.newModelData',
  sections = {
    {
      name = 'Nodes',
      links = {
        'ModelData:getNodeCount',
        'ModelData:getNodeName',
        'ModelData:getRootNode',
        'ModelData:getNodeParent',
        'ModelData:getNodeChild',
        'ModelData:getNodeSibling',
        'ModelData:getNodeMesh',
        'ModelData:getNodeSkin',
        'ModelData:getNodePosition',
        'ModelData:getNodeOrientation',
        'ModelData:getNodeScale',
        'ModelData:getNodePose',
        'ModelData:getNodeTransform'
      }
    },
    {
      name = 'Meshes',
      links = {
        'ModelData:getMeshCount',
        'ModelData:getMeshVertexCount',
        'ModelData:getMeshIndexCount',
        'ModelData:getMeshVertex',
        'ModelData:getMeshIndex',
        'ModelData:getMeshPartCount',
        'ModelData:getMeshDrawMode',
        'ModelData:getMeshDrawRange',
        'ModelData:getMeshMaterial',
        'ModelData:getMeshBlendShapeCount',
        'ModelData:getMeshBlendShapeName',
        'ModelData:getMeshBlendVertex'
      }
    },
    {
      name = 'Materials',
      links = {
        'ModelData:getImageCount',
        'ModelData:getImage',
        'ModelData:getMaterialCount',
        'ModelData:getMaterialName',
        'ModelData:getMaterial'
      }
    },
    {
      name = 'Bounds',
      links = {
        'ModelData:getWidth',
        'ModelData:getHeight',
        'ModelData:getDepth',
        'ModelData:getDimensions',
        'ModelData:getCenter',
        'ModelData:getBoundingBox'
      }
    },
    {
      name = 'Animations',
      links = {
        'ModelData:getAnimationCount',
        'ModelData:getAnimationName',
        'ModelData:getAnimationDuration',
        'ModelData:getAnimationChannelCount',
        'ModelData:getAnimationNode',
        'ModelData:getAnimationProperty',
        'ModelData:getAnimationSmoothMode',
        'ModelData:getAnimationKeyframeCount',
        'ModelData:getAnimationKeyframe',
        'ModelData:getBlendShapeCount',
        'ModelData:getBlendShapeName',
        'ModelData:getSkinCount',
        'ModelData:getSkinInverseBindMatrix',
        'ModelData:getSkinJoints'
      }
    },
    {
      name = 'Miscellaneous',
      links = {
        'ModelData:getMetadata'
      }
    }
  }
}
