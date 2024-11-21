return {
  "mg979/vim-visual-multi",
  event = "VimEnter",
  init = function()
    vim.keymap.set("n", "<Plug>(VM-Exit)", '<cmd>lua vim.fn["vm#reset"]()<cr>', { silent = true })

    vim.g.VM_set_statusline = 1
    vim.g.VM_silent_exit = 1
    vim.g.VM_show_warnings = 0
    vim.g.VM_mouse_mappings = 1

    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_start",
      callback = function()
        require("lualine").hide({ place = { "statusline" } })
        vim.keymap.set("n", "<leader>e", "<cmd>VMClear<cr>", { silent = true, buffer = true })
        vim.cmd("IBLDisable")
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_exit",
      callback = function()
        require("lualine").hide({ unhide = true })
        require("nvim-autopairs").force_attach()
        vim.cmd("nohlsearch")
        vim.cmd("IBLEnable")
      end,
    })

    vim.g.VM_maps = nil
    vim.g.VM_maps = {
      ["Find Under"] = "<M-C-d>",
      ["Find Subword Under"] = "<M-C-d>",
      ["Select Cursor Down"] = "<M-C-j>",
      ["Select Cursor Up"] = "<M-C-k>",
      ["Goto Next"] = "]]",
      ["Goto Prev"] = "[[",
    }
  end,
}
