-- load constants from file
local knuckles = require 'knuckles'

function setPoses(model, hand)
  -- get hand pose skeleton from controller
  pose_skeleton = lovr.headset.getSkeleton(hand)

  -- check controller exists
  if not (pose_skeleton == nil) then
    -- go through the 28 bones in the vr_glove model
    for i=1,28 do
      -- get the name of the node from the model
      node_name = model:getNodeName(i)
      -- get table with name-to-skeleton-index values
      hand_table = knuckles.hand_to_index[hand]
      -- get skeleton index value from table
      skeleton_index = hand_table[node_name]
      -- get pose of respective node in skeleton
      pose = pose_skeleton[skeleton_index]

      -- check if the pose has been instantiated yet
      if not (pose == nil) then
        -- set pose of model bone from controller skeleton
        model:pose(node_name, unpack(pose))
      end
    end
  end
end

function lovr.load()
  -- set grey background so we can see the gloves well
  lovr.graphics.setBackgroundColor(.5, .5, .5)
  
  -- make a new shader with animated set true so we can see the moving model
  shader = lovr.graphics.newShader('unlit', { flags = { animated = true } })

  -- path for SteamVR resources and vr_glove models
  local vr_glove_path = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\SteamVR\\resources\\rendermodels\\vr_glove\\"
  local right_model_file = vr_glove_path .. "vr_glove_right_model.glb"
  local left_model_file = vr_glove_path .. "vr_glove_left_model.glb"

  -- load right vr_glove model data
  local f = assert(io.open(right_model_file, "rb"))
  local right_model_data = f:read("*all")
  f:close()

  -- load left vr_glove model data
  local f = assert(io.open(left_model_file, "rb"))
  local left_model_data = f:read("*all")
  f:close()

  -- convert model data to blobs so we can pass it to newModel
  local right_blob = lovr.data.newBlob(right_model_data, "right_blob")
  local left_blob = lovr.data.newBlob(left_model_data, "left_blob")

  -- create model objects to use
  right_hand_model = lovr.graphics.newModel(right_blob)
  left_hand_model = lovr.graphics.newModel(left_blob)
end

function lovr.draw()
  -- set skin node poses in model
  setPoses(right_hand_model, 'right')
  setPoses(left_hand_model, 'left')

  -- use out animated shader
  lovr.graphics.setShader(shader)

  -- draw right glove at controller position
  x, y, z, ang, ax, ay, az = lovr.headset.getPose('right')
  right_hand_model:draw(x, y, z, 1, ang, ax, ay, az)

  -- draw left glove at controller position
  x, y, z, ang, ax, ay, az = lovr.headset.getPose('left')
  left_hand_model:draw(x, y, z, 1, ang, ax, ay, az)

  -- clear shader
  lovr.graphics.setShader()
end