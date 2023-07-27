return {
  "b0o/incline.nvim",
  enabled = false,
  config = function()
    require("incline").setup({
      debounce_threshold = {
        falling = 50,
        rising = 10,
      },
      hide = {
        cursorline = "focused_win",
        focused_win = false,
        only_win = false,
      },
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "NormalFloat",
          },
          InclineNormalNC = {
            default = true,
            group = "NormalFloat",
          },
        },
      },
      ignore = {
        buftypes = "special",
        filetypes = {},
        floating_wins = true,
        unlisted_buffers = true,
        wintypes = "special",
      },
      render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
        -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        if vim.api.nvim_buf_get_option(props.buf, "readonly") then
          filename = filename .. " [-]"
        end
        if vim.api.nvim_buf_get_option(props.buf, "modified") then
          filename = filename .. " [+]"
        end
        return {
          { icon, guifg = color },
          { " " },
          { filename },
        }
      end,
      window = {
        margin = {
          horizontal = 0,
          vertical = 1,
        },
        options = {
          signcolumn = "no",
          wrap = false,
        },
        padding = 1,
        padding_char = " ",
        placement = {
          horizontal = "right",
          vertical = "top",
        },
        width = "fit",
        winhighlight = {
          active = {
            EndOfBuffer = "None",
            Normal = "Statusline",
            Search = "None",
          },
          inactive = {
            EndOfBuffer = "None",
            Normal = "StatuslineNC",
            Search = "None",
          },
        },
        zindex = 1,
      },
    })

    vim.api.nvim_create_user_command("InclineUpdate", function()
      require("incline.manager").update({ refresh = true })
      -- manager.update({ refresh = true })
      -- pcall(require("incline.manager").update())
    end, {})

    vim.keymap.set("n", "<c-w>r", "<c-w>r:InclineUpdate<cr>", { silent = true })
    vim.keymap.set("n", "<c-w>=", "<c-w>=:InclineUpdate<cr>", { silent = true })
    vim.keymap.set("n", "<c-l>", "<c-l>:nohl<cr>:InclineUpdate<cr>", { silent = true })

    vim.api.nvim_create_autocmd({ "FocusLost", "FocusGained" }, {
      callback = function()
        require("incline").enable()
      end,
    })
  end,
}
