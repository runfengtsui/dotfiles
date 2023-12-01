-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- relative number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight the line
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 右侧代码长度参考线
vim.wo.colorcolumn = "92"

-- Normal mode >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- space instead tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- 新行对其当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写不敏感, 除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true

-- height of cmd
vim.o.cmdheight = 1

-- 当文件被外部程序修改时, 自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.wo.wrap = false

-- 光标在行首尾时 <Left><Right> 可以跳到下一行
vim.o.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的 buffer
vim.o.hidden = true

-- 禁用鼠标
vim.o.mouse = ""

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 300

-- 设置 timeoutlen 为等待键盘快捷键连击时间 500 毫秒
vim.o.timeoutlen = 500

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- 不可见字符的显示, 这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"

-- 补全增强
vim.owildmenu = true

-- Don't pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'

-- 补全最多显示十行
vim.o.pumheight = 10

-- 永远显示 tabline
vim.o.showtabline = 2

-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false

vim.cmd([[set clipboard+=unnamedplus]])
