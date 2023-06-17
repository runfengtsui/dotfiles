-- 每次保存 plugins.lua 自动安装插件
local packer_user_config = vim.api.nvim_create_augroup("PACKER_USER_CONFIG", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "plugins.lua",
    group = packer_user_config,
    command = "source <afile> | PackerSync",
})

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

local disable_auto_comment = vim.api.nvim_create_augroup("DISABLE_AUTO_COMMENT", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*",
    group = disable_auto_comment,
    callback = function ()
        vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"r", "c", "o"}
    end
})

if vim.fn.has("wsl") then
    local yank = vim.api.nvim_create_augroup("YANK", { clear = true })
    vim.api.nvim_create_autocmd({ "TextYankPost " }, {
        pattern = "*",
        group = yank,
        command = ":call system('/mnt/c/windows/system32/clip.exe ', @\")"
    })
end
