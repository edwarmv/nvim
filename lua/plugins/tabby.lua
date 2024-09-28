local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
  win = "TabLine",
  tail = "TabLine",
}

return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    line = function(line)
      return {
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep(" ", hl, theme.fill),
            tab.number(),
            tab.name(),
            line.sep(" ", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        hl = theme.fill,
      }
    end,
    -- option = {}, -- setup modules' option,
  },
}
