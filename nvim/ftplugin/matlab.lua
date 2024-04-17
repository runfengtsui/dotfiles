vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- custom baltamatica terminal
vim.keymap.set("n", "<leader>b", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local baltamterm = Terminal:new({
    cmd = "baltamaticaC.sh",
    direction = 'horizontal',
  })
  baltamterm:toggle()
end, { noremap = true, silent = true })

