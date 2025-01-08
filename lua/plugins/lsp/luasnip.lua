return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "dsznajder/vscode-es7-javascript-react-snippets",
      build = "yarn install --frozen-lockfile && yarn compile",
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
      region_check_events = "CursorHold,InsertLeave",
      delete_check_events = "TextChanged,InsertEnter",
    })

    ls.filetype_extend("typescript", { "javascript" })

    vim.keymap.set({ "i", "s" }, "<C-c>", function()
      if ls.choice_active() then
        require("luasnip.extras.select_choice")()
      end
    end, { desc = "Select choice" })
  end,
}
