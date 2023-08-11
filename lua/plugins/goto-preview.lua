return {
  "rmagatti/goto-preview",
  config = function()
    local goto_preview = require("goto-preview")
    goto_preview.setup({
      width = math.ceil(vim.o.columns * 0.5), -- Width of the floating window
      height = math.ceil(vim.o.lines * 0.3), -- Height of the floating window
      default_mappings = false, -- Bind default mappings
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      -- border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
      -- border = { "", "", "", "", "", "", "", "" },
    })

    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "gpd",
    --   "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
    --   { noremap = true }
    -- )
    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "gpi",
    --   "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
    --   { noremap = true }
    -- )
    -- vim.api.nvim_set_keymap("n", "gpq", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
  end,
}
