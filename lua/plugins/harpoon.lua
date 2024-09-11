return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  keys = {
    {
      "gh",
      function()
        return '<cmd>lua require("harpoon"):list():select(vim.v.count)<cr>'
      end,
      expr = true,
      desc = "[Harpoon] - Navigate to File",
    },
    {
      "gah",
      function()
        require("harpoon"):list():add()
      end,
      expr = true,
      desc = "[Harpoon] - Add File",
    },
    {
      "gH",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(), { border = "rounded" })
      end,
      desc = "[Harpoon] - Toggle Quick Menu",
    },
    {
      "gch",
      function()
        require("harpoon"):list():clear()
      end,
      desc = "[Harpoon] - Clear items",
    },
  },
}
