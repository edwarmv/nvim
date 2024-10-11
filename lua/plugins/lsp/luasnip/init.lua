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
      ext_opts = {
        [types.insertNode] = {
          unvisited = {
            virt_text = { { "$", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
        -- Add this to also have a placeholder in the final tabstop.
        -- See the discussion below for more context.
        [types.exitNode] = {
          unvisited = {
            virt_text = { { "$0", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
      },
    })

    -- https://github.com/L3MON4D3/LuaSnip/issues/258
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = { "s:n", "i:*" },
      callback = function()
        local ls = require("luasnip")
        if ls.session.current_nodes[vim.api.nvim_get_current_buf()] and not ls.session.jump_active then
          ls.unlink_current()
        end
      end,
    })
  end,
}
