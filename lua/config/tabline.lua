-- https://www.reddit.com/r/neovim/comments/v9211b/can_we_remove_the_x_on_the_right_side_of_the/
-- https://github.com/fitrh/init.nvim/blob/main/lua/config/option/tabline.lua
local M = {}

local function separator(sel)
  return table.concat({ sel and "%#TabLineSepSel#" or "%#TabLineSep#", "" })
end

local function title(tabpage, sel)
  local id = vim.api.nvim_tabpage_get_number(tabpage)
  local renamedTabName = vim.fn["TabooTabName"](id)
  if sel then
    return table.concat({ "%#TabLineSel#", (" %s"):format(renamedTabName == "" and id or id .. ": " .. renamedTabName) })
  end

  return table.concat({ "%#TabLine#", (" %s"):format(renamedTabName == "" and id or id .. ": " .. renamedTabName) })
end

function M.draw()
  local tabline = {}
  local api = vim.api
  local insert = table.insert

  for _, tabpage in ipairs(api.nvim_list_tabpages()) do
    local sel = tabpage == api.nvim_get_current_tabpage()

    local label = { ("%%%dT"):format(api.nvim_tabpage_get_number(tabpage)) }
    insert(label, separator(sel))
    insert(label, title(tabpage, sel))
    -- insert(label, "%=")
    insert(label, " %#TabLineFill#")

    insert(tabline, table.concat(label))
  end

  return table.concat(tabline)
end

return M
