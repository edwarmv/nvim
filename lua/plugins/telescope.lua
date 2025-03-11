return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    -- "debugloop/telescope-undo.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    require("telescope").setup({})

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
    -- require("telescope").load_extension("undo")
  end,
  keys = {
    -- { "<space>tu", "<cmd>Telescope undo<cr>", desc = "Telescope - Undo History" },

    { "<space>fld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Telescope - Diagnostics Document" },
    { "<space>flD", "<cmd>Telescope diagnostics<cr>", desc = "Telescope - Diagnostics Workspace" },
    { "<space>fls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Telescope - LSP Document Symbols" },
    { "<space>flS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Telescope - LSP Workspace Symbols" },
    { "<space>flr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope - LSP References" },
    { "<space>fli", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope - LSP Implementation" },
    { "<space>fLd", "<cmd>Telescope lsp_definitions<cr>", desc = "Telescope - LSP Definitions" },
    { "<space>fLc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Telescope - LSP Incoming calls" },
    { "<space>fLC", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Telescope - LSP Outcoming calls" },

    { "<space>fr", "<cmd>Telescope live_grep<cr>", desc = "Telescope - Live Grep" },
    { "<space>fR", "<cmd>Telescope grep_string<cr>", desc = "Telescope - Live Grep Under Cursor" },
    { "<space>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope - Find Files" },
    {
      "<space>fF",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Find Files",
    },
    { "<space>fo", "<cmd>Telescope oldfiles<cr>", desc = "Telescope - Old Files" },
    { "<space>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope - Buffers" },
    { "<space>Fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope - Current Buffer Fuzzy Find" },
    {
      "<space>fB",
      function()
        require("telescope.builtin").buffers({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Buffers",
    },
    { "<space>fk", "<cmd>Telescope keymaps<cr>", desc = "Telescope - Keymaps" },
    { "<space>fc", "<cmd>Telescope commands<cr>", desc = "Telescope - Commands" },
    { "<space>fm", "<cmd>Telescope marks<cr>", desc = "Telescope - Commands" },

    { "<space>Ff", "<cmd>Telescope file_browser<cr>", desc = "Telescope - File Manager" },
    { "<space>FF", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope - File Manager" },

    { "<space>fgc", "<cmd>Telescope git_commits<cr>", desc = "Telescope - Git Commits" },
    { "<space>fgC", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope - Git Buffer's Commits" },
    { "<space>fgb", "<cmd>Telescope git_branches<cr>", desc = "Telescope - Git Branches" },
    { "<space>fgs", "<cmd>Telescope git_status<cr>", desc = "Telescope - Git Status" },
    { "<space>fgS", "<cmd>Telescope git_stash<cr>", desc = "Telescope - Git Stash" },
  },
}
