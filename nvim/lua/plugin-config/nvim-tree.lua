-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrw_Plugin = 1

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("Find No nvim-tree!")
    return
end

-- keybindings
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- disable git status icon
    git = {
        enable = false,
    },

    -- project plugin 需要这样配置. 暂时不需要
    -- update_cwd = true,
    -- update_focused_file = {
    --     enable = true,
    --     update_cwd = true,
    -- },

    -- hide dotfile and node_modules directory
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        width = 25,
        side = 'left',
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- disable show number
        number = false,
        relativenumber = false,
        -- show icon
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- close nvim-tree when opening file
            quit_on_open = true,
        },
    },

    -- 想要在 WSL 中用 Windows 系统默认设置打开文件
    -- 使用 Node.js 全局安装一个 wsl-open, 即使用命令 `npm install -g wsl-open`
    -- 如果不需要这个功能, 可以不安装.
    -- system_open = {
    --     cmd = 'wsl-open',
    -- },
})
