local function filename_and_parent(path, sep)
  local segments = vim.split(path, sep)
  if #segments == 0 then
    return path
  elseif #segments == 1 then
    return segments[#segments]
  else
    return table.concat({ segments[#segments - 1], segments[#segments] }, sep)
  end
end

return {
  "b0o/incline.nvim",
  enabled = true,
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
        local filename = bufname ~= "" and filename_and_parent(vim.fn.fnamemodify(bufname, "%:p:~"), "/") or "[No Name]"
        -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        if vim.api.nvim_get_option_value("readonly", { buf = props.buf }) then
          filename = filename .. " [-]"
        end
        if vim.api.nvim_get_option_value("modified", { buf = props.buf }) then
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
          vertical = 0,
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
  end,
}
