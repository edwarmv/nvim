return {
  "rmagatti/goto-preview",
  config = function()
    local goto_preview = require("goto-preview")
    goto_preview.setup({
      width = 120, -- Width of the floating window
      height = 15, -- Height of the floating window
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
    vim.keymap.set("n", "glpd", goto_preview.goto_preview_definition, { desc = "[LSP] Goto Preview Definition" })
    vim.keymap.set(
      "n",
      "glpt",
      goto_preview.goto_preview_type_definition,
      { desc = "[LSP] Goto Preview Type Definition" }
    )
    vim.keymap.set(
      "n",
      "glpi",
      goto_preview.goto_preview_implementation,
      { desc = "[LSP] Goto Preview Implementation" }
    )
    vim.keymap.set("n", "glP", goto_preview.close_all_win, { desc = "[LSP] Goto Preview Close All Win" })
    -- Only set if you have telescope installed
    vim.keymap.set("n", "glpr", goto_preview.goto_preview_references, { desc = "[LSP] Goto Preview References" })
  end,
}
