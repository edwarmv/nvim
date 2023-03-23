local utils = require("nvim-tree.utils")

function utils.focus_file(path)
  local matched = false
  local _, i = utils.find_node(require("nvim-tree.core").get_explorer().nodes, function(node)
    if node.absolute_path == path then
      matched = true
      return true
    else
      return false
    end
  end)

  if matched then
    require("nvim-tree.view").set_cursor({ i + 1, 1 })
  end

  -- vim.defer_fn(function()
  -- find_file.fn(path)
  -- end, 300)
end

