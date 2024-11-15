return {
  "b0o/SchemaStore.nvim",
  { "chrisbra/csv.vim", ft = "csv" },
  { "chrisbra/recover.vim" },
  {
    "tummetott/reticle.nvim",
    enabled = false,
    event = "VeryLazy", -- optionally lazy load the plugin
    opts = {},
  },
  {
    "nvim-focus/focus.nvim",
    version = false,
    enabled = false,
    init = function()
      local ignore_filetypes = { "neo-tree", "NvimTree", "aerial", "diff", "undotree" }
      local ignore_buftypes = { "nofile", "prompt", "popup" }

      local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

      vim.api.nvim_create_autocmd("WinEnter", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
            vim.w.focus_disable = true
          else
            vim.w.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for BufType",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
          else
            vim.b.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for FileType",
      })
    end,
    opts = {},
  },
  {
    init = function()
      vim.g.user_emmet_leader_key = "<m-e>"
    end,
    "mattn/emmet-vim",
  },
  -- {
  --   "preservim/vim-markdown",
  -- },
  {
    "godlygeek/tabular",
  },
  "tpope/vim-fugitive",
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
  "fladson/vim-kitty",
  "imsnif/kdl.vim",
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  -- "tpope/vim-scriptease",
  "farmergreg/vim-lastplace",
  -- "vim-scripts/restore_view.vim",
  -- "simeji/winresizer",
  -- "moll/vim-bbye",
  "famiu/bufdelete.nvim",
  "dstein64/vim-startuptime",
  {
    "gcmt/taboo.vim",
    enabled = true,
    init = function()
      vim.g.taboo_tabline = 0
      vim.keymap.set("n", "<leader>tr", function()
        vim.ui.input({ prompt = "Enter The Tab Name: " }, function(name)
          vim.cmd("TabooRename " .. name)
        end)
      end, { desc = "Rename Tab" })
      vim.keymap.set("n", "<leader>tR", "<cmd>TabooReset<cr>", { desc = "Reset Tab Name" })
    end,
  },
}
