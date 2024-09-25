return {
  "sindrets/diffview.nvim",
  config = function()
    -- local Panel = require("diffview.ui.panel").Panel
    -- Panel.default_config_float = {
    --   type = "float",
    --   relative = "editor",
    --   row = 0,
    --   col = 0,
    --   zindex = 50,
    --   style = "minimal",
    --   border = "rounded",
    --   win_opts = {},
    -- }
    --
    require("diffview").setup({
      enhanced_diff_hl = true,
    })

    vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "Diffview - Open" })
    vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Diffview - Close" })
    vim.keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview - File History" })
    vim.keymap.set(
      "n",
      "<leader>dh",
      "<cmd>DiffviewFileHistory %<cr>",
      { desc = "Diffview - File History Current File" }
    )
  end,
}
