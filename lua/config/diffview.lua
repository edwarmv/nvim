local custom_hl = require("diffview.hl")
custom_hl.get_hl = function(name, no_trans)
  local hl

  if no_trans then
    hl = vim.api.nvim__get_hl_defs and vim.api.nvim__get_hl_defs(0)[name] or vim.api.nvim_get_hl(0, { name = name })
  else
    local id = vim.api.nvim_get_hl_id_by_name(name)

    if id then
      hl = vim.api.nvim_get_hl_by_id and vim.api.nvim_get_hl_by_id(id, true) or vim.api.nvim_get_hl(0, { id = id })
    end
  end
  if hl then
    if hl.foreground then
      hl.fg = string.format("#%06x", hl.foreground)
    end
    if hl.background then
      hl.bg = string.format("#%06x", hl.background)
    end
    if hl.special then
      hl.sp = string.format("#%06x", hl.special)
    end
    return hl
  end
end

require("diffview").setup()
