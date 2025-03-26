return {
  "saghen/blink.cmp",
  enabled = true,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "folke/lazydev.nvim",
    "L3MON4D3/LuaSnip",
    {
      "github/copilot.vim",
      cmd = "Copilot",
      event = "BufWinEnter",
      init = function()
        vim.g.copilot_no_maps = true
      end,
      config = function()
        -- Block the normal Copilot suggestions
        vim.api.nvim_create_augroup("github_copilot", { clear = true })
        vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
          group = "github_copilot",
          callback = function(args)
            vim.fn["copilot#On" .. args.event]()
          end,
        })
        vim.fn["copilot#OnFileType"]()
      end,
    },
    "fang2hou/blink-copilot",
  },
  build = "cargo build --release",
  -- version = "*",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<M-space>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
    },
    appearance = {
      kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    },
    snippets = {
      preset = "luasnip",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      per_filetype = {
        lua = { "lsp", "path", "snippets", "buffer", "lazydev" },
      },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        lsp = {
          opts = { tailwind_color_icon = "■" },
          fallbacks = {},
        },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "padded",
        },
      },
      menu = {
        max_height = 6,
        border = "none",
      },
    },
  },
}
