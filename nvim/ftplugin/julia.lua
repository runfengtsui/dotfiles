vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

local Terminal = require('toggleterm.terminal').Terminal

-- custom julia terminal
local juterm = Terminal:new({
    cmd = 'julia',
    direction = 'vertical',
})

function julia_toggle()
    juterm:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>j", "<Cmd>lua julia_toggle()<CR>", { noremap = true, silent = true })
