vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

local Terminal = require('toggleterm.terminal').Terminal

-- custom python terminal
local pyterm = Terminal:new({
    cmd = 'python3',
    direction = 'vertical',
})

function python_toggle()
    pyterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>py", "<Cmd>lua python_toggle()<CR>", { noremap = true, silent = true })
