return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  opts = {
    hint = "floating-big-letter",
    show_prompt = false,
    picker_config = {
      floating_big_letter = {
        font = {
          a = "a",
          b = "b",
          c = "c",
          d = "d",
          e = "e",
          f = "f",
          g = "g",
          h = "h",
          i = "i",
          j = "j",
          k = "k",
          l = "l",
          m = "m",
          n = "n",
          o = "o",
          p = "p",
          q = "q",
          r = "r",
          s = "s",
          t = "t",
          u = "u",
          v = "v",
          w = "w",
          x = "x",
          y = "y",
          z = "z",
          ["1"] = "1",
          ["2"] = "2",
          ["3"] = "3",
          ["4"] = "4",
          ["5"] = "5",
          ["6"] = "6",
          ["7"] = "7",
          ["8"] = "8",
          ["9"] = "9",
          ["0"] = "0",
        }, -- ansi-shadow |
      },
    },
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
  -- config = function()
  -- vim.keymap.set("n", "-", function()
  --   local _, picked_window_id = pcall(require("window-picker").pick_window)
  --   local cur_winid = vim.fn.win_getid()
  --   if picked_window_id and picked_window_id ~= cur_winid then
  --     vim.api.nvim_set_current_win(picked_window_id)
  --   end
  -- end, { desc = "Pick a window" })

  -- vim.api.nvim_create_user_command("WindowPicker", function()
  --   local _, picked_window_id = pcall(require("window-picker").pick_window)
  --   local cur_winid = vim.fn.win_getid()
  --   if picked_window_id and picked_window_id ~= cur_winid then
  --     vim.api.nvim_set_current_win(picked_window_id)
  --   end
  -- end, {})
  --
  -- vim.keymap.set("n", "-", "<cmd>WindowPicker<cr>")
  -- end,
  -- keys = {
  --   {
  --     "-",
  --     function()
  --       local _, picked_window_id = pcall(require("window-picker").pick_window)
  --       local cur_winid = vim.fn.win_getid()
  --       if picked_window_id and picked_window_id ~= cur_winid then
  --         vim.api.nvim_set_current_win(picked_window_id)
  --       end
  --     end,
  --     desc = "Pick a window",
  --   },
  -- },
}
