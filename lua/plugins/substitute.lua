return {
  "gbprod/substitute.nvim",
  dependencies = { "gbprod/yanky.nvim" },
  config = function()
    require("substitute").setup({
      on_substitute = require("yanky.integration").substitute(),
    })

    vim.keymap.set("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
    vim.keymap.set("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
    vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
    vim.keymap.set("n", "cxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
  end,
}
