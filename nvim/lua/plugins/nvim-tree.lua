local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-h>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded = 1
    vim.g.loaded_netrw_Plugin = 1
    -- setup with some options
    require("nvim-tree").setup {
      disable_netrw = true,
      -- on_attach = "default",
      on_attach = my_on_attach,
      view = {
        width = 25,
        hide_root_folder = false,
        side = 'left',
        -- disable show number
        number = false,
        relativenumber = false,
        -- show icon
        signcolumn = "yes",
      },
      -- hide dotfile and node_modules directory
      filters = {
        dotfiles = true,
        custom = {
          'node_modules'
        },
      },
      -- disable git status icon
      git = {
        enable = false,
      },
      actions = {
        open_file = {
          resize_window = true,
          -- close nvim-tree when opening file
          quit_on_open = true,
        },
      },
    }

    -- nvim-tree autoclose when it is the last window
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
          vim.cmd "quit"
        end
      end
    })
  end,
}

