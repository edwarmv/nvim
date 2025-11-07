local function has_words_before()
  if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  event = { "InsertEnter" },
  dependencies = {
    -- "zbirenbaum/copilot.lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "abeldekat/cmp-mini-snippets",
    "onsails/lspkind-nvim",
    "windwp/nvim-autopairs",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
        completion = {
          col_offset = -2,
        },
      },
      view = {
        docs = {
          auto_open = true,
        },
        entries = {
          follow_cursor = true,
        },
      },
      performance = {
        max_view_entries = vim.o.pumheight,
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
        ["<c-f>"] = cmp.mapping(function(fallback)
          if cmp.visible_docs() then
            cmp.scroll_docs(4)
          -- elseif require("copilot.suggestion").is_visible() then
          --   require("copilot.suggestion").accept()
          else
            fallback()
          end
        end),
        ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        ["<c-e>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
          else
            fallback()
          end
        end),
        ["<c-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
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
        { name = "mini_snippets" },
        { name = "path" },
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
          show_labelDetails = true,
          ellipsis_char = "…",
        }),
      },
      experimental = {
        ghost_text = false,
      },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
