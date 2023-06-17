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
    s("$$", {t"$", i(1), t"$ ", i(0)}),
    s("$$$", {
        t{"$$", ""}, i(1), t{"", "$$"}, i(0)
    }),
}

