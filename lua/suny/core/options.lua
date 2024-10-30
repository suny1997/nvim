-- 打开目录时有竖线
-- :source % 重新加载
vim.cmd("let g:netrw_liststyle = 3")
vim.g.python3_host_prog = "~/.venv/nvim-env/bin/python"
vim.o.sessionoptions = "localoptions"

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
-- 缩进配置
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- 光标行

-- turn on termguicolors for tokyonight colorscheme to work
-- (use true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent,end of line or insert mode start position

-- clipboard
-- 使用系统剪贴板
opt.clipboard = { "unnamedplus" }

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
