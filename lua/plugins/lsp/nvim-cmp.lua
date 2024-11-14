local defaults = require("config.defaults")

local function has_words_before()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  -- "hrsh7th/nvim-cmp",
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
    { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
    { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
    "https://codeberg.org/FelipeLema/cmp-async-path",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    -- "f3fora/cmp-spell",
    -- "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-calc",
    "chrisgrieser/cmp_yanky",
    "hrsh7th/cmp-emoji",
    -- "ray-x/cmp-treesitter",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        "L3MON4D3/LuaSnip",
      },
    },
    "luckasRanarison/tailwind-tools.nvim",
    "onsails/lspkind-nvim",
    -- {
    --   "max397574/better-escape.nvim",
    --   config = function()
    --     require("better_escape").setup({
    --       mapping = { "jk" }, -- a table with mappings to use
    --     })
    --   end,
    -- },
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local types = require("cmp.types")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      preselect = cmp.PreselectMode.Item, -- None - Item
      completion = {
        -- autocomplete = false,
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
        },
      },
      window = {
        completion = {
          -- border = defaults.border,
          winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          max_width = math.floor(vim.opt.columns:get() / 3),
          max_height = math.floor(vim.opt.lines:get() / 3),
          border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
          winhighlight = "FloatBorder:CmpBorder,Search:None",
        },
      },
      view = {
        entries = {
          follow_cursor = true,
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
          c = function(fallback)
            fallback()
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
          c = function(fallback)
            fallback()
          end,
        }),
        ["<c-f>"] = cmp.mapping.scroll_docs(1),
        ["<c-b>"] = cmp.mapping.scroll_docs(-1),
        ["<c-e>"] = cmp.mapping({
          i = function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            end
            if cmp.visible() then
              cmp.close()
            else
              fallback()
            end
          end,
          s = function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            else
              fallback()
            end
          end,
          c = function(fallback)
            if cmp.visible() then
              cmp.close()
            else
              fallback()
            end
          end,
        }),
        ["<c-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<tab>"] = cmp.mapping({
          i = function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            elseif cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end,
          s = function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end,
          c = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              -- fallback()
              cmp.complete()
            end
          end,
        }),
        ["<s-tab>"] = cmp.mapping({
          i = function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            elseif cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end,
          s = function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
          c = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
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
          c = function()
            cmp.complete()
          end,
        }),
      },
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
        { name = "cmp_yanky" },
        { name = "async_path", option = { show_hidden_files_by_default = true } },
      }, {
        { name = "calc" },
        { name = "emoji" },
      }),
      formatting = {
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
          -- menu = {
          --   buffer = "[Buffer]",
          --   spell = "[Spell]",
          --   nvim_lsp = "[LSP]",
          --   luasnip = "[Snippet]",
          --   path = "[Path]",
          --   emmet_vim = "[Emmet]",
          --   cmp_yanky = "[Yanky]",
          --   calc = "[Calc]",
          --   nvim_lsp_document_symbol = "[Symbols]",
          --   emoji = "[Emoji]",
          --   nvim_lsp_signature_help = "[Signature]",
          -- },
        }),
      },
      experimental = {
        ghost_text = false,
      },
    })

    cmp.setup.cmdline(":", {
      completion = {
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
        },
      },
      sources = cmp.config.sources({
        { name = "cmdline" },
        { name = "async_path", option = { show_hidden_files_by_default = true } },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
      formatting = {
        fields = {
          cmp.ItemField.Abbr,
        },
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      completion = {
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
        },
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
      -- formatting = {
      --   fields = {
      --     cmp.ItemField.Abbr,
      --   },
      -- },
    })

    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
