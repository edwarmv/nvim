local M = {}

local cached_hl_groups = {}

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    cached_hl_groups = {}
  end,
})

function M.get_hl(name)
  if cached_hl_groups[name] == nil then
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false, create = false })
    for k, v in pairs(hl) do
      if k == "fg" or k == "bg" then
        hl[k] = string.format("#%06x", v)
      end
    end
    cached_hl_groups[name] = hl
  end

  return cached_hl_groups[name]
end

return M
