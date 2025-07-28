local defaults = require("config.defaults")

return {
  "akinsho/bufferline.nvim",
  enabled = true,
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      truncate_names = false,
      sort_by = "insert_at_end",
      hover = {
        enabled = false,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
  keys = {
    { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "[Buffer] Pick" },
    { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "[Buffer] Pick" },
    {
      "<leader>tr",
      function()
        vim.ui.input({ prompt = "Enter The Tab Name: " }, function(name)
          vim.cmd("BufferLineTabRename " .. name)
        end)
      end,
      desc = "[Buffer] Tab Rename",
    },
    { "<leader>bst", "<cmd>BufferLineSortByTabs<cr>", desc = "[Buffer] Sort by Tabs" },
    { "<leader>bsd", "<cmd>BufferLineSortByDirectory<cr>", desc = "[Buffer] Sort by Directory" },
    { "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", desc = "[Buffer] Sort by Extension" },
    {
      "<leader>bsr",
      "<cmd>BufferLineSortByRelativeDirectory<cr>",
      desc = "[Buffer] Sort by Relative Directory",
    },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "[Buffer] Cycle Next" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "[Buffer] Cycle Prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "[Buffer] Move Next" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "[Buffer] Move Prev" },
  },
}
