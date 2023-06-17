local packer = require("packer")
packer.startup({
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- colorschemes
        use 'folke/tokyonight.nvim'

        use {
            'nvim-tree/nvim-tree.lua',
            requires = 'nvim-tree/nvim-web-devicons',
            tag = 'nightly',
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = {
                'nvim-tree/nvim-web-devicons',
                opt = true,
            },
        }
        use 'arkav/lualine-lsp-progress'

        use {
            'akinsho/bufferline.nvim',
            tag = "v3.*",
            requires = {
                'nvim-tree/nvim-web-devicons',
                'moll/vim-bbye'
            },
        }

        -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }

        --- LSP server
        use {
            -- `nvim-lsp-installer` is no longer maintained.
            -- "williamboman/nvim-lsp-installer",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }

        -- 补全源
        use { "hrsh7th/cmp-nvim-lsp" }                  -- { name = nvim_lsp }
        use { "hrsh7th/cmp-buffer" }                    -- { name = 'buffer' }
        use { "hrsh7th/cmp-path" }                      -- { name = 'path' }
        use { "hrsh7th/cmp-cmdline" }                   -- { name = 'cmdline' }
        use { "hrsh7th/cmp-nvim-lsp-signature-help" }   -- { name = 'nvim_lsp_signature_help' }
        -- 补全引擎
        use { "hrsh7th/nvim-cmp" }
        -- snippet 引擎
        -- For vsnip users
        -- use { "hrsh7th/vim-vsnip" }
        -- use { "hrsh7th/cmp-vsnip" }
        -- For LuaSnip users
        use({
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            run = "make install_jsregexp",
        })
        use { "saadparwaiz1/cmp_luasnip" }
        use { "rafamadriz/friendly-snippets" }

        -- UI enhanced
        use { "onsails/lspkind-nvim" }

        -- markdown preview
        use({
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        })
        -- install without yarn or npm
        -- use({
        --     "iamcco/markdown-preview.nvim",
        --     run = function()
        --         vim.fn["mkdp#util#install"]()
        --     end,
        --     ft = { "markdown" },
        -- })
        use ({
            'dhruvasagar/vim-table-mode',
            ft = { "markdown" },
        })

        use({
            "akinsho/toggleterm.nvim",
            tag = '*'
        })

        use({
            "lervag/vimtex",
            opt = true,
            ft = "tex",
        })

    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
            -- 通过 ssh 下载插件
            -- https://github.com/wbthomason/packer.nvim/issues/326#issuecomment-1037168353
            default_url_format = "git@github.com:%s",
            -- 其他的源, 但不一定稳定, 一些小众插件可能没有
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
