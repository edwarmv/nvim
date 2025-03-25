return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_better_performance = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_float_style = "dim"

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
      pattern = "gruvbox-material",
      callback = function()
        local config = vim.fn["gruvbox_material#get_configuration"]()
        local palette =
          vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
        local set_hl = vim.fn["gruvbox_material#highlight"]

        set_hl("ExtraWhitespace", palette.red, palette.bg_visual_red)
      end,
    })
  end,
}
