vim.g.sandwich_no_default_key_mappings = 1
vim.g.operator_sandwich_no_default_key_mappings = 1
-- vim.g['sandwich#recipes'] = vim.g['sandwich#default_recipes']

function TableConcat(t1,t2)
   for i=1,#t2 do
      t1[#t1+1] = t2[i]
   end
   return t1
end

local a = vim.g['sandwich#default_recipes']

local b = {
  {buns={'{ ', ' }'}, nesting=1, match_syntax=1,
   kind={'add', 'replace'}, action={'add'}, input={'{'}},

  {buns={'[ ', ' ]'}, nesting=1, match_syntax=1,
   kind={'add', 'replace'}, action={'add'}, input={'['}},

  {buns={'( ', ' )'}, nesting=1, match_syntax=1,
   kind={'add', 'replace'}, action={'add'}, input={'('}},

  {buns={'{\\s*', '\\s*}'},   nesting=1, regex=1,
   match_syntax=1, kind={'delete', 'replace', 'textobj'},
   action={'delete'}, input={'{'}},

  {buns={'[\\s*', '\\s*\\]'}, nesting=1, regex=1,
   match_syntax=1, kind={'delete', 'replace', 'textobj'},
   action={'delete'}, input={'['}},

  {buns={'(\\s*', '\\s*)'},   nesting=1, regex=1,
   match_syntax=1, kind={'delete', 'replace', 'textobj'},
   action={'delete'}, input={'('}},
}
-- print(vim.inspect(TableConcat(a, b)))

vim.g['sandwich#recipes'] = TableConcat(a, b)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sa",
  "<Plug>(operator-sandwich-add)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "x",
  "<leader>sa",
  "<Plug>(operator-sandwich-add)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "x",
  "<leader>sd",
  "<Plug>(operator-sandwich-delete)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "x",
  "<leader>sr",
  "<Plug>(operator-sandwich-replace)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sd",
  "<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sr",
  "<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sdb",
  "<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)",
  { noremap = false, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>srb",
  "<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)",
  { noremap = false, silent = true, expr = false }
)
-- nmap <leader>sa <Plug>(operator-sandwich-add)
-- xmap <leader>sa <Plug>(operator-sandwich-add)
-- xmap <leader>sd <Plug>(operator-sandwich-delete)
-- xmap <leader>sr <Plug>(operator-sandwich-replace)
-- nmap <silent> <leader>sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
-- nmap <silent> <leader>sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
-- nmap <silent> <leader>sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
-- nmap <silent> <leader>srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
