return {
  "ecthelionvi/NeoComposer.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    queue_most_recent = true,
    colors = {
      bg = "#1f2335",
      fg = "#ff9e64",
      red = "#f7768e",
      blue = "#7aa2f7",
      green = "#9ece6a",
    },
    -- colors = {
    --   bg = "#3c3836",
    --   fg = "#e78a4e",
    --   red = "#ea6962",
    --   blue = "#7daea3",
    --   green = "#a9b665",
    -- },
    keymaps = {
      cycle_next = "]q",
      cycle_prev = "[q",
    },
  },
  config = function(_, opts)
    local api = vim.api
    local ui = require("NeoComposer.ui")
    local popup = require("plenary.popup")
    function ui.create_window()
      local width = 60
      local height = 10
      local bufnr = api.nvim_create_buf(false, false)
      -- local border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
      local border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

      local WIN_ID, win = popup.create(bufnr, {
        minwidth = width,
        minheight = height,
        title = "NeoComposer",
        borderchars = border_chars,
        col = math.floor((vim.o.columns - width) / 2),
        line = math.floor(((vim.o.lines - height) / 2) - 1),
      })

      local bg_color = ui.get_bg_color()
      vim.cmd(string.format("highlight ComposerNormal guibg=%s", bg_color))

      api.nvim_win_set_option(WIN_ID, "winhl", "Normal:ComposerNormal")
      api.nvim_win_set_option(win.border.win_id, "winhl", "Normal:ComposerBorder")

      return {
        bufnr = bufnr,
        win_id = WIN_ID,
      }
    end
    require("NeoComposer").setup(opts)
  end,
}
