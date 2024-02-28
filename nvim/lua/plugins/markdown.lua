return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    config = function()
      -- markdown-preview plugin config
      vim.g.mkdp_auto_start = 0
      -- auto close current preview window when change from markdown buffer to another buffer
      vim.g.mkdp_auto_close = 1
      -- the preview server is available to others in you network
      vim.g.mkdp_open_to_the_world = 1
      -- echo preview page url in command when open preview page
      vim.g.mkdp_echo_preview_url = 1
      -- use custom IP to open preview page
      -- vim.g.mkdp_open_ip = ""
      -- use a custom port to start server or empty for random
      vim.g.mkdp_port = "8888"
      -- specify browser to open preview page
      vim.g.mkdp_browser = "/usr/bin/browser"
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    config = function()
      -- vim-table-mode plugin config
      vim.g.loaded_table_mode = 1
    end,
  },
  {
    "RunfengTsui/wiki.nvim",
    lazy = true,
    ft = "markdown",
  }
}
