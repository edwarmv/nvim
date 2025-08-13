return {
  "sainnhe/gruvbox-material",
  enabled = false,
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
    vim.g.gruvbox_material_disable_terminal_colors = 1

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
