local defaults = require("config.defaults")
---@diagnostic disable: missing-fields
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "anuvyklack/hydra.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-calc",
    { "dcampos/cmp-emmet-vim", dependencies = { "mattn/emmet-vim" } },
    -- "ray-x/cmp-treesitter",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = { "L3MON4D3/LuaSnip" },
    },
  },
  config = function()
    -- require("plugins.nvim-cmp.custom")
    local utils = require("plugins.nvim-cmp.utils")
    local luasnip = require("luasnip")
    local types = require("cmp.types")
    local cmp = require("cmp")
    local debounce = require("plugins.nvim-cmp.debounce")

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      preselect = cmp.PreselectMode.None,
      -- completion = {
      --   autocomplete = false,
      -- },
      window = { --{{{
        completion = {
          border = defaults.border,
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,Search:None",
        },
        documentation = {
          max_width = math.floor(vim.opt.columns:get() / 3),
          max_height = math.floor(vim.opt.lines:get() / 3),
          border = defaults.border,
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,Search:None",
        },
      }, --}}}
      view = {
        docs = {
          auto_open = true,
        },
      },
      mapping = { --{{{
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
            fallback()
          end,
        }),
        ["<c-p>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.locally_jumpable(-1) then
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
            fallback()
          end,
        }),
        ["<m-f>"] = cmp.mapping.scroll_docs(1),
        ["<m-b>"] = cmp.mapping.scroll_docs(-1),
        ["<c-e>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.close()
            -- feedkey("<c-g>u", "i")
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
        ["<c-y>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              })
            else
              fallback()
              -- feedkey("<c-g>u", "i")
            end
          end,
          c = function(fallback)
            if cmp.visible() then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              })
            else
              fallback()
            end
          end,
        }),
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              })
            else
              fallback()
              -- feedkey("<c-g>u", "i")
            end
          end,
          c = function(fallback)
            fallback()
          end,
        }),
        ["<tab>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              debounce.cancel_autocomplete = true
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif utils.has_words_before() then
              debounce.cancel_autocomplete = true
              cmp.complete()
            else
              fallback()
            end
          end,
          c = function(fallback)
            if cmp.visible() then
              debounce.cancel_autocomplete = true
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              -- fallback()
              cmp.complete()
            end
          end,
        }),
        ["<s-tab>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              debounce.cancel_autocomplete = true
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end,
          c = function(fallback)
            if cmp.visible() then
              debounce.cancel_autocomplete = true
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
        -- ["<c-z>s"] = cmp.mapping({
        --   i = function()
        --     cmp.complete({
        --       config = {
        --         sources = {
        --           { name = "luasnip" },
        --         },
        --       },
        --     })
        --   end,
        -- }),
        -- ["<c-z>p"] = cmp.mapping({
        --   i = function()
        --     cmp.complete({
        --       config = {
        --         sources = {
        --           { name = "path" },
        --         },
        --       },
        --     })
        --   end,
        -- }),
        -- ["<c-z>c"] = cmp.mapping({
        --   i = function()
        --     cmp.complete({
        --       config = {
        --         sources = {
        --           { name = "cacl" },
        --         },
        --       },
        --     })
        --   end,
        -- }),
      }, --}}}
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = "luasnip" },
        { name = "buffer" },
      }),
      formatting = { --{{{
        fields = {
          cmp.ItemField.Kind,
          cmp.ItemField.Abbr,
          cmp.ItemField.Menu,
        },
        format = require("lspkind").cmp_format({
          -- with_text = false,
          mode = "symbol",
          before = function(_, vim_item)
            local width = math.floor(vim.opt.columns:get() / 4)
            if #vim_item.abbr > width then
              vim_item.abbr = string.sub(vim_item.abbr, 1, width - 1) .. "…"
            end
            return vim_item
          end,
        }),
      }, --}}}
      experimental = {
        ghost_text = false,
      },
    })

    cmp.setup.cmdline(":", {
      -- completion = {
      --   autocomplete = false,
      -- },
      sources = cmp.config.sources({
        { name = "cmdline" },
      }, {
        { name = "path" },
      }),
      formatting = {
        fields = {
          cmp.ItemField.Abbr,
        },
      },
    })

    require("cmp").setup.cmdline("/", {
      -- completion = {
      --   autocomplete = false,
      -- },
      sources = cmp.config.sources({
        { name = "buffer" },
      }, {
        { name = "nvim_lsp_document_symbol" },
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
    -- vim.api.nvim_create_autocmd({ "TextChangedI" }, {
    --   -- group = vim.api.nvim_create_augroup("CmpDebounceAuGroup", {}),
    --   callback = function()
    --     debounce.cancel_autocomplete = true
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
  end,
}
-- vim: foldmethod=marker
