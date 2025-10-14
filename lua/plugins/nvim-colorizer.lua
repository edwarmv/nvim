return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = {
      "*", -- Highlight all files, but customize some others.
      "!toggleterm",
      "!blink-cmp-menu",
      "!blink-cmp-documentation",
      "!cmp_menu",
      "!cmp_docs",
    },
    buftypes = {
      "*",
      -- exclude prompt and popup buftypes from highlight
      "!prompt",
      "!popup",
      "!terminal",
    },
    user_default_options = {
      mode = "virtualtext", -- background | virtualtext
      virtualtext_inline = "before",
      tailwind = true,
      css = true,
      virtualtext = "",
    },
  },
}
