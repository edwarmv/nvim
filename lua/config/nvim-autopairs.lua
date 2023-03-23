-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- local cmp = require("cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local npairs = require("nvim-autopairs")

-- npairs.map_cr = function()
--   -- npairs.completion_confirm = function()
--   --   if vim.fn.pumvisible() ~= 0 then
--   --     return npairs.esc("<cr>")
--   --   else
--   --     return npairs.autopairs_cr()
--   --   end
--   -- end
--   vim.keymap.set("i", "<CR>", function()
--     if vim.fn.pumvisible() ~= 0 then
--       return npairs.esc("<cr>")
--     else
--       return npairs.autopairs_cr()
--     end
--   end, { expr = true, remap = false })
-- end

npairs.setup({
  disable_filetype = { "help" },
  map_cr = true,
  map_bs = true,
  map_c_w = true,
})

-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require("nvim-autopairs")
-- local cond = require('nvim-autopairs.conds')

-- npairs.get_rule('(')
--  :with_pair(function()
--    if vim.bo.filetype == 'html' then
--      return true
--    end
--  end)

-- npairs.get_rule('[')
--  :with_pair(function()
--    if vim.bo.filetype == 'html' then
--      return true
--    end
--  end)

-- npairs.get_rule('{')
--   :with_pair(function()
--    if vim.bo.filetype == 'plantuml' then
--      return true
--    end
--   end)

-- npairs.add_rules({
--   Rule('{', '}', {'tex', 'plantuml'})
--     :with_pair(cond.not_before_regex_check("..|", 3))
--     :with_pair(cond.not_before_regex_check("..o", 3))
-- })
