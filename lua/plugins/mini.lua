return {
  {
    "echasnovski/mini.icons",
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
    "echasnovski/mini.diff",
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
    "echasnovski/mini.snippets",
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
          expand = "<C-j>",
          jump_next = "",
          jump_prev = "",
          stop = "",
        },
      })
      -- MiniSnippets.start_lsp_server()
      local make_stop = function()
        local au_opts = { pattern = "*:n", once = true }
        au_opts.callback = function()
          while MiniSnippets.session.get() do
            MiniSnippets.session.stop()
          end
        end
        vim.api.nvim_create_autocmd("ModeChanged", au_opts)
      end
      local opts = { pattern = "MiniSnippetsSessionStart", callback = make_stop }
      vim.api.nvim_create_autocmd("User", opts)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    init = function()
      vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
        desc = "Disable 'mini.indentscope' when buftype is ''",
        callback = function(args)
          local bufnr = args.buf or vim.fn.expand("<abuf>")
          if vim.bo[bufnr].buftype ~= "" then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end,
    opts = { symbol = "▏" },
  },
}
