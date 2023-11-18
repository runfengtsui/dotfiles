local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local sn = ls.snippet_node
local f = ls.function_node
local ai = require("luasnip.nodes.absolute_indexer")
local c = ls.choice_node
local isn = ls.indent_snippet_node
local d = ls.dynamic_node
local ms = ls.multi_snippet
local tex = require("util.latex")

return {
  -- math environment
  s({ trig="mk", name="inline math", dscr="Insert inline Math Environment.", snippetType="autosnippet" },
    { t("$"), i(1), t("$"), }, {
      -- condition = tex.in_text,
      -- show_condition = tex.in_text,
      -- callbacks = {
      --   [-1] = { [events.leave] = appended_space_after_insert },
      -- }
  }),
  s("mathblock", {
    t{"$$", ""}, i(1), t{"", "$$"}, i(0)
  }),
  s({ trig="eq*", dscr="A LaTeX equation environment without label" },
    fmt(  -- The snippet code actually looks like the equation environment it produces.
      [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
  s({ trig="eq", dscr="A LaTeX equation environment" },
    fmta( -- fmta use <> angle brackets
      [[
        \begin{equation}
            <>
            \label{eq:<>}
        \end{equation}
      ]],
      { i(1), i(2) }
    )
  ),

  s({ trig="ff", dscr="Expands `ff` into `frac{}{}`", snippetType="autosnippet" },
    fmta(
      "\\frac{<>}{<>}",
      { i(1), i(2) }
    )
  ),
  s({ trig="df", dscr="Expands `df` into `dfrac{}{}` in inline math", snippetType="autosnippet" },
    fmta(
      "\\dfrac{<>}{<>}",
      { i(1), i(2) }
    )
  ),

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

