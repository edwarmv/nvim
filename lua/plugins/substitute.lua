return {
  "gbprod/substitute.nvim",
  -- dependencies = { "gbprod/yanky.nvim" },
  config = function()
    require("substitute").setup({
      -- on_substitute = require("yanky.integration").substitute(),
    })

    vim.keymap.set("n", "cx", function()
      require("substitute.exchange").operator()
    end, { noremap = true })
    vim.keymap.set("n", "cxx", function()
      require("substitute.exchange").line()
    end, { noremap = true })
    vim.keymap.set("x", "X", function()
      require("substitute.exchange").visual()
    end, { noremap = true })
    vim.keymap.set("n", "cxc", function()
      require("substitute.exchange").cancel()
    end, { noremap = true })
  end,
}
