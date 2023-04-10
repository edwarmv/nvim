-- require('config.neo-tree.custom.popups')
require('plugins.neo-tree.custom.help')

local highlights = require("neo-tree.ui.highlights")
local components = require("neo-tree.sources.common.components")

components.clipboard = function(config, node, state)
  local clipboard = state.clipboard or {}
  local clipboard_state = clipboard[node:get_id()]
  if not clipboard_state then
    return {}
  end
  return {
    text = clipboard_state.action == "copy" and " " or " ",
    highlight = config.highlight or highlights.DIM_TEXT,
  }
end

-- components.modified = function(config, node, state)
--   local modified_buffers = state.modified_buffers or {}
--
--   if modified_buffers[node.path] then
--     return {
--       text = config.symbol .. " ",
--       highlight = config.highlight or highlights.MODIFIED,
--     }
--   else
--     return {}
--   end
-- end

components.bufnr = function(config, node, state)
  local highlight = config.highlight or highlights.BUFFER_NUMBER
  local bufnr = node.extra and node.extra.bufnr
  if not bufnr then
    return {}
  end
  return {
    text = string.format(" #%s", bufnr) .. " ",
    highlight = highlight,
  }
end
