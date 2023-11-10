return {
  "ThePrimeagen/harpoon",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({
      global_settings = {
        excluded_filetypes = { "harpoon", "" },
      },
      menu = {
        width = math.floor(vim.api.nvim_win_get_width(0) * 0.3),
        height = math.floor(vim.api.nvim_win_get_height(0) * 0.4),
      },
    })

    vim.keymap.set("n", "gh", function()
      return '<cmd>lua require("harpoon.ui").nav_file(vim.v.count)<CR>'
    end, { expr = true })

    vim.keymap.set("n", "gah", function()
      pcall(require("harpoon.mark").add_file)
    end, { desc = "[Harpoon] - Add File" })

    vim.keymap.set("n", "gH", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "[Harpoon] - Toggle Quick Menu" })
  end,
}
