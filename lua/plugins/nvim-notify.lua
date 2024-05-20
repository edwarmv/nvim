return {
  "rcarriga/nvim-notify",
  config = function()
    local defaults = require("config.defaults")
    require("notify").setup({
      -- Animation style (see below for details)
      stages = "static", -- fade_in_slide_out, fade, slide, static

      -- Function called when a new window is opened, use for changing win settings/config
      -- on_open = function(win)
      --   if vim.api.nvim_win_is_valid(win) then
      --     vim.api.nvim_win_set_config(win, { border = defaults.border })
      --     -- vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat,NormalFloat:NormalFloat,FloatBorder:FloatBorder")
      --   end
      -- end,

      top_down = true,

      -- Function called when a window is closed
      -- on_close = nil,

      -- Render function for notifications. See notify-render()
      render = "minimal", -- default minimal

      -- Default timeout for notifications
      timeout = 3000,

      -- Max number of columns for messages
      max_width = function()
        return math.floor(vim.opt.columns:get() * 0.35)
      end,
      -- Max number of lines for a message
      max_height = 1,

      -- For stages that change opacity this is treated as the highlight behind the window
      -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
      -- background_colour = "#32302f",
      background_colour = "Normal",

      -- Minimum width for notification windows
      minimum_width = 0,

      -- Icons for the different levels
      icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = "✎ ",
      },
    })
    require("telescope").load_extension("notify")
    vim.api.nvim_create_user_command("Notify", "Telescope notify", {})
    -- vim.cmd([[hi link NotifyERRORBody NormalFloat]])
    -- vim.cmd([[hi link NotifyWARNBody NormalFloat]])
    -- vim.cmd([[hi link NotifyINFOBody NormalFloat]])
    -- vim.cmd([[hi link NotifyDEBUGBody NormalFloat]])

    local banned_messages = { "No information available" }

    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      require("notify")(msg, ...)
    end
  end,
}
