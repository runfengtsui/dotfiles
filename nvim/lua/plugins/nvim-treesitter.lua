return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- Install language parser
    -- :TSInstallInfo command to show supported languages
    ensure_installed = {
      "markdown", "markdown_inline",
      "julia", "matlab",
      "python",
      "cpp", "c",
      "lua", "vim",
    },
    -- enable code highlight module
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    -- enable incremental selection
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    },
    -- enable code indent module (=)
    indent = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
  },
  config = function ()
    -- enable Folding module
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- default unfold
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99

    -- https://github.com/wbthomason/packer.nvim/issues/326#issuecomment-1037168353
    -- 这是一种解决无法下载 parser 或者网速慢导致下载不成功的方案
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/4304
    require("nvim-treesitter.install").prefer_git = true
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()
    for _, p in pairs(parsers) do
      p.install_info.url = p.install_info.url:gsub(
        "https://github.com/",
        "git@github.com:"
      )
    end
    -- 还有一种方案是修改 nvim-treesitter 插件文件夹下的 `lua/nvim-treesitter/shell_command_selectors.lua` 文件
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1422
    -- 修改 `can_use_tar` 为 false, 强制使用 git 来下载 parser
  end,
}

