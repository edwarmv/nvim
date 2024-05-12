local defaults = require("config.defaults")
---@diagnostic disable: missing-fields
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  enabled = true,
  pin = false,
  dependencies = {
    "nvimtools/hydra.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    "f3fora/cmp-spell",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-calc",
    "chrisgrieser/cmp_yanky",
    { "dcampos/cmp-emmet-vim", dependencies = { "mattn/emmet-vim" } },
    -- "ray-x/cmp-treesitter",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = { "L3MON4D3/LuaSnip" },
    },
    "luckasRanarison/tailwind-tools.nvim",
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
    local utils = require("plugins.nvim-cmp.utils")
    local luasnip = require("luasnip")
    local cmp = require("cmp")
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
          --   winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          max_width = math.floor(vim.opt.columns:get() / 3),
          max_height = math.floor(vim.opt.lines:get() / 3),
          -- border = defaults.border,
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
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
          s = function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
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
          s = function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
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
            if cmp.visible() then
              cmp.close()
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
            elseif utils.has_words_before() then
              cmp.complete()
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
      }, --}}}
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = {
          cmp.ItemField.Kind,
          cmp.ItemField.Abbr,
          cmp.ItemField.Menu,
        },
        format = require("lspkind").cmp_format({
          mode = "symbol",
          maxwidth = function()
            return math.floor(vim.o.columns / 4)
          end,
          ellipsis_char = "…",
          before = require("tailwind-tools.cmp").lspkind_format,
          menu = {
            buffer = "[Buffer]",
            spell = "[Spell]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            path = "[Path]",
            emmet_vim = "[Emmet]",
            cmp_yanky = "[Yanky]",
            calc = "[Calc]",
            nvim_lsp_document_symbol = "[Symbols]",
          },
        }),
      },
      experimental = {
        ghost_text = true,
      },
    })

    cmp.setup.cmdline(":", {
      completion = {
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
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

    local Hydra = require("hydra")

    Hydra({
      config = {
        hint = {
          type = "statusline",
        },
        invoke_on_body = true,
        timeout = false,
      },
      mode = "i",
      body = "<c-z>",
      heads = {
        {
          "s",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "luasnip" },
                },
              },
            })
          end,
          { desc = "snippets", exit = true },
        },
        {
          "p",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "path" },
                },
              },
            })
          end,
          { desc = "path", exit = true },
        },
        {
          "c",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "calc" },
                },
              },
            })
          end,
          { desc = "calc", exit = true },
        },
        {
          "y",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  {
                    name = "cmp_yanky",
                  },
                },
              },
            })
          end,
          { desc = "yanky", exit = true },
        },
        {
          "e",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  {
                    name = "emmet_vim",
                    option = {
                      filetypes = {
                        "html",
                        "xml",
                        "typescriptreact",
                        "javascriptreact",
                        "javascript",
                        "css",
                        "sass",
                        "scss",
                        "less",
                        "heex",
                        "tsx",
                        "jsx",
                      },
                    },
                  },
                },
              },
            })
          end,
          { desc = "emmet", exit = true },
        },
      },
    })

    Hydra({
      config = {
        hint = {
          type = "statusline",
        },
        invoke_on_body = true,
        timeout = false,
      },
      mode = "i",
      body = "<c-x>",
      heads = {
        {
          "s",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "spell" },
                },
              },
            })
          end,
          { desc = "spell", exit = true },
        },
      },
    })

    -- cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
    --   sources = cmp.config.sources({
    --     { name = "vim-dadbod-completion" },
    --     { name = "buffer" },
    --   }),
    -- })

    -- https://github.com/hrsh7th/nvim-cmp/issues/598#issuecomment-984930668
    -- vim.cmd([[
    --   augroup CmpDebounceAuGroup
    --     au!
    --     au TextChangedI * lua require("config.nvim-cmp").debounce()
    --   augroup end
    -- ]])
    -- vim.api.nvim_create_augroup("CmpDebounceAuGroup", { clear = true })
    -- vim.api.nvim_create_autocmd("TextChangedI", {
    --   group = "CmpDebounceAuGroup",
    --   callback = function()
    --     debounce.cancel_autocomplete = false
    --     debounce.debounce()
    --   end,
    -- })

    -- vim.cmd([[
    --   augroup CmpCmdlineDebounceAuGroup
    --     au!
    --     au CmdlineChanged * lua require("config.nvim-cmp").debounce()
    --   augroup end
    -- ]])
    -- vim.api.nvim_create_autocmd({ "CmdlineChanged" }, {
    --   -- group = vim.api.nvim_create_augroup("CmpDebounceAuGroup", {}),
    --   callback = function()
    --     debounce.cancel_autocomplete = true
    --     debounce.debounce()
    --   end,
    -- })

    -- cmp.setup.filetype({ "norg" }, {
    --   sources = {
    --     { name = "neorg" },
    --     { name = "buffer" },
    --   },
    -- })
    cmp.setup.filetype({ "markdown" }, {
      sources = cmp.config.sources({
        { name = "spell" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype({ "gitcommit", "NeogitCommitMessage" }, {
      sources = cmp.config.sources({
        { name = "spell" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })

    -- cmp.event:on("confirm_done", function()
    --   print('confirm_done')
    --   debounce.cancel_autocomplete = true
    -- end)

    -- cmp.event:on("complete_done", function()
    --   print('confirm_done')
    --   debounce.cancel_autocomplete = true
    -- end)

    -- cmp.event:on("menu_closed", function()
    --   debounce.cancel_autocomplete = true
    -- end)

    -- cmp.event:on("menu_opened", function()
    --   debounce.cancel_autocomplete = false
    -- end)

    -- local group = vim.api.nvim_create_augroup("CmpUserAuGroup", { clear = false })

    -- vim.api.nvim_create_autocmd("OptionSet", {
    --   group = group,
    --   pattern = "spell",
    --   callback = function()
    --     local is_spell_on = vim.opt.spell:get()
    --     if is_spell_on then
    --       cmp.setup.buffer({
    --         sources = cmp.config.sources({
    --           {
    --             name = "spell",
    --             option = {
    --               keep_all_entries = false,
    --             },
    --           },
    --         }),
    --       })
    --     else
    --       cmp.setup.buffer({
    --         sources = cmp.config.sources({
    --           { name = "nvim_lsp" },
    --           { name = "luasnip" },
    --           { name = "buffer" },
    --         }),
    --       })
    --     end
    --   end,
    -- })
  end,
}
