vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

local Terminal = require('toggleterm.terminal').Terminal

-- custom baltamatica terminal
local baltamterm = Terminal:new({
    cmd = "/opt/Baltamatica/bin/baltamaticaC.sh",
    direction = 'horizontal',
})

function baltam_toggle()
    baltamterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>lua baltam_toggle()<CR>", { noremap = true, silent = true })
