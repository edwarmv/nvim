return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "dsznajder/vscode-es7-javascript-react-snippets",
      build = "npx --yes yarn install --frozen-lockfile && npx yarn compile",
    },
    "louiss0/astro-snippets",
  },
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.env.HOME .. "/.config/nvim/snippets" })
    local types = require("luasnip.util.types")
    vim.api.nvim_set_hl(0, "LuasnipInsertNodePassive", { underdotted = true })
    vim.api.nvim_set_hl(0, "LuasnipChoiceNodePassive", { underdotted = true })
    ls.setup({
      update_events = { "TextChanged", "TextChangedI", "TextChangedP" },
      region_check_events = { "CursorHold", "InsertLeave" },
      delete_check_events = { "TextChangedI", "InsertEnter" },
    })

    ls.filetype_extend("typescript", { "javascript" })

    vim.keymap.set({ "i", "s" }, "<C-c>", function()
      if ls.choice_active() then
        require("luasnip.extras.select_choice")()
      end
    end, { desc = "Select choice" })

    vim.api.nvim_create_autocmd("ModeChanged", {
      group = vim.api.nvim_create_augroup("mariasolos/unlink_snippet", { clear = true }),
      desc = "Cancel the snippet session when leaving insert mode",
      pattern = { "*:n" },
      callback = function(args)
        if
          ls.session
          and ls.session.current_nodes[args.buf]
          and not ls.session.jump_active
          and not ls.choice_active()
        then
          ls.unlink_current()
        end
      end,
    })
  end,
}
