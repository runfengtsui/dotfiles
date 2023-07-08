local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s({trig="ifelse", dscr="Code snippet for if-else statement."}, {
        t {"if "}, i(1, "condition"),
        t {"", "    "}, i(2, "block"),
        t {"", "else"},
        t {"", "    "}, i(3, "block"),
        t {"", "end", ""},
    }),
    s({trig="forin", dscr="Code snippet to iterate each element."}, {
        t {"for "}, i(1, "value"), t {" in "}, i(2, "iterable"),
        t {"", "    "}, i(3, "block"),
        t {"", "end", ""}
    }),
}

