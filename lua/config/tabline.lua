-- https://www.reddit.com/r/neovim/comments/v9211b/can_we_remove_the_x_on_the_right_side_of_the/
-- https://github.com/fitrh/init.nvim/blob/main/lua/config/option/tabline.lua
local M = {}

local function separator(sel)
  return table.concat({ sel and "%#TabLineSepSel#" or "%#TabLineSep#", "" })
end

-- Helper that returns the buffer number of the *active* window in a tab page.
local function active_buf_in_tab(tabpage)
  -- The active window is the one that `:tabnext` would switch to.
  local win = vim.api.nvim_tabpage_get_win(tabpage)

  -- Get the buffer number of that window.
  local buf = vim.api.nvim_win_get_buf(win)

  -- Retrieve the full path of the buffer and return only the file name.
  local full_path = vim.api.nvim_buf_get_name(buf)
  local file_name = vim.fn.fnamemodify(full_path, ":t")

  return file_name ~= "" and file_name or "No Name"
end

local function title(tabpage, sel)
  local id = vim.api.nvim_tabpage_get_number(tabpage)
  local active_buf = active_buf_in_tab(tabpage)
  local tab_name = id .. ":" .. active_buf
  if sel then
    return table.concat({ "%#TabLineSel#", (" %s"):format(tab_name) })
  end

  return table.concat({ "%#TabLine#", (" %s"):format(tab_name) })
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
