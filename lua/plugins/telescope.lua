return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local fb_actions = require("telescope").extensions.file_browser.actions
    require("telescope").setup({
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- mappings = {
        --   i = {
        --     -- map actions.which_key to <C-h> (default: <C-/>)
        --     -- actions.which_key shows the mappings for your picker,
        --     -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --     ["<C-h>"] = "which_key",
        --   },
        -- },
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
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
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

    vim.keymap.set("n", "<space>tld", "<cmd>Telescope diagnostics bufnr=0<cr>")
    vim.keymap.set("n", "<space>tlD", "<cmd>Telescope diagnostics<cr>")
    vim.keymap.set("n", "<space>tls", "<cmd>Telescope lsp_document_symbols<cr>")

    vim.keymap.set("n", "<space>tf", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<space>tb", "<cmd>Telescope buffers<cr>")
    vim.keymap.set("n", "<space>tk", "<cmd>Telescope keymaps<cr>")
    vim.keymap.set("n", "<space>tc", "<cmd>Telescope commands<cr>")

    vim.keymap.set("n", "<space>tF", "<cmd>Telescope file_browser<cr>")
  end,
}
