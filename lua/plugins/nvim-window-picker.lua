return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  opts = {
    hint = "floating-letter",
    show_prompt = false,
    filter_rules = {
      autoselect_one = true,
      include_current_win = false,
      bo = {
        filetype = {
          "NvimTree",
          "neo-tree",
          "neo-tree-popup",
          "notify",
          "incline",
          "fidget",
          "packer",
          "qf",
          "diff",
          "fugitive",
          "fugitiveblame",
        },
        buftype = { "terminal", "nofile", "terminal", "help" },
      },
      wo = {},
      file_path_contains = {},
      file_name_contains = {},
    },
    highlights = {
      statusline = {
        focused = {
          fg = "#a9b1d6",
          bg = "#1f2335",
          bold = true,
        },
        unfocused = {
          fg = "#a9b1d6",
          bg = "#1f2335",
          bold = true,
        },
      },
      winbar = {
        focused = {
          fg = "#a9b1d6",
          bg = "#1f2335",
          bold = true,
        },
        unfocused = {
          fg = "#a9b1d6",
          bg = "#1f2335",
          bold = true,
        },
      },
    },
  },
  keys = {
    {
      "-",
      function()
        local _, picked_window_id = pcall(require("window-picker").pick_window)
        local cur_winid = vim.fn.win_getid()
        if picked_window_id and picked_window_id ~= cur_winid then
          vim.api.nvim_set_current_win(picked_window_id)
        end
      end,
      desc = "Pick a window",
    },
  },
}
