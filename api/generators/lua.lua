local serpent = require 'serpent'

return function(api)
  local file = io.open(lovr.filesystem.getSource() .. '/init.lua', 'w')
  assert(file, 'Could not open init.lua for writing')

  local keyPriority = {
    name = 1,
    tag = 2,
    summary = 3,
    type = 4,
    description = 5,
    key = 6,
    module = 7,
    arguments = 8,
    returns = 9
  }

  local function sort(keys, t)
    table.sort(keys, function(lhs, rhs)
      local leftPrio = keyPriority[lhs]
      local rightPrio = keyPriority[rhs]
      if leftPrio and rightPrio then
        return leftPrio < rightPrio
      elseif leftPrio or rightPrio then
        return leftPrio ~= nil
      else
        return lhs < rhs
      end
    end)
  end

  local contents = 'return ' .. serpent.block(api, { comment = false, sortkeys = sort })
  file:write(contents)
  file:close()
end
