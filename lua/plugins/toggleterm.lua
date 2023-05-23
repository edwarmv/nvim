return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 0.2 * (vim.o.lines - vim.o.cmdheight)
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
      open_mapping = [[<m-\>]],
      -- on_open = fun(t: Terminal), -- function to run when the terminal opens
      -- on_close = fun(t: Terminal), -- function to run when the terminal closes
      highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        NormalFloat = {
          link = "NormalFloat",
        },
        FloatBorder = {
          link = "FloatBorder",
        },
      },
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = false,
      -- shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      float_opts = {
        border = "rounded",
        width = function(_term)
          local width = math.ceil(vim.o.columns * 0.9)
          -- _term.float_opts.col = vim.o.columns
          return width
        end,
        height = function(_term)
          local height = math.ceil(vim.o.lines * 0.8)
          -- _term.float_opts.row = math.ceil(vim.o.lines - 2 / 2)
          return height
        end,
      },
    })

    -- vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>")
    vim.cmd("autocmd! TermOpen term://* tmap <m-\\> <cmd>ToggleTerm<cr>")
  end,
}
