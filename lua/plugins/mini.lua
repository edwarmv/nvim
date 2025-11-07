return {
  {
    "nvim-mini/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "nvim-mini/mini.diff",
    event = "VeryLazy",
    opts = {
      view = { style = "number" },
      mappings = {
        apply = "",
        reset = "",
        textobject = "",
        goto_first = "",
        goto_prev = "",
        goto_next = "",
        goto_last = "",
      },
    },
    keys = {
      {
        "<leader>go",
        function()
          MiniDiff.toggle_overlay()
        end,
        desc = "[MiniDiff] - Toggle Overlay",
      },
    },
  },
  {
    "nvim-mini/mini.snippets",
    enabled = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local gen_loader = require("mini.snippets").gen_loader

      local javascript = "**/javascript.json"
      local react = "**/react.json"
      local lang_patterns = {
        typescript = { javascript },
        astro = { javascript },
        tsx = { react, javascript },
      }
      require("mini.snippets").setup({
        snippets = {
          -- -- Load custom file with global snippets first (adjust for Windows)
          -- gen_loader.from_file('~/.config/nvim/snippets/global.json'),

          -- Load snippets based on current language by reading files from
          -- "snippets/" subdirectories from 'runtimepath' directories.
          gen_loader.from_lang({
            lang_patterns = lang_patterns,
          }),
        },
        mappings = {
          jump_next = "",
          jump_prev = "",
          stop = "",
        },
        expand = {
          insert = function(snippet, _)
            -- require("ix").do_action(function(ctx)
            --   ctx.completion.hide()
            -- end)
            vim.snippet.expand(snippet.body)
          end,
        },
      })
    end,
  },
}
