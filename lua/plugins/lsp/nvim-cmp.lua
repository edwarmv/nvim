return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
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
    "luckasRanarison/tailwind-tools.nvim",
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
          local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          insert({ body = args.body }) -- Insert at cursor
          cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      preselect = cmp.PreselectMode.Item, -- None - Item
      window = {
        completion = {
          -- border = defaults.border,
          winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
          col_offset = -3,
        },
        documentation = {
          max_width = math.floor(vim.opt.columns:get() / 3),
          max_height = math.floor(vim.opt.lines:get() / 3),
          -- border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
          winhighlight = "FloatBorder:CmpBorder,Search:None",
        },
      },
      view = {
        entries = {
          follow_cursor = false,
        },
        docs = {
          auto_open = true,
        },
      },
      mapping = {
        ["<up>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.close()
              fallback()
            else
              fallback()
            end
          end,
        }),
        ["<down>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.close()
              fallback()
            else
              fallback()
            end
          end,
        }),
        ["<c-n>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end,
        }),
        ["<c-p>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end,
        }),
        ["<c-f>"] = cmp.mapping.scroll_docs(1),
        ["<c-b>"] = cmp.mapping.scroll_docs(-1),
        ["<c-e>"] = cmp.mapping({
          i = function(fallback)
            -- if luasnip.choice_active() then
            --   luasnip.change_choice(1)
            -- end
            if cmp.visible() then
              cmp.close()
            else
              fallback()
            end
          end,
          -- s = function(fallback)
          --   if luasnip.choice_active() then
          --     luasnip.change_choice(1)
          --   else
          --     fallback()
          --   end
          -- end,
        }),
        ["<c-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<tab>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
            elseif MiniSnippets.session.get() ~= nil then
              MiniSnippets.session.jump("next")
            else
              fallback()
            end
          end,
          s = function(fallback)
            if MiniSnippets.session.get() ~= nil then
              MiniSnippets.session.jump("next")
            else
              fallback()
            end
          end,
        }),
        ["<s-tab>"] = cmp.mapping({
          i = function(fallback)
            if MiniSnippets.session.get() ~= nil then
              MiniSnippets.session.jump("prev")
            else
              fallback()
            end
          end,
          s = function(fallback)
            if MiniSnippets.session.get() ~= nil then
              MiniSnippets.session.jump("prev")
            else
              fallback()
            end
          end,
        }),
        ["<c-space>"] = cmp.mapping({
          i = function()
            cmp.complete()
            if cmp.get_selected_entry() ~= nil then
              if cmp.visible_docs() then
                cmp.close_docs()
              else
                cmp.open_docs()
              end
            end
          end,
        }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "mini_snippets" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = {
          "kind",
          "abbr",
          "menu",
        },
        format = lspkind.cmp_format({
          symbol_map = {
            Text = " ",
            Method = " ",
            Function = " ",
            Constructor = " ",
            Field = " ",
            Variable = " ",
            Class = " ",
            Interface = " ",
            Module = " ",
            Property = " ",
            Unit = " ",
            Value = " ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = " ",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
          },
          mode = "symbol",
          maxwidth = function()
            return math.floor(vim.o.columns / 5)
          end,
          show_labelDetails = true,
          ellipsis_char = "… ",
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
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
      formatting = {
        fields = {
          cmp.ItemField.Abbr,
        },
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
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
        { name = "mini_snippets" },
      }, {
        { name = "buffer" },
      }),
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
