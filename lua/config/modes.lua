-- local configuration = vim.fn["gruvbox_material#get_configuration"]()
-- local palette = vim.fn["gruvbox_material#get_palette"](
--   configuration.background,
--   configuration.foreground,
--   configuration.colors_override
-- )

require("modes").setup({
  -- colors = {
  --   copy = palette.yellow[1],
  --   delete = palette.red[1],
  --   insert = palette.green[1],
  --   visual = palette.blue[1],
  -- },

  -- Set opacity for cursorline and number background
  line_opacity = 0.15,

  -- Enable cursor highlights
  set_cursor = true,

  -- Enable cursorline initially, and disable cursorline for inactive windows
  -- or ignored filetypes
  set_cursorline = true,

  -- Enable line number highlights to match cursorline
  set_number = true,

  -- Disable modes highlights in specified filetypes
  -- Please PR commonly ignored filetypes
  ignore_filetypes = { "NvimTree", "TelescopePrompt" },
})
