return {
  "sainnhe/everforest",
  enabled = false,
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.everforest_enable_italic = true
    vim.g.everforest_dim_inactive_windows = true
    vim.g.everforest_better_performance = true
    vim.g.everforest_disable_terminal_colors = 1

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("custom_highlights_everforest", {}),
      pattern = "everforest",
      callback = function()
        local config = vim.fn["everforest#get_configuration"]()
        local palette = vim.fn["everforest#get_palette"](config.background, config.colors_override)
        local set_hl = vim.fn["everforest#highlight"]

        set_hl("LuasnipInsertNodePassive", palette.none, palette.bg_visual)
        set_hl("LuasnipChoiceNodePassive", palette.none, palette.bg_visual)
        set_hl("ExtraWhitespace", palette.red, palette.bg_red)
      end,
    })
  end,
}
