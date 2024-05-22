vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- custom baltamatica terminal
vim.keymap.set("n", "<leader>b", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local baltamterm = Terminal:new({
    cmd = function ()
      local cmd
      -- https://cloud.tencent.com/developer/ask/sof/107177575
      if vim.loop.os_uname().sysname == "Windows_NT" then
        cmd = "baltamaticaCLI.exe"
      elseif vim.loop.os_uname.sysname == "Linux" then
        cmd = "baltamaticaC.sh"
      end
      return cmd
    end,
    direction = 'horizontal',
  })
  baltamterm:toggle()
end, { noremap = true, silent = true })

