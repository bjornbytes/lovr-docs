-- Measures amplitude of microphone over time and uses it to scale a circle

amplitude = 0

function lovr.load()
  name = lovr.audio.getMicrophoneNames()[1]
  assert(name, 'No microphone found!')
  microphone = lovr.audio.newMicrophone(name)
  microphone:startRecording()
  print('Recording from ' .. name)
end

function lovr.update(dt)
  if microphone:isRecording() then
    local soundData = microphone:getData()

    if soundData then
      local samples = soundData:getSampleCount()
      local totalAmplitude = 0

      for i = 0, samples - 1 do
        totalAmplitude = totalAmplitude + math.abs(soundData:getSample(i))
      end

      amplitude = amplitude + (totalAmplitude / samples - amplitude) * (1 - .05 ^ dt)
    end
  end
end

function lovr.draw()
  lovr.graphics.setColor(1, 1, 1, .5)
  lovr.graphics.circle('line', 0, 1.7, -1, amplitude * 20 + .01)
end
