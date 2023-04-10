local M = {}

local timer = vim.loop.new_timer()

local DEBOUNCE_DELAY = 300

function M.debounce()
  timer:stop()
  timer:start(
    DEBOUNCE_DELAY,
    0,
    vim.schedule_wrap(function()
        -- print('refresh'..math.random())
        vim.api.nvim_command("IndentBlanklineRefresh")
    end)
  )
end

return M
