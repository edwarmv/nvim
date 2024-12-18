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
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
    { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
    { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
    "https://codeberg.org/FelipeLema/cmp-async-path",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        "L3MON4D3/LuaSnip",
      },
    },
    "luckasRanarison/tailwind-tools.nvim",
    "onsails/lspkind-nvim",
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      preselect = cmp.PreselectMode.Item, -- None - Item
      window = {
        completion = {
          -- border = defaults.border,
          winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
          col_offset = -2,
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
            if cmp.visible() then
              cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
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
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "async_path", option = { show_hidden_files_by_default = true } },
        { name = "buffer" },
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
          show_labelDetails = false,
          ellipsis_char = "…",
          before = require("tailwind-tools.cmp").lspkind_format,
        }),
      },
      experimental = {
        ghost_text = false,
      },
    })

    cmp.setup.cmdline(":", {
      window = {
        completion = {
          col_offset = 0,
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
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
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
