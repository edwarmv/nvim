local buf_nr = vim.api.nvim_get_current_buf()

vim.api.nvim_create_autocmd("BufWinLeave", {
  buffer = buf_nr,
  callback = function()
    -- print("Leaving buffer " .. buf_nr)
    vim.cmd("write") -- or any other command you want to run
  end,
})
