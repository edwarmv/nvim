return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        {
          "b:gitsigns_head",
          icon = "",
          fmt = function(value)
            if value ~= "" then
              local max_width = vim.o.columns * 1 / 6
              return string.len(value) <= max_width and value or string.sub(value, 1, max_width) .. "…"
            end
            return ""
          end,
        },
      },
      lualine_c = {
        "aerial",
      },
      lualine_x = {
        { "filetype" },
        {
          "macro",
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Recording @" .. reg
            end
            return nil
          end,
          color = function()
            return { fg = vim.g.terminal_color_3 }
          end,
          padding = { left = 0, right = 1 },
        },
        { "searchcount", padding = { left = 0, right = 1 } },
        { "selectioncount", padding = { left = 0, right = 1 } },
        { "zoom#statusline", padding = { left = 0, right = 1 } },
        { "ObsessionStatus", padding = { left = 0, right = 1 } },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = {
      "aerial",
      "fugitive",
      "fzf",
      "lazy",
      "man",
      "mason",
      "neo-tree",
      "nvim-dap-ui",
      "nvim-tree",
      "oil",
      "overseer",
      "quickfix",
      "toggleterm",
      "trouble",
    },
  },
}
