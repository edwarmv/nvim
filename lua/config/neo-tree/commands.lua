local inputs = require("neo-tree.ui.inputs")
local utils = require("neo-tree.utils")
local cmds = require("neo-tree.sources.filesystem.commands")

local M = {}

M.print_file_name = function(state)
  local node = state.tree:get_node()
  print(node.name)
end

M.system_open = function(state)
  local node = state.tree:get_node()
  local path = node:get_id()
  -- macOs: open file in default application in the background.
  -- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
  vim.api.nvim_command("silent !open " .. path)
  -- Linux: open file in default application
  -- vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
end

-- Trash the target
M.trash = function(state)
  local tree = state.tree
  local node = tree:get_node()
  if node.type == "message" then
    return
  end
  local _, name = utils.split_path(node.path)
  local msg = string.format("Are you sure you want to trash '%s'?", name)
  inputs.confirm(msg, function(confirmed)
    if not confirmed then
      return
    end
    vim.api.nvim_command("silent !trash -F " .. node.path)
    cmds.refresh(state)
  end)
end

-- Trash the selections (visual mode)
M.trash_visual = function(state, selected_nodes)
  local paths_to_trash = {}
  for _, node in ipairs(selected_nodes) do
    if node.type ~= "message" then
      table.insert(paths_to_trash, node.path)
    end
  end
  local msg = "Are you sure you want to trash " .. #paths_to_trash .. " items?"
  inputs.confirm(msg, function(confirmed)
    if not confirmed then
      return
    end
    for _, path in ipairs(paths_to_trash) do
      vim.api.nvim_command("silent !trash -F " .. path)
    end
    cmds.refresh(state)
  end)
end

return M
