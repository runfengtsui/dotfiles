local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({ trig = "cb", dscr = "The code block for programming languages." }, {
    t("```"), i(2, "language"), t({"", ""}),
    i(1, "Codes"),
    t({"", "```", ""}),
  }),
  s({ trig = "link", dscr = "The url link." }, {
    t("["), i(1), t("]("), i(2), t(")"),
  }),
}
