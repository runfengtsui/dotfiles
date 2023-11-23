vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- Run Lua file
vim.keymap.set("n", "<F5>", function ()
  local command = "TermExec cmd='lua " .. vim.fn.expand('%') .. "'"
  vim.api.nvim_command(command)
end, { noremap = true, silent = true })

