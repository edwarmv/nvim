return {
  "akinsho/bufferline.nvim",
  enabled = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slant",
    },
  },
  config = function(_, opts)
    local bufferline = require("bufferline")
    bufferline.setup(opts)

    vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "[Buffer] Cycle Next" })
    vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "[Buffer] Cycle Prev" })
  end,
}
