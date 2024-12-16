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
    short_term_names = true,
    format_function = function(file)
      return vim.fn.fnamemodify(file, ":t")
    end,
    order_buffers = "filename", -- filename, lastused
    win_extra_options = {
      cursorline = true,
      wrap = true,
    },
    width = 0.4,
    height = 0.2,
  },
  keys = {
    {
      "<space>b",
      function()
        require("buffer_manager.ui").toggle_quick_menu()
      end,
      desc = "Buffer Manager",
    },
  },
}
