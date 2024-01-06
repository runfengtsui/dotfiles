local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig="env", dscr="LaTeX envoronments", snippetType="autosnippet" },
    fmta([[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
        i(1), i(2),
        rep(1),   -- this node repeats insert node i(1)
    })
  ),
  s({ trig="sec" }, {
    t("\\section{"), i(1), t("}"),
  }),
  s({ trig="pac" }, {
    t("\\usepackage{"), i(1), t("}"),
  }),
  s({ trig="ref" }, {
    t("\\ref{"), i(1), t("}"),
  }),
  s({ trig="eqr" }, {
    t("\\eqref{"), i(1), t("}"),
  }),
}
