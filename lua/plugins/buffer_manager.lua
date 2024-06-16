return {
  "j-morano/buffer_manager.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    select_menu_item_commands = {
      v = {
        key = "<C-v>",
        command = "vsplit",
      },
      h = {
        key = "<C-s>",
        command = "split",
      },
      t = {
        key = "<C-t>",
        command = "tabnew",
      },
    },
    show_indicators = "after",
    short_file_names = false,
    format_function = function(file)
      if not file then
        return
      end
      return string.format("%s │ %s", vim.fn.fnamemodify(file, ":t"), vim.fn.fnamemodify(file, ":p:."))
    end,
    order_buffers = "lastused",
    win_extra_options = {
      cursorline = true,
      wrap = false,
    },
    width = 0.4,
    height = 0.3,
  },
  keys = {
    {
      "<space>b",
      function()
        require("buffer_manager.ui").toggle_quick_menu()
      end,
      desc = "Telescope - Commands",
    },
  },
}
