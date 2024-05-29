return {
  "vhyrro/luarocks.nvim",
  enabled = true,
  priority = 1000,
  config = true,
  opts = {
    rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
  },
}
