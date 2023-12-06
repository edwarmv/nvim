return {
  "luukvbaal/statuscol.nvim",
  enabled = true,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      ft_ignore = { "neo-tree", "Trouble" },
      relculright = true,
      segments = {
        {
          sign = { name = { "Dap*" }, maxwidth = 1, colwidth = 1, auto = true },
          click = "v:lua.ScLa",
        },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa", sign = { colwidth = 1, auto = true } },
        {
          sign = { name = { "todo*" }, maxwidth = 1, colwidth = 2, auto = true },
        },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
        },
        {
          text = {
            builtin.lnumfunc,
            function()
              -- return vim.opt_local.number:get() and " " or ""
              if vim.opt_local.number:get() and vim.b.gitsigns_status == "" then
                return " "
              else
                return ""
              end
            end,
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
