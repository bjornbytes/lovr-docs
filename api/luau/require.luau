return {
  transformSource = function(source, context)
    local root = lsp.workspace.getRootUri()
    local edits = {}

    local line = 1

    for text in source:gmatch('(.-)\n') do
      local first, last = text:find('require%(?[\'\"].-[\'\"]%)?')

      if first then
        local statement = text:sub(first, last)
        local module = statement:match('[\'\"](.-)[\'\"]')

        if module then
          local path = module:gsub('%.', '/')
          local absolutePath = root:joinPath(path).fsPath

          table.insert(edits, {
            startLine = line,
            startColumn = first,
            endLine = line,
            endColumn = last + 1,
            newText = string.format('require \'%s\'', absolutePath)
          })
        end
      end

      line = line + 1
    end

    return edits
  end
} :: PluginApi
