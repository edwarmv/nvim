return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    statuscolumn = {
      enabled = false,
      folds = {
        open = true,
        git_hl = true,
      },
    },
    bigfile = {},
    notifier = {},
    quickfile = {},
    input = {},
    scroll = {
      animate = {
        duration = { step = 15, total = 100 },
      },
    },
    zen = {},
    rename = {},
    scratch = {},
    indent = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▏",
      },
    },
    picker = {
      ui_select = true,
      win = {
        input = {
          keys = {
            ["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
          },
        },
      },
    },
  },
  -- stylua: ignore start
  keys = {
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
    { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
    --- FZF
    { "<space>ff", function() Snacks.picker.files() end, desc = "FZF - Files" },
    { "<space>fF", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "FZF - Files Relative Path", },
    { "<space>fo", function() Snacks.picker.recent() end, desc = "FZF - Files History" },
    { "<space>fb", function() Snacks.picker.buffers() end, desc = "FZF - Buffers", },
    { "<space>fr", function() Snacks.picker.grep() end, desc = "FZF - Grep" },
    { "<space>fR", function() Snacks.picker.grep_word() end, desc = "FZF - Grep", mode = { "n", "x" } },
    { "<space>fm", function() Snacks.picker.marks() end, desc = "FZF - Key Mappings" },
    { "<space>fc", function() Snacks.picker.commands() end, desc = "FZF - Commands" },
    { "<space>fls", function() Snacks.picker.lsp_symbols() end, desc = "FZF - LSP Document Symbols" },
    { "<space>fld", function() Snacks.picker.diagnostics() end, desc = "FZF - Document Diagnostics" },
  },
  -- stylua: ignore end
}
