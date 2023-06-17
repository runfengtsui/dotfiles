local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("Find No lualine!")
    return
end

lualine.setup({
    options = {
        theme = "tokyonight",
        component_separators = {
            left = "|",
            right = "|",
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
            left = "",
            right = "",
        },
    },
    extensions = {
        "nvim-tree",
        "toggleterm",
    },
    sections = {
        lualine_c = {
            "filename",
            {
                -- provided by `arkav/lualine-lsp-progress`
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
        },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                symbols = {
                    unix = '', -- unix = "LF"
                    dos = '',  -- dos = "CRLF"
                    mac = '',  -- mac = "CR"
                },
            },
            "encoding",
            "filetype",
        },
    },
})
