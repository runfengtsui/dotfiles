local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig="tt", dscr="Expands 'tt' into '\\texttt{}'" },
    fmta(
      "\\texttt{<>}",
      { i(1) }
    )
  ),
}
