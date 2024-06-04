return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    -- :h mason-default-settings
    -- ~/.local/share/nvim/mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    -- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    mason_lspconfig.setup({
      ensure_installed = {
        -- "sumneko_lua" is not recognized
        -- https://github.com/nvim-lua/kickstart.nvim/issues/179
        "lua_ls",
        "pyright",
        "clangd",
        "julials",
        "marksman",
      },
      automatic_installation = true,
    })

    local servers = {
      lua_ls = require("lsp.config.lua"),
      pyright = require("lsp.config.pyright"),
      clangd = require("lsp.config.clangd"),
      julials = require("lsp.config.julials"),
      marksman = require("lsp.config.marksman"),
    }

    for name, config in pairs(servers) do
      if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现 on_setup 方法
        config.on_setup(lspconfig[name])
      else
        -- 使用默认参数
        lspconfig[name].setup({})
      end
    end
  end,
}

