return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release
    version = "2.*",  -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    -- add `friendly-snippets` as a dependency for LuaSnip
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      -- rafamadriz/friendly-snippets
      -- If you're using LuaSnip make sure to use
      require("luasnip.loaders.from_vscode").lazy_load()
      -- personal snippets written in lua
      require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/snippets",
      })
    end,
  },
}

