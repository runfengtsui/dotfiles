vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- custom python terminal
vim.keymap.set("n", "<leader>py", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local pyterm = Terminal:new({
    cmd = 'python3',
    direction = 'horizontal',
  })
  pyterm:toggle()
end, { noremap = true, silent = true })

-- Run Python file
vim.keymap.set("n", "<C-r>", function ()
  local command = "TermExec cmd='python3 " .. vim.fn.expand('%') .. "'"
  vim.api.nvim_command(command)
end, { noremap = true, silent = true })

