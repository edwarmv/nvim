return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      top_down = false,
    },
    dashboard = { enabled = false },
    statuscolumn = {
      enabled = false,
      folds = {
        open = true,
        git_hl = true,
      },
    },
    scroll = { enabled = false },
    quickfile = { enabled = true },
    input = { enabled = true },
    zen = { enabled = true },
    rename = { enabled = true },
    scratch = { enabled = true },
    indent = {
      enabled = true,
      indent = {
        char = "▏",
      },
      scope = {
        enabled = true,
        char = "▏",
      },
    },
    picker = {
      preview_no_winopts = true,
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
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
      dashboard = {
        wo = {
          foldcolumn = "0",
        },
      },
    },
  },
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
    { "<leader>bdd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
    { "<leader>bdo", function() Snacks.bufdelete.other() end, desc = "Delete All Bufferss Except The Current One", },
    { "<leader>bda", function() Snacks.bufdelete.all() end, desc = "Delete All Bufferss", },
    --- FZF
    { "<leader>F", function() Snacks.picker() end, desc = "Snacks Picker" },
    { "<leader>fe", function() Snacks.picker.explorer() end, desc = "FZF - Explorer" },
    { "<leader>fs", function() Snacks.picker.smart() end, desc = "FZF - Smart" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "FZF - Files" },
    { "<leader>fF", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "FZF - Files Relative Path", },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "FZF - Files History" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "FZF - Buffers", },
    { "<leader>fB", function() Snacks.picker.buffers({ filter = { cwd = vim.fn.expand("%:p:h") } }) end, desc = "FZF - Buffers Relative Path", },
    { "<leader>fr", function() Snacks.picker.grep() end, desc = "FZF - Grep" },
    { "<leader>fR", function() Snacks.picker.grep_word() end, desc = "FZF - Grep", mode = { "n", "x" } },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "FZF - Marks" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "FZF - Keymaps" },
    { "<leader>fc", function() Snacks.picker.commands() end, desc = "FZF - Commands" },
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "FZF - Buffer Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics() end, desc = "FZF - Diagnostics" },
    { "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>f/", function() Snacks.picker.lines() end, desc = "Lines" },
    { "<leader><leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },
    -- git
    { "<leader>fgb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>fgl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>fgL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>fgs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>fgS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>fgd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>fgf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    -- LSP
    { "<leader>fld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "<leader>flD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "<leader>flr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>flI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>fly", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>flai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    { "<leader>flao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    { "<leader>fls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>flS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },
  -- stylua: ignore end
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option("scrollbind", { name = "Scrollbind" }):map("yoS")
      end,
    })
  end,
}
