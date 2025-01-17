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
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    input = { enabled = true },
    scroll = {
      animate = {
        duration = { step = 15, total = 100 },
      },
    },
    zen = { enabled = true },
    rename = { enabled = true },
    scratch = { enabled = true },
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
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
        },
      },
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
          wo = {
            foldcolumn = "0",
          },
        },
        preview = {
          wo = {
            relativenumber = false,
            foldcolumn = "auto",
          },
        },
      },
    },
    words = { enabled = true },
  },
  -- stylua: ignore start
  keys = {
    { "<m-n>", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "<m-p>", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
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
