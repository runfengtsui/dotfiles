return {
  "lervag/vimtex",
  ft = "tex",
  config = function ()
    -- 设置撰写的 Tex 文档时 LaTeX 语法风格的文档
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "./build",  -- the directory for the compilation output files
    }
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-xelatex"
    }
    vim.g.vimtex_compiler_latexrun_engines = {
      _ = "xelatex"
    }
    -- 不自动弹出错误窗口, 可以使用 :copen 手动打开错误窗口
    vim.g.vimtex_quickfix_mode = 0
    -- 指定所使用的 PDF 阅读器
    vim.g.vimtex_view_method = "zathura"
    -- 这一项目默认即为 nvr，但是如果由于种种原因无法实现 SyncTeX 同步位置，可以考虑手动指定这一项目
    -- 同时需要安装 neovim-remote
    vim.g.vimtex_compiler_progname = 'nvr'

    -- TOC
    vim.g.vimtex_toc_config = {
      name = "TOC",
      layers = {"content", "todo", "include"},
      split_width = 25,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }
  end
}

