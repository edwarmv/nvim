local ls = require("luasnip")
local s = ls.snippet
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets("dart", {
  s("Flutter stateless widget", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    t("class "),
    i(1, "MyWidget"),
    t(" extends StatelessWidget {"),
    t({ "", "\tconst " }),
    rep(1),
    t("({super.key});"),
    t({ "", "", "\t@override", "\tWidget build(BuildContext context) {", "\t\treturn " }),
    i(0, "const PlaceHolder();"),
    t({ "", "\t}" }),
    t({ "", "}" }),
  }),
})
