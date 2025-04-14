local function has_words_before()
  if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  enabled = true,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
    { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
    { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
    "https://codeberg.org/FelipeLema/cmp-async-path",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    -- {
    --   "saadparwaiz1/cmp_luasnip",
    --   dependencies = {
    --     "L3MON4D3/LuaSnip",
    --   },
    -- },
    {
      "abeldekat/cmp-mini-snippets",
      dependencies = "echasnovski/mini.snippets",
    },
    {
      "luckasRanarison/tailwind-tools.nvim",
      opts = {
        document_color = {
          enabled = false,
        },
      },
    },
    "onsails/lspkind-nvim",
    "windwp/nvim-autopairs",
  },
  config = function()
    -- local luasnip = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          -- require("luasnip").lsp_expand(args.body)
          local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          insert({ body = args.body }) -- Insert at cursor
          cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      window = {
        completion = {
          col_offset = -2,
        },
      },
      view = {
        entries = {
          name = "custom",
          follow_cursor = true,
        },
        docs = {
          auto_open = false,
        },
      },
      mapping = {
        ["<c-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
        ["<c-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        ["<c-e>"] = cmp.mapping(function(fallback)
          -- if luasnip.choice_active() then
          --   luasnip.change_choice(1)
          -- end
          if cmp.visible() then
            cmp.close()
          else
            fallback()
          end
        end),
        ["<c-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if MiniSnippets.session.get() ~= nil then
              cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
            else
              cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
            end
          elseif MiniSnippets.session.get() ~= nil then
            MiniSnippets.session.jump("next")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end),
        ["<s-tab>"] = cmp.mapping(function(fallback)
          -- if luasnip.locally_jumpable(-1) then
          --   luasnip.jump(-1)
          if MiniSnippets.session.get() ~= nil then
            MiniSnippets.session.jump("prev")
          else
            fallback()
          end
        end),
        ["<c-space>"] = cmp.mapping(function()
          cmp.complete()
          if cmp.get_selected_entry() ~= nil then
            if cmp.visible_docs() then
              cmp.close_docs()
            else
              cmp.open_docs()
            end
          end
        end),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = "luasnip" },
        { name = "mini_snippets" },
        { name = "async_path", option = { show_hidden_files_by_default = true } },
        { name = "buffer" },
      }),
      formatting = {
        expandable_indicator = true,
        fields = {
          "kind",
          "abbr",
          "menu",
        },
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = function()
            return math.floor(vim.o.columns / 5)
          end,
          show_labelDetails = true,
          ellipsis_char = "…",
          before = require("tailwind-tools.cmp").lspkind_format,
        }),
      },
      experimental = {
        ghost_text = false,
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      window = {
        completion = {
          col_offset = 0,
        },
      },
      view = {
        entries = {
          name = "custom",
          follow_cursor = false,
        },
      },
      sources = cmp.config.sources({
        { name = "async_path", option = { show_hidden_files_by_default = true } },
      }, {
        { name = "cmdline" },
      }),
      matching = {
        disallow_fuzzy_matching = false,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = true,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
        disallow_symbol_nonprefix_matching = false,
      },
      formatting = {
        expandable_indicator = true,
        fields = {
          "abbr",
        },
        format = function(_, vim_item)
          return vim_item
        end,
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      window = {
        completion = {
          col_offset = -2,
        },
      },
      view = {
        entries = {
          name = "custom",
          follow_cursor = false,
        },
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        -- { name = "luasnip" },
        { name = "mini_snippets" },
        { name = "buffer" },
      }),
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
