local M = {}

M.sourceVim = function(name)
  vim.cmd("source " .. vim.fn.printf("%s/vim/%s", vim.fn.stdpath("config"), name))
end

return M
