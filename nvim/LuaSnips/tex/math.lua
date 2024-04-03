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
-- local tex = require("util.latex")

return {
  -- math environment
  s({ trig="mk", name="inline math", dscr="Insert inline Math Environment.", snippetType="autosnippet" },
    { t("\\("), i(1), t("\\)"), }, {
      -- condition = tex.in_text,
      -- show_condition = tex.in_text,
      -- callbacks = {
      --   [-1] = { [events.leave] = appended_space_after_insert },
      -- }
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
  s({ trig = "cases" }, {
    t{"\\begin{cases}", ""},
    i(1), t{" \\\\", ""},
    i(2), t{"", ""},
    t{"\\end{cases}"}, i(0)
  }),


  -- delimiters
  s({ trig = "\\lp", snippetType = "autosnippet" }, {
    t("\\left("), i(1), t("\\right)")
  }),
  s({ trig = "\\lv", snippetType = "autosnippet" }, {
    t("\\left\\lvert"), i(1), t("\\right\\rvert "),
  }),
  s({ trig = "\\lV", snippetType = "autosnippet" }, {
    t("\\left\\lVert"), i(1), t("\\right\\rVert "),
  }),

  -- bold symbol
  s({ trig = "\\bs", snippetType = "autosnippet" }, fmta([[
    \boldsymbol{<>}
  ]], { i(1) })),

  s({ trig = "\\ff", dscr = "Expands `ff` into `frac{}{}` or `dfrac{}{}", snippetType = "autosnippet" },{
    c(1, {
      sn(1, fmta([[
        \frac{<>}{<>}
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \dfrac{<>}{<>}
      ]], { i(1), i(2) }))
    })
  }),

  s({ trig = "\\sq", dscr = "The squared(cubed, etc.) root of value.", snippetType = "autosnippet"}, {
    c(1, {
      sn(1, { t("\\sqrt{"), i(1), t("}") }),
      sn(2, { t("\\sqrt["), i(2), t("]{"), i(1), t("}") }),
    })
  }),

  -- derivative and partial derivative
  s({ trig = "\\de", dscr = "The derivative of function.", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \frac{\mathrm{d} <>}{\mathrm{d} <>}
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \dfrac{\mathrm{d} <>}{\mathrm{d} <>}
      ]], { i(1), i(2) })),
    })
  }),
  s({ trig = "\\pd", dscr = "The partial derivative of function with serival variables.", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \frac{\partial <>}{\partial <>}
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \dfrac{\partial <>}{\partial <>}
      ]], { i(1), i(2) })),
    })
  }),

  -- sum
  s({ trig = "\\sum", snippetType="autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \sum_{<>}^{<>} <>
      ]], { i(1), i(2), i(3) })),
      sn(2, fmta([[
        \sum\limits_{<>}^{<>} <>
      ]], { i(1), i(2), i(3) })),
      sn(3, fmta([[
        \displaystyle\sum_{<>}^{<>} <>
      ]], { i(1), i(2), i(3) })),
    })
  }),

  -- limit
  s({ trig = "\\lim", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \lim_{<>} <>
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \lim\limits_{<>} <>
      ]], { i(1), i(2) })),
    })
  }),

  -- integral
  s({ trig = "\\int", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \int <> \,\mathrm{d}<>
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \int_{<>}^{<>} <> \,\mathrm{d}<>
      ]], { i(1), i(2), i(3), i(4) })),
      sn(3, fmta([[
        \displaystyle\int <> \,\mathrm{d}<>
      ]], { i(1), i(2) })),
      sn(4, fmta([[
        \displaystyle\int_{<>}^{<>} <> \,\mathrm{d}<>
      ]], { i(1), i(2), i(3), i(4) }))
    })
  }),

  s("vector", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" \\\\ "}, i(2), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),
  s("pmatrix", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" & "}, i(2), t{" & "}, i(3), t{" \\\\", ""},
    i(4), t{" & "}, i(5), t{" & "}, i(6), t{" \\\\", ""},
    i(7), t{" & "}, i(8), t{" & "}, i(9), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),

}

