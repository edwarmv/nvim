return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VimEnter",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  keys = {
    {
      "<m-a>",
      function()
        return require("harpoon"):list():select(1)
      end,
      desc = "[Harpoon] - Navigate to File(1)",
    },
    {
      "<m-s>",
      function()
        return require("harpoon"):list():select(2)
      end,
      desc = "[Harpoon] - Navigate to File(2)",
    },
    {
      "<m-q>",
      function()
        return require("harpoon"):list():select(3)
      end,
      desc = "[Harpoon] - Navigate to File(3)",
    },
    {
      "<m-w>",
      function()
        return require("harpoon"):list():select(4)
      end,
      desc = "[Harpoon] - Navigate to File(4)",
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
      "<leader>h",
      function()
        require("harpoon").ui:toggle_quick_menu(
          require("harpoon"):list(),
          { border = vim.o.winborder, ui_width_ratio = 0.3 }
        )
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
