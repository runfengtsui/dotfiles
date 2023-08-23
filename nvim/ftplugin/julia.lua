vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- custom julia terminal
vim.keymap.set("n", "<leader>j", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local juterm = Terminal:new({
    cmd = 'julia',
    direction = 'horizontal',
  })
  juterm:toggle()
end, { noremap = true, silent = true })

