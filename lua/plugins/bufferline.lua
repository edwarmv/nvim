return {
  "akinsho/bufferline.nvim",
  enabled = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
  config = function(_, opts)
    local bufferline = require("bufferline")
    bufferline.setup(opts)

    vim.keymap.set("n", "<leader>b", "<cmd>BufferLinePick<cr>", { desc = "[Buffer] Pick" })
    vim.keymap.set("n", "<leader>B", "<cmd>BufferLinePickClose<cr>", { desc = "[Buffer] Pick" })
    vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "[Buffer] Cycle Next" })
    vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "[Buffer] Cycle Prev" })
    vim.keymap.set("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "[Buffer] Move Next" })
    vim.keymap.set("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "[Buffer] Move Prev" })
  end,
}
