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
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    local types = require("luasnip.util.types")
    require("plugins.lsp.luasnip.snippets")
    vim.api.nvim_set_hl(0, "LuaSnipPlace", { bg = "#3b4261", italic = true })
    luasnip.setup({
      ext_opts = {
        [types.insertNode] = {
          unvisited = {
            hl_group = "LuaSnipPlace",
            -- virt_text = { { "$", "Conceal" } },
            -- virt_text_pos = "inline",
          },
        },
        [types.choiceNode] = {
          unvisited = {
            hl_group = "LuaSnipPlace",
            -- virt_text = { { "$", "Conceal" } },
            -- virt_text_pos = "inline",
          },
        },
        -- Add this to also have a placeholder in the final tabstop.
        -- See the discussion below for more context.
        -- [types.exitNode] = {
        --   unvisited = {
        --     virt_text = { { " ", "LuaSnipPlace" } },
        --     virt_text = { { "$0", "Conceal" } },
        --     virt_text_pos = "inline",
        --   },
        -- },
      },
    })

    vim.keymap.set({ "i", "s" }, "<C-c>", function()
      if luasnip.choice_active() then
        require("luasnip.extras.select_choice")()
      end
    end, { desc = "Select choice" })

    vim.api.nvim_create_autocmd("ModeChanged", {
      group = vim.api.nvim_create_augroup("mariasolos/unlink_snippet", { clear = true }),
      desc = "Cancel the snippet session when leaving insert mode",
      pattern = { "s:n", "i:*" },
      callback = function(args)
        if
          luasnip.session
          and luasnip.session.current_nodes[args.buf]
          and not luasnip.session.jump_active
          and not luasnip.choice_active()
        then
          luasnip.unlink_current()
        end
      end,
    })
  end,
}
