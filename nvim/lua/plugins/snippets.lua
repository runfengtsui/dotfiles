return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release
    version = "2.*",  -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    -- add `friendly-snippets` as a dependency for LuaSnip
    -- dependencies = { "rafamadriz/friendly-snippets" },
    -- https://zhuanlan.zhihu.com/p/644984708
    keys = {
      {
        "<C-h>",
        "<Plug>luasnip-next-choice",
        mode = { "i", "s" },
      },
      {
        "<C-p>",
        "<Plug>luasnip-prev-choice",
        mode = { "i", "s" },
      },
    },
    config = function()
      -- rafamadriz/friendly-snippets
      -- If you're using LuaSnip make sure to use
      -- require("luasnip.loaders.from_vscode").lazy_load()
      -- personal snippets written in lua
      -- Lazy-load snippets, i.e. only load when requird, e.g. for a given filetype
      require("luasnip.loaders.from_lua").lazy_load({
        paths = "~/.config/nvim/LuaSnips",
      })
      require("luasnip").config.setup({
        -- enable autosnippets for `snippetType=autosnippet`
        enable_autosnippets = true
      })
    end,
  },
}

