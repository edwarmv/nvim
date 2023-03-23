" **************
" vim-sandwich
" **************
" call operator#sandwich#set('all', 'all', 'highlight', 0)
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
" if you have not copied default recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:sandwich#recipes += [
  \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
  \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
  \
  \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
  \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
  \
  \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
  \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
  \
  \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
  \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
  \    'action': ['delete'], 'input': ['{']},
  \
  \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
  \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
  \    'action': ['delete'], 'input': ['[']},
  \
  \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
  \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
  \    'action': ['delete'], 'input': ['(']},
  \ ]

" maps *********
nmap <leader>sa <Plug>(operator-sandwich-add)
xmap <leader>sa <Plug>(operator-sandwich-add)
xmap <leader>sd <Plug>(operator-sandwich-delete)
xmap <leader>sr <Plug>(operator-sandwich-replace)
nmap <silent> <leader>sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> <leader>sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> <leader>sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> <leader>srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

