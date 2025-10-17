return {
  "mg979/vim-visual-multi",
  enabled = false,
  event = "VimEnter",
  init = function()
    vim.g.VM_set_statusline = 1
    vim.g.VM_silent_exit = 1
    vim.g.VM_show_warnings = 0
    vim.g.VM_mouse_mappings = 1

    vim.g.VM_maps = {
      ["Goto Next"] = "]]",
      ["Goto Prev"] = "[[",
      ["Add Cursor up"] = "<up>",
      ["Add Cursor Down"] = "<down>",
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_start",
      callback = function()
        require("lualine").hide({ place = { "statusline" } })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_exit",
      callback = function()
        require("lualine").hide({ unhide = true })
        vim.cmd("nohlsearch")
      end,
    })
  end,
}
