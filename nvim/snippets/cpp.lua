local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("ifelse", {
        t {"if ("}, i(1), t {") {", ""},
        t {"    "}, i(2),
        t {"", "} else {", ""},
        t {"    "}, i(3),
        t {"", "}", ""},
    }),
    s("ifelseif", {
        t {"if ("}, i(1), t {") {", ""},
        t {"    "}, i(2),
        t {"", "} else if ("}, i(3), t {") {", ""},
        t {"    "}, i(4),
        t {"", "} else {", ""},
        t {"    "}, i(5),
        t {"", "}", ""},
    }),
}

