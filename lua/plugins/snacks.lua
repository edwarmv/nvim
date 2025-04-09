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
    zen = { enabled = true },
    rename = { enabled = true },
    scratch = { enabled = true },
    indent = {
      enabled = false,
      indent = {
        char = "▏",
      },
      scope = {
        char = "▏",
      },
    },
    picker = {
      layout = {
        preset = "vscode",
      },
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
        },
      },
      layouts = {
        vscode = {
          preview = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<a-m>"] = nil,
            ["<a-z>"] = { "toggle_maximize", mode = { "i", "n" } },
          },
        },
      },
    },
    words = { enabled = false },
    lazygit = {
      enabled = true,
      config = {
        os = {
          edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "<CMD>q<CR>" && nvim --server "$NVIM" --remote {{filename}})',
          editAtLine = '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server "$NVIM" --remote-send "<CMD>q<CR>" &&  nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>")',
          editAtLineAndWait = "nvim +{{line}} {{filename}}",
          openDirInEditor = '[ -z "$NVIM" ] && (nvim -- {{dir}}) || (nvim --server "$NVIM" --remote-send "<CMD>q<CR>" && nvim --server "$NVIM" --remote {{dir}})',
        },
        promptToReturnFromSubprocess = false,
      },
    },
    styles = {
      lazygit = {
        keys = {
          { "Q", "hide", mode = { "t", "n" } },
        },
        wo = {
          winhighlight = "NormalFloat:Normal",
        },
      },
      terminal = {
        wo = {
          winhighlight = "NormalFloat:Normal",
        },
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    require("snacks.picker.core.preview")
    vim.api.nvim_del_autocmd(vim.api.nvim_create_augroup("snacks.picker.preview.wo", {}))
  end,
  -- stylua: ignore start
  keys = {
    -- { "<c-\\>", function() Snacks.terminal.toggle() end, desc = "Toggle Term" },
    { "<leader>gl", function() Snacks.lazygit.open() end, desc = "Open Lazygit" },
    { "<leader>gL", function() Snacks.lazygit.open({cwd = Snacks.git.get_root()}) end, desc = "Open Lazygit - Current buffer" },
    -- { "<m-n>", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "<m-p>", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
    { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
    --- FZF
    { "<space>fe", function() Snacks.picker.explorer() end, desc = "FZF - Explorer" },
    { "<space>ff", function() Snacks.picker.files() end, desc = "FZF - Files" },
    { "<space>fF", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "FZF - Files Relative Path", },
    { "<space>fo", function() Snacks.picker.recent() end, desc = "FZF - Files History" },
    { "<space>fb", function() Snacks.picker.buffers() end, desc = "FZF - Buffers", },
    { "<space>fB", function() Snacks.picker.buffers({ filter = { cwd = vim.fn.expand("%:p:h") } }) end, desc = "FZF - Buffers Relative Path", },
    { "<space>fr", function() Snacks.picker.grep() end, desc = "FZF - Grep" },
    { "<space>fR", function() Snacks.picker.grep_word() end, desc = "FZF - Grep", mode = { "n", "x" } },
    { "<space>fm", function() Snacks.picker.marks() end, desc = "FZF - Marks" },
    { "<space>fk", function() Snacks.picker.keymaps() end, desc = "FZF - Keymaps" },
    { "<space>fc", function() Snacks.picker.commands() end, desc = "FZF - Commands" },
    { "<space>fls", function() Snacks.picker.lsp_symbols() end, desc = "FZF - LSP Document Symbols" },
    { "<space>fld", function() Snacks.picker.diagnostics() end, desc = "FZF - Document Diagnostics" },
    { "<space>fgl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<space>fgs", function() Snacks.picker.git_status() end, desc = "Git Status" },
  },
  -- stylua: ignore end
}
