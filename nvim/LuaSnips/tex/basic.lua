local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig="sec" }, {
    t("\\section{"), i(1), t("}"),
  }),
  s({ trig="subse" }, {
    t("\\subsection{"), i(1), t("}"),
  }),
  s({ trig="2subs" }, {
    t("\\subsubsection{"), i(1), t("}"),
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
