-- LaTeX 风格文档
vim.g.tex_flavor = 'latex'

-- 设置默认不自动弹出错误窗口(quickfix window)
vim.g.vimtex_quickfix_mode = 0

vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe'

-- SyncTex 同步位置
vim.g.vimtex_compiler_progname = 'nvr'
-- 前向搜索
vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

vim.g.vimtex_compiler_latexmk_engines = {
    _ = '-xelatex'
}
