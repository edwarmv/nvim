return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "echasnovski/mini.icons" },
  },
  opts = {
    hide_handbook = true, -- set to true to hide the shortcuts on menu.
    hide_buffer_handbook = true, --set to true to hide shortcuts on buffer menu
    leader_key = "gh", -- Recommended to be a single key
    buffer_leader_key = "gH", -- Per Buffer Mappings
    window = {
      border = "rounded",
    },
    mappings = {
      open_vertical = "<c-v>",
      open_horizontal = "<c-s>",
    },
  },
}
