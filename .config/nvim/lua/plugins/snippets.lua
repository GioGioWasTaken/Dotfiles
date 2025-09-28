local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- LaTeX snippets
ls.add_snippets("tex", {
  s("prodinline", {
    t("\\prod_{i=1}^{"),
    i(1, "n"),
    t("} ("),
    i(2, "a_i"),
    t(")")
  }),

  -- add more snippets here
})
