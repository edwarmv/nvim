local function highlightsInStacktrace(bufnr)
  vim.defer_fn(function()
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    vim.api.nvim_buf_call(bufnr, function()
      vim.fn.matchadd("WarningMsg", [[[^/]\+\.lua:\d\+\ze:]]) -- files with error
      vim.fn.matchadd("WarningMsg", [[E\d\+]]) -- vim error codes
    end)
  end, 1)
end

local function split_length(line, width)
  local text = {}
  local next_line
  while true do
    if #line == 0 then
      return text
    end
    next_line, line = line:sub(1, width), line:sub(width + 1)
    text[#text + 1] = next_line
  end
end

local function custom_wrap(lines, max_width)
  local right_pad = "  "
  local wrapped_lines = {}
  for _, line in pairs(lines) do
    local new_lines = split_length(line, max_width - #right_pad)
    for _, nl in ipairs(new_lines) do
      table.insert(wrapped_lines, nl:gsub("^%s+", "") .. right_pad)
    end
  end
  wrapped_lines[1] = " " .. (wrapped_lines[1] or "")
  return wrapped_lines
end

return {
  "rcarriga/nvim-notify",
  config = function()
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
      on_open = function(win, record)
        if not vim.api.nvim_win_is_valid(win) then
          return
        end

        -- put title into border PENDING https://github.com/rcarriga/nvim-notify/issues/279
        local opts = { border = vim.g.borderStyle }
        local hasTitle = record.title[1] and record.title[1] ~= ""
        if hasTitle then
          local title = " " .. record.title[1] .. " "
          if record.level ~= "INFO" then
            title = " " .. record.icon .. title
          end
          local titleHl = ("Notify%sTitle"):format(record.level)
          opts.title = { { title, titleHl } }
          opts.title_pos = "left"
        end
        vim.api.nvim_win_set_config(win, opts)

        local bufnr = vim.api.nvim_win_get_buf(win)
        highlightsInStacktrace(bufnr)
      end,

      top_down = true,

      -- Function called when a window is closed
      -- on_close = nil,

      -- Render function for notifications. See notify-render()
      render = function(bufnr, notif, highlights, config)
        local namespace = require("notify.render.base").namespace()
        local max_width = config.max_width() or 80
        local message = custom_wrap(notif.message, max_width)
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, message)

        -- add padding to the left/right
        for ln = 1, #message do
          vim.api.nvim_buf_set_extmark(bufnr, namespace, ln, 0, {
            virt_text = { { " ", highlights.body } },
            virt_text_pos = "inline",
            priority = 50,
          })
          vim.api.nvim_buf_set_extmark(bufnr, namespace, ln, 0, {
            virt_text = { { " ", highlights.body } },
            virt_text_pos = "right_align",
            priority = 50,
          })
        end
      end, -- default minimal

      -- Default timeout for notifications
      timeout = 3000,

      minimum_width = 1,
      -- Max number of columns for messages
      max_width = function()
        return math.floor(vim.opt.columns:get() * 0.3)
      end,
      -- Max number of lines for a message
      max_height = function()
        return math.floor(vim.opt.lines:get() * 0.2)
      end,

      -- For stages that change opacity this is treated as the highlight behind the window
      -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
      -- background_colour = "#32302f",
      -- background_colour = "Normal",

      -- Minimum width for notification windows
      -- minimum_width = 0,

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
