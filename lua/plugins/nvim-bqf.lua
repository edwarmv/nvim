return {
  "kevinhwang91/nvim-bqf",
  enabled = true,
  dependencies = { "junegunn/fzf" },
  ft = "qf",
  opts = {
    auto_enable = true,
    auto_resize_height = true,
    delay_syntax = 80,
    preview = {
      -- border_chars = { "│", "│", "─", "─", "┌", "┐", "└", "┘", "█" },
      border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
      winblend = 0,
      should_preview_cb = function(bufnr, qwinid)
        local ret = true
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local fsize = vim.fn.getfsize(bufname)
        if fsize > 100 * 1024 then
          -- skip file size greater than 100k
          ret = false
        elseif bufname:match("^fugitive://") then
          -- skip fugitive buffer
          ret = false
        end
        return ret
      end,
    },
    filter = {
      fzf = {
        extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
      },
    },
  },
}
