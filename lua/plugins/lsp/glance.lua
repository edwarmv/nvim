return {
  "dnlhc/glance.nvim",
  cmd = "Glance",
  opts = function()
    local glance = require("glance")
    local actions = glance.actions

    return {
      preview_win_opts = {
        wrap = false,
      },
      detached = function(winid)
        return true
      end,
      folds = {
        fold_closed = "▶",
        fold_open = "▼",
      },
      indent_lines = {
        enable = false,
      },
      mappings = {
        list = {
          ["v"] = false,
          ["s"] = false,
          ["t"] = false,
          ["<c-v>"] = actions.jump_vsplit,
          ["<c-s>"] = actions.jump_split,
          ["<c-t>"] = actions.jump_tab,
        },
      },
    }
  end,
}
