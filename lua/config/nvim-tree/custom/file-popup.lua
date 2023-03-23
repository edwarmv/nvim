local a = vim.api
local view = require("nvim-tree.view")
local file_popup = require("nvim-tree.actions.node.file-popup")
local utils = require("nvim-tree.utils")

local function get_win_sep_hl()
  -- #1221 WinSeparator not present in nvim 0.6.1 and some builds of 0.7.0
  local has_win_sep = pcall(vim.cmd, "silent hi WinSeparator")
  return has_win_sep and "WinSeparator:NvimTreeWinSeparator" or "VertSplit:NvimTreeWinSeparator"
end

view.View = {
  adaptive_size = false,
  centralize_selection = false,
  tabpages = {},
  cursors = {},
  hide_root_folder = false,
  winopts = {
    relativenumber = false,
    number = false,
    list = false,
    foldenable = false,
    winfixwidth = true,
    winfixheight = true,
    spell = false,
    signcolumn = "yes",
    foldmethod = "manual",
    foldcolumn = "0",
    cursorcolumn = true,
    cursorlineopt = "line",
    colorcolumn = "0",
    wrap = false,
    winhl = table.concat({
      "EndOfBuffer:NvimTreeEndOfBuffer",
      "Normal:NvimTreeNormal",
      "CursorLine:NvimTreeCursorLine",
      get_win_sep_hl(),
      "StatusLine:NvimTreeStatusLine",
      "StatusLineNC:NvimTreeStatuslineNC",
      "SignColumn:NvimTreeSignColumn",
      "NormalNC:NvimTreeNormalNC",
    }, ","),
  },
}

local function get_formatted_lines(node)
  local stats = node.fs_stat
  local fpath = " fullpath: " .. node.absolute_path
  local created_at = " created:  " .. os.date("%x %X", stats.birthtime.sec)
  local modified_at = " modified: " .. os.date("%x %X", stats.mtime.sec)
  local accessed_at = " accessed: " .. os.date("%x %X", stats.atime.sec)
  local size = " size:     " .. utils.format_bytes(stats.size)

  return {
    fpath,
    size,
    accessed_at,
    modified_at,
    created_at,
  }
end

local current_popup = nil

local function setup_window(node)
  local lines = get_formatted_lines(node)

  local max_width = vim.fn.max(vim.tbl_map(function(n)
    return #n
  end, lines))
  local open_win_config = vim.tbl_extend("force", file_popup.open_win_config, {
    width = max_width + 1,
    height = #lines,
    noautocmd = true,
  })
  local winnr = a.nvim_open_win(0, false, open_win_config)
  current_popup = {
    winnr = winnr,
    file_path = node.absolute_path,
  }
  local bufnr = a.nvim_create_buf(false, true)
  a.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  a.nvim_win_set_buf(winnr, bufnr)
end

function file_popup.close_popup()
  if current_popup ~= nil and vim.api.nvim_win_is_valid(current_popup.winnr) then
    a.nvim_win_close(current_popup.winnr, { force = true })
    vim.cmd("augroup NvimTreeRemoveFilePopup | au! CursorMoved | augroup END")

    current_popup = nil
  end
end

function file_popup.toggle_file_info(node)
  if node.name == ".." then
    return
  end
  if current_popup ~= nil then
    if vim.api.nvim_win_is_valid(current_popup.winnr) then
      local is_same_node = current_popup.file_path == node.absolute_path

      file_popup.close_popup()

      if is_same_node then
        return
      end
    else
      current_popup = nil
    end
  end

  setup_window(node)

  a.nvim_create_autocmd("CursorMoved", {
    group = a.nvim_create_augroup("NvimTreeRemoveFilePopup", {}),
    callback = file_popup.close_popup,
  })
end

