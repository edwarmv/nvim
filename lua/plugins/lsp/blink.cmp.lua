local defaults = require("config.defaults")

return {
  "saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = {
        "select_and_accept",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          opts = { tailwind_color_icon = "" },
          fallbacks = {},
        },
      },
    },
    snippets = { preset = "luasnip" },
    completion = {
      documentation = {
        auto_show_delay_ms = 200,
        auto_show = true,
        window = {
          border = "padded",
        },
      },
      trigger = {
        show_on_backspace = true,
      },
      menu = {
        max_height = 6,
        border = "none",
        draw = {
          padding = 0,
          components = {
            kind_icon = {
              text = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, _ = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then
                    return mini_icon .. ctx.icon_gap
                  end
                end

                local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })

                if ctx.item.source_name == "LSP" then
                  local color_item =
                    require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr ~= "" then
                    icon = color_item.abbr
                  end
                end

                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from mini.icons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then
                    return mini_hl
                  end
                end

                if ctx.item.source_name == "LSP" then
                  local color_item =
                    require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then
                    return color_item.abbr_hl_group
                  end
                end

                return ctx.kind_hl
              end,
            },
            kind = {
              -- Optional, use highlights from mini.icons
              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then
                    return mini_hl
                  end
                end
                return ctx.kind_hl
              end,
            },
          },
        },
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = defaults.border,
      },
    },
    fuzzy = {
      sorts = {
        function(a, b)
          if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
            return
          end
          return b.client_name == "emmet_language_server"
        end,
        "exact",
        "score",
        "sort_text",
      },
    },
  },
}
