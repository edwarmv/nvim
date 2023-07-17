return {
  "smjonas/inc-rename.nvim",
  enabled = false,
  dependencies = { "folke/noice.nvim" },
  config = function()
    require("inc_rename").setup()
    vim.keymap.set("n", "gLr", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "[LSP] IncRename" })
  end,
}
