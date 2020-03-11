function lovr.load()
  lovr.graphics.setBackgroundColor(.2, 0, .4)

  models = {
    left = lovr.headset.newModel('hand/left'),
    right = lovr.headset.newModel('hand/right')
  }
end

function lovr.draw()
  for _, hand in ipairs({ 'left', 'right' }) do
    if models[hand] then
      local skeleton, scale = lovr.headset.getSkeleton(hand)

      if skeleton then
        for i, bone in ipairs(skeleton) do
          models[hand]:pose(i, unpack(bone))
        end

        models[hand]:draw(mat4(lovr.headset.getPose(hand)):scale(scale))
      end
    end
  end
end
