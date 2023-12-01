local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local ai = require("luasnip.nodes.absolute_indexer")

local function expand_arguments(args)
  local tab = {}
  local a = args[1][1]
  local n = 1
  for e in string.gmatch(a, " ?([^,]*) ?") do
    if #e > 0 then
      table.insert(tab, t({"", "%   "}))
      table.insert(tab, t(e .. " - "))
      table.insert(tab, i(n, "Here are some descriptions about the parameter " .. e))
      n = n + 1
    end
  end
  return sn(nil, tab)
end

local function rec_comment ()
  return sn(nil, {
    c(1, {
      t({""}),
      sn(nil, {t({"", "% "}), i(1), d(2, rec_comment, {})}),
    }),
  });
end

return {
  s({ trig = "function" }, fmt([[
    function [{outputs}] = {functioname}({inputs})
    {doc}
        {body}
    end
  ]], {
      outputs = i(1, "outputs"),
      functioname = c(2, {
        i(1, "untitled"),
        f(function ()
          local filename = vim.api.nvim_buf_get_name(0)
          return string.match(filename, ".+/(.+)%.m")
        end, {}),
      }),
      inputs = i(3, "inputs"),
      doc = c(4, {
        t(''),
        -- NOTE we need to surround the `fmt` with `sn` to make this work
        sn(1, fmt([[
          %{FUNCTIONAME} - {desc}
          %
        ]], {
            FUNCTIONAME = f(function (args)
              return string.upper(args[1][1])
            end, { ai[2] }),
            desc = sn(1, {
              i(1, "Here are some abstract about the function."),
              d(2, rec_comment, {}),
            }),
          })),
        sn(2, fmt([[
          %{FUNCTIONAME} - {desc}
          %
          % Inputs:{args}
          %
          % Outputs:{returns}
          %
        ]], {
            FUNCTIONAME = f(function (args)
              return string.upper(args[1][1])
            end, { ai[2] }),
            desc = sn(1, {
              i(1, "Here are some abstract about the function."),
              d(2, rec_comment, {}),
            }),
            args = d(2, expand_arguments, { ai[3] }),
            returns = d(3, expand_arguments, { ai[1] }),
          })),
      }),
      body = i(0),
    })
  ),

  -- if condition
  s({ trig = "if" },
    fmt([[
      if {condition}
          {body}
      end
    ]], {
      condition = i(1, "condition"),
      body = i(2, "body"),
    })
  ),
  s({ trig = "ifelse" },
    fmt([[
      if {condition}
          {body1}
      else
          {body2}
      end
    ]], {
      condition = i(1, "condition"),
      body1 = i(2, "body1"),
      body2 = i(3, "body2"),
    })
  ),
  -- for loop
  s({ trig = "for" }, fmt([[
    for {iterator}
        {body}
    end
  ]], {
      iterator = i(1, "iterator"),
      body = i(2, "body"),
    })
  ),
}
