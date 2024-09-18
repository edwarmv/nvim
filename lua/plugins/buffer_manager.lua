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
    format_function = function(file)
      if not file then
        return
      end
      -- for java jar class
      if vim.startswith(file, "jdt:/") then
        local package, name = file:match("/([^/]+)/([^/]+.class)?=")
        return string.format("%s %s", name, package)
      end

      local filename = file:match(".+/([^/]-)$")

      local directory = file:match("(.+)/[^/]-$")
      return string.format("%s %s", filename, directory)
    end,
    show_indicators = "before",
    order_buffers = "filename", -- filename, lastused
    win_extra_options = {
      cursorline = true,
      wrap = false,
    },
    width = 0.3,
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
