return {
  "luukvbaal/statuscol.nvim",
  enabled = false,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      ft_ignore = { "neo-tree", "Trouble" },
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa", sign = { colwidth = 1, auto = true } },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
        },
        {
          text = {
            builtin.lnumfunc,
            -- function()
            --   return vim.opt_local.number:get() and " " or ""
            --   -- return (vim.b.gitsigns_head == nil) and " " or ""
            -- end,
          },
          sign = { auto = true },
          click = "v:lua.ScLa",
        },
        {
          sign = { namespace = { "gitsigns" }, maxwidth = 1, auto = true, wrap = true },
          click = "v:lua.ScSa",
        },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
      },
    })
  end,
}
