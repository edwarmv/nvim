return {
  "kevinhwang91/nvim-hlslens",
  dependencies = {
    "haya14busa/vim-asterisk",
  },
  opts = {},
  keys = {
    { "n", [[<Cmd>execute('normal! ' . v:count1 . 'n') | lua require('hlslens').start()<CR>]] },
    { "N", [[<Cmd>execute('normal! ' . v:count1 . 'N') | lua require('hlslens').start()<CR>]] },
    { "*", [[*<Cmd>lua require('hlslens').start()<CR>]] },
    { "#", [[#<Cmd>lua require('hlslens').start()<CR>]] },
    { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]] },
    { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]] },
    { "z*", [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]] },
    { "z#", [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]] },
  },
}
