local function get_filename(props)
  local bufname = vim.api.nvim_buf_get_name(props.buf)
  local filename = vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
  if filename == "" then
    filename = "[No Name]"
  end
  local icon, hl = MiniIcons.get("file", filename)

  return {
    { icon, group = hl },
    { " " },
    {
      filename,
      gui = vim.bo[props.buf].modified and "italic" or "",
      guifg = vim.bo[props.buf].modified and "#9ece6a" or "#7aa2f7",
    },
  }
end

return {
  "b0o/incline.nvim",
  dependencies = {
    -- "akinsho/git-conflict.nvim",
  },
  enabled = true,
  init = function()
    vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
      callback = function()
        require("incline").refresh()
      end,
    })
  end,
  opts = {
    hide = {
      cursorline = "focused_win",
      focused_win = false,
      only_win = false,
    },
    render = function(props)
      return {
        get_filename(props),
      }
    end,
    window = {
      margin = {
        horizontal = 0,
      },
      zindex = 1,
    },
    ignore = {
      filetypes = { "oil" },
    },
  },
  event = "VeryLazy",
}
