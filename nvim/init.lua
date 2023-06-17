-- basic configuration
require('basic')

-- keybindings
require('keybindings')

-- Packer plugins manager
require('plugins')

-- autocmd
require('autocmd')

-- colorscheme
require('colorscheme')

-- plugins' configuration
-- nvim-tree
require('plugin-config/nvim-tree')
-- bufferline
require('plugin-config/bufferline')
-- lualine
require('plugin-config/lualine')
-- nvim-treesitter
require('plugin-config/nvim-treesitter')
-- toggleterm
require('plugin-config/toggleterm')
-- LaTeX
require('plugin-config/vimtex')

-- LSP
require('lsp/setup')
require('lsp/ui')
require('cmp/setup')

-- Snippets
require("plugin-config/luasnip")

