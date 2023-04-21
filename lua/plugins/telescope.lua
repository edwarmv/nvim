return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  config = function()
    local fb_actions = require("telescope").extensions.file_browser.actions
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
            ["<C-x>"] = false,
            ["<C-s>"] = "select_horizontal",
          },
        },
        prompt_prefix = "",
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            height = 0.9,
            width = 0.9,
          },
          bottom_pane = {
            height = 0.50,
          },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        workspaces = {
          -- keep insert mode after selection in the picker, default is false
          keep_insert = false,
        },
        file_browser = {
          mappings = {
            n = {
              ["<S-CR>"] = false,
              ["<M-a>"] = fb_actions.create_from_prompt,
            },
            i = {
              ["<S-CR>"] = false,
              ["<M-a>"] = fb_actions.create_from_prompt,
            },
          },
        },
      },
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
  end,
  keys = {
    { "<space>tld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Telescope - Diagnostics Document" },
    { "<space>tlD", "<cmd>Telescope diagnostics<cr>", desc = "Telescope - Diagnostics Workspace" },
    { "<space>tls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Telescope - LSP Document Symbols" },
    { "<space>tlS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Telescope - LSP Workspace Symbols" },
    { "<space>tlr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope - LSP References" },
    { "<space>tli", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope - LSP Implementation" },
    { "<space>tLd", "<cmd>Telescope lsp_definitions<cr>", desc = "Telescope - LSP Definitions" },
    { "<space>tLc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Telescope - LSP Incoming calls" },
    { "<space>tLC", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Telescope - LSP Outcoming calls" },

    { "<space>tr", "<cmd>Telescope live_grep<cr>", desc = "Telescope - Live Grep" },
    { "<space>tR", "<cmd>Telescope grep_string<cr>", desc = "Telescope - Live Grep" },
    { "<space>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope - Find Files" },
    {
      "<space>tF",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Find Files",
    },
    { "<space>to", "<cmd>Telescope oldfiles<cr>", desc = "Telescope - Old Files" },
    { "<space>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope - Buffers" },
    { "<space>Tb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope - Current Buffer Fuzzy Find" },
    {
      "<space>tB",
      function()
        require("telescope.builtin").buffers({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Buffers",
    },
    { "<space>tk", "<cmd>Telescope keymaps<cr>", desc = "Telescope - Keymaps" },
    { "<space>tc", "<cmd>Telescope commands<cr>", desc = "Telescope - Commands" },
    { "<space>tm", "<cmd>Telescope marks<cr>", desc = "Telescope - Commands" },

    { "<space>Tf", "<cmd>Telescope file_browser<cr>", desc = "Telescope - File Manager" },

    { "<space>tgc", "<cmd>Telescope git_commits<cr>", desc = "Telescope - Git Commits" },
    { "<space>tgC", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope - Git Buffer's Commits" },
    { "<space>tgb", "<cmd>Telescope git_branches<cr>", desc = "Telescope - Git Branches" },
    { "<space>tgs", "<cmd>Telescope git_status<cr>", desc = "Telescope - Git Status" },
    { "<space>tgS", "<cmd>Telescope git_stash<cr>", desc = "Telescope - Git Stash" },
  },
}
