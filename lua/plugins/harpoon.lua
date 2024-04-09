return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    vim.keymap.set("n", "gh", function()
      return '<cmd>lua require("harpoon"):list():select(vim.v.count)<cr>'
    end, { expr = true, desc = "[Harpoon] - Navigate to File" })

    vim.keymap.set("n", "gah", function()
      harpoon:list():add()
    end, { expr = true, desc = "[Harpoon] - Add File" })

    vim.keymap.set("n", "gH", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded" })
    end, { desc = "[Harpoon] - Toggle Quick Menu" })

    vim.keymap.set("n", "gch", function()
      harpoon:list():clear()
    end, { desc = "[Harpoon] - Clear items" })
  end,
}
