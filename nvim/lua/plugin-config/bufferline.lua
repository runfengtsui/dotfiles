local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("Find No bufferline!")
    return
end

-- bufferline configuration
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        -- close command, use `:Bdelete` provided by `moll/vim-bbye`
        close_command = "Bdelete! %d",
        -- comment it because I disable using mouse
        -- right_mouse_command = "Bdelete! %d",

        -- 侧边栏让出 nvim-tree 的位置, show File Explorer
        offsets = {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
        },

        -- use nvim lsp
        diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        -- @diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
})
