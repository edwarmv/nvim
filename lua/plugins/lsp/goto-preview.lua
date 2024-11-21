return {
  "rmagatti/goto-preview",
  enabled = true,
  opts = {
    width = math.floor(vim.o.columns / 2), -- Width of the floating window
    height = math.floor(vim.o.lines / 3), -- Height of the floating window
    default_mappings = false, -- Bind default mappings
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    post_open_hook = function(buf, win)
      vim.api.nvim_win_set_option(win, "winbar", "")
      vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
    end,
    -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    -- border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
    -- border = { "", "", "", "", "", "", "", "" },
  },
}
