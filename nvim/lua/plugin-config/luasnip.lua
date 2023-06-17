-- rafamadriz/friendly-snippets
-- If you're using LuaSnip make sure to use
-- If you don't use `lazy_load()` you might notice a slower startup-time
require("luasnip.loaders.from_vscode").lazy_load()
-- personal snippets written in lua
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

