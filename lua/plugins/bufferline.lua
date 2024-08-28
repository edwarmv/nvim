return {
  "akinsho/bufferline.nvim",
  enabled = true,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        show_buffer_close_icons = false,
        -- style_preset = bufferline.style_preset.minimal, -- or ,
        show_close_icon = false,
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
    })

    vim.keymap.set("n", "<leader>b", "<cmd>BufferLinePick<cr>", { desc = "[Buffer] Pick" })
    vim.keymap.set("n", "<leader>B", "<cmd>BufferLinePickClose<cr>", { desc = "[Buffer] Pick" })
    vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "[Buffer] Cycle Next" })
    vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "[Buffer] Cycle Prev" })
    vim.keymap.set("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "[Buffer] Move Next" })
    vim.keymap.set("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "[Buffer] Move Prev" })
  end,
}
