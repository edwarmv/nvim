return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      ft_ignore = { "neo-tree", "Trouble" },
      relculright = false,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa", sign = { colwidth = 1, auto = true } },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
        },
        {
          sign = { name = { "GitSigns" }, maxwidth = 1, auto = true },
          click = "v:lua.ScSa",
        },
        {
          text = {
            builtin.lnumfunc,
            " "
            -- function()
            --   return (vim.b.gitsigns_status == "" or vim.b.gitsigns_status == nil) and " " or ""
            -- end
          },
          sign = { auto = true },
          click = "v:lua.ScLa",
        },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
      },
    })
  end,
}
