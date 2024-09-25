local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("html", {
  s({
    trig = "target",
    name = "Open link in a new tab",
    dscr = "@see https://www.freecodecamp.org/news/how-to-use-html-to-open-link-in-new-tab/",
  }, {
    t('target="_blank" rel="noopener noreferrer"'),
  }),
})
