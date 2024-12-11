return {
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
    { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
    "https://codeberg.org/FelipeLema/cmp-async-path",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
  },
  config = function()
    local cmp = require("cmp")
    local types = require("cmp.types")

    cmp.setup({
      mapping = {
        ["<c-n>"] = cmp.mapping({
          c = function(fallback)
            fallback()
          end,
        }),
        ["<c-p>"] = cmp.mapping({
          c = function(fallback)
            fallback()
          end,
        }),
        ["<c-e>"] = cmp.mapping({
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
          c = function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              cmp.complete()
            end
          end,
        }),
        ["<s-tab>"] = cmp.mapping({
          c = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
              fallback()
            end
          end,
        }),
        ["<c-space>"] = cmp.mapping({
          c = function()
            cmp.complete()
          end,
        }),
      },
    })

    cmp.setup.cmdline(":", {
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
  end,
}
