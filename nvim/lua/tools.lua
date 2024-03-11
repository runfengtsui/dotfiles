-- Getnode
local function GetNode()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()
  vim.notify(node:type())
end
vim.keymap.set("n", "<leader>b", GetNode, {})

