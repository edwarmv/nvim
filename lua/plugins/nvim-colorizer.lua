return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = {
      "*", -- Highlight all files, but customize some others.
      "!toggleterm",
    },
    buftypes = {
      "*",
      -- exclude prompt and popup buftypes from highlight
      "!prompt",
      "!popup",
      "!terminal",
    },
    user_default_options = {
      mode = "virtualtext",
      virtualtext_inline = "before",
      tailwind = true,
      css = true,
    },
  },
}
