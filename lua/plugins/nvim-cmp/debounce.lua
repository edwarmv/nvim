local M = {}
local cmp = require("cmp")
local timer = vim.loop.new_timer()

local DEBOUNCE_DELAY = 300
M.cancel_autocomplete = false

function M.debounce()
  -- local a = M.cancel_autocomplete and "true" or "false"
  -- print("cancel: " .. a .. math.random())
  -- vim.notify("cancel: " .. a .. math.random())
  -- M.cancel_autocomplete = false
  timer:stop()
  timer:start(
    DEBOUNCE_DELAY,
    0,
    vim.schedule_wrap(function()
      -- print("cb" .. math.random())
      if not M.cancel_autocomplete then
        cmp.complete({ reason = cmp.ContextReason.Auto })
        --   M.cancel_autocomplete = false
        -- else
        -- cmp.abort()
      end
    end)
  )
end

return M
