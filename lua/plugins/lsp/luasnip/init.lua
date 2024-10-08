return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "dsznajder/vscode-es7-javascript-react-snippets",
      build = "yarn install --frozen-lockfile && yarn compile",
    },
  },
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local types = require("luasnip.util.types")
    require("plugins.lsp.luasnip.snippets")
    require("luasnip.config").setup({
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      ext_opts = {
        [types.insertNode] = {
          snippet_passive = {
            virt_text = { { "$", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
        -- Add this to also have a placeholder in the final tabstop.
        -- See the discussion below for more context.
        [types.exitNode] = {
          snippet_passive = {
            virt_text = { { "$", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
      },
    })
    local ls = require("luasnip")

    vim.api.nvim_create_autocmd("ModeChanged", {
      callback = function()
        if
          ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
          and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
          and not ls.session.jump_active
        then
          ls.unlink_current()
        end
      end,
    })
  end,
}
