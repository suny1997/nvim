-- 设置leader键为空格 全局变量
vim.g.mapleader = " "
-- 设置leader键为空格 局部变量
vim.g.maplocalleader = " "
-- 显示行号
vim.opt.number = true
-- 可以使用鼠标
vim.opt.mouse = "a"
-- 关闭vim本身的模式提示
vim.opt.showmode = false
-- 可以让剪切板在wsl外使用
vim.opt.clipboard = "unnamedplus"
-- 换行线的可视提示
vim.opt.breakindent = true
-- 启用持久撤销
vim.opt.undofile = true
-- 在搜索模式下忽略大小写,除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 显示左侧图标指示列
vim.opt.signcolumn = "yes"
-- 250毫秒没有按键 和CursorHold件有关
vim.opt.updatetime = 250
-- 300毫秒 组合键位的上限时间,比如(jk 返回normal模式)
vim.opt.timeoutlen = 300
-- 窗口分割时从下边和右边出现
vim.opt.splitright = true
vim.opt.splitbelow = true
-- 出现不可见字符比如tab 空格等等
vim.opt.list = true
--vim.opt.list = false
-- 设置tab的缩进是4个空格
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- 不可见字符显示什么
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- 在分割窗口中进行增量搜索
vim.opt.inccommand = "split"
-- 高亮显示光标所在的行
vim.opt.cursorline = true
-- 光标以上和以下保持的最小屏幕行数
vim.opt.scrolloff = 10
-- 搜索匹配到的字符高亮
vim.opt.hlsearch = true

--设置相对行号
vim.o.relativenumber = true
--设置自动命令,取消在注释行按回车自动生成新行注释
vim.cmd([[
autocmd FileType * set formatoptions-=cro
]])
return {}
