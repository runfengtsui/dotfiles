local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local f = ls.function_node
local ai = require("luasnip.nodes.absolute_indexer")
local c = ls.choice_node
local isn = ls.indent_snippet_node
local d = ls.dynamic_node
local ms = ls.multi_snippet

return {
  s("math", {t"$", i(1), t"$", i(0)}),
  s("mathblock", {
    t{"$$", ""}, i(1), t{"", "$$"}, i(0)
  }),

  s("vector", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" \\\\ "}, i(2), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),
  s("2x2pmatrix", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" & "}, i(2), t{" \\\\", ""},
    i(3), t{" & "}, i(4), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),
  s("3x3pmatrix", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" & "}, i(2), t{" & "}, i(3), t{" \\\\", ""},
    i(4), t{" & "}, i(5), t{" & "}, i(6), t{" \\\\", ""},
    i(7), t{" & "}, i(8), t{" & "}, i(9), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),
  s("4x4pmatrix", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" & "}, i(2), t{" & "}, i(3), t{" & "}, i(4), t{" \\\\", ""},
    i(5), t{" & "}, i(6), t{" & "}, i(7), t{" & "}, i(8), t{" \\\\", ""},
    i(9), t{" & "}, i(10), t{" & "}, i(11), t{" & "}, i(12), t{" \\\\", ""},
    i(13), t{" & "}, i(14), t{" & "}, i(15), t{" & "}, i(16), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),

  s("cases", {
    t{"\\begin{cases}", ""},
    i(1), t{" \\\\", ""},
    i(2), t{"", ""},
    t{"\\end{cases}"}, i(0)
  }),
}

