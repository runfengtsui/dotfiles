local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    vim.notify("Find No cmp!")
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    vim.notify("Find No luasnip!")
    return
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet eigine
        expand = function(args)
            -- For `vsnip` users.
            -- vim.fn["vsnip#anonymous"](args.body)
            -- For `luasnip` users.
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    -- 补全源
    sources = cmp.config.sources({
        {
            name = "nvim_lsp",
            group_index = 1,
        },
        {
            name = "luasnip",
            group_index = 1,
        },
        {
            name = "nvim_lsp_signature_help",
            group_index = 1,
        },
        {
            name = "buffer",
            group_index = 2,
        },
        {
            name = "path",
            group_index = 2,
        },
    }),

    -- 使用 lspkind-nvim 显示类型图标
    formatting = require("cmp.lspkind").formatting,

    -- 快捷键设置
    mapping = require("keybindings").cmp(cmp),
})

-- Use buffer source for `/` and '?' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- use cmdline and path source for `:`
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path", }
    }, {
        { name = "cmdline", }
    }),
})

-- 根据文件类型来选择补全来源
cmp.setup.filetype({ "markdown", "help" }, {
    sources = {
        { name = "luasnip" },
        { name = "buffer", },
        { name = "path", },
    },
})
