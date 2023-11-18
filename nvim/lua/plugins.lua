local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",  -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.colorscheme"),
  require("plugins.nvim-tree"),
  require("plugins.bufferline"),
  require("plugins.lualine"),
  require("plugins.markdown"),
  require("plugins.toggleterm"),
  require("plugins.nvim-treesitter"),
  require("plugins.comment"),
  require("plugins.mason"),
  require("plugins.autocomplete"),
  require("plugins.snippets"),
  require("plugins.autopairs"),
  require("plugins.latex"),
  require("plugins.autosave")
})

