local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig="tt", dscr="Expands 'tt' into '\\texttt{}'" }, {
      t("\\texttt{"), i(1), t("}"),
  }),
  s({ trig="bf", dscr="Expands 'bf' into '\\textbf{}'" }, {
      t("\\textbf{"), i(1), t("}"),
  }),
}
