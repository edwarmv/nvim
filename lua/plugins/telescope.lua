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
    -- { "<leader>tu", "<cmd>Telescope undo<cr>", desc = "Telescope - Undo History" },

    { "<leader>fld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Telescope - Diagnostics Document" },
    { "<leader>flD", "<cmd>Telescope diagnostics<cr>", desc = "Telescope - Diagnostics Workspace" },
    { "<leader>fls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Telescope - LSP Document Symbols" },
    { "<leader>flS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Telescope - LSP Workspace Symbols" },
    { "<leader>flr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope - LSP References" },
    { "<leader>fli", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope - LSP Implementation" },
    { "<leader>fLd", "<cmd>Telescope lsp_definitions<cr>", desc = "Telescope - LSP Definitions" },
    { "<leader>fLc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Telescope - LSP Incoming calls" },
    { "<leader>fLC", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Telescope - LSP Outcoming calls" },

    { "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "Telescope - Live Grep" },
    { "<leader>fR", "<cmd>Telescope grep_string<cr>", desc = "Telescope - Live Grep Under Cursor" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope - Find Files" },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Find Files",
    },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Telescope - Old Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope - Buffers" },
    { "<leader>Fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope - Current Buffer Fuzzy Find" },
    {
      "<leader>fB",
      function()
        require("telescope.builtin").buffers({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Buffers",
    },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Telescope - Keymaps" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Telescope - Commands" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Telescope - Commands" },

    { "<leader>Ff", "<cmd>Telescope file_browser<cr>", desc = "Telescope - File Manager" },
    {
      "<leader>FF",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      desc = "Telescope - File Manager",
    },

    { "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Telescope - Git Commits" },
    { "<leader>fgC", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope - Git Buffer's Commits" },
    { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Telescope - Git Branches" },
    { "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Telescope - Git Status" },
    { "<leader>fgS", "<cmd>Telescope git_stash<cr>", desc = "Telescope - Git Stash" },
  },
}
