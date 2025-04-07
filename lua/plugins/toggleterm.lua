local defaults = require("config.defaults")

return {
  "akinsho/toggleterm.nvim",
  init = function()
    vim.api.nvim_create_user_command("FTerm", "ToggleTerm direction=float", {})
    vim.api.nvim_create_user_command("VTerm", function(opts)
      vim.fn.execute(opts.count .. "ToggleTerm direction=vertical")
    end, { count = true })
    vim.api.nvim_create_user_command("STerm", function(opts)
      vim.fn.execute(opts.count .. "ToggleTerm direction=horizontal")
    end, { count = true })
    vim.api.nvim_create_user_command("TTerm", "ToggleTerm direction=tab", {})

    function _G.set_terminal_keymaps()
      local esc_timer
      vim.keymap.set("t", "<esc>", function(self)
        esc_timer = esc_timer or (vim.uv or vim.loop).new_timer()
        if esc_timer:is_active() then
          esc_timer:stop()
          vim.cmd("stopinsert")
        else
          esc_timer:start(200, 0, function() end)
          return "<esc>"
        end
      end, { buffer = 0, expr = true, desc = "Double escape to normal mode" })
    end
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor((vim.o.lines - vim.o.cmdheight) / 3)
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns / 3)
      end
    end,
    open_mapping = [[<c-\>]],
    highlights = {
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float',
    shade_terminals = false,
    float_opts = {
      border = defaults.border,
      width = function(_term)
        local width = math.floor(vim.o.columns * 0.7)
        return width
      end,
      height = function(_term)
        local height = math.floor(vim.o.lines * 0.7)
        return height
      end,
    },
  },
}
