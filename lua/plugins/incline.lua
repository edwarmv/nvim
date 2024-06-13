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
      hide = {
        cursorline = "focused_win",
        focused_win = true,
        only_win = false,
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
        },
        zindex = 1,
      },
    })
  end,
}
