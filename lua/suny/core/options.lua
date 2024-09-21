-- 打开目录时有竖线
-- :source % 重新加载
vim.cmd("let g:netrw_liststyle = 3")

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
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- wsl 的 剪切板设置
if os.getenv("WSLENV") then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::OutputEncoding = [System.Text.Encoding]::UTF8; [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::OutputEncoding = [System.Text.Encoding]::UTF8; [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
  }
  -- 设置剪贴板选项
  vim.opt.clipboard = "unnamed,unnamedplus"
  -- 确保 Neovim 使用 UTF-8 编码
  vim.opt.encoding = "utf-8"
  vim.opt.fileencoding = "utf-8"
end

-- autocmd
--设置自动命令,取消在注释行按回车自动生成新行注释
vim.cmd([[
autocmd FileType * set formatoptions-=cro
]])

if os.getenv("WSLENV") then
  --自动命令,检测到vimLeave事件和FocusGained事件时执行切换输入法命令
  --只要退出编辑模式,就执行一次im-select 1033
  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 1033")
    end,
  })
  --只要进入编辑模式,就执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --需要在退出vim前执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "VimLeave" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --聚焦vim时执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "FocusGained" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --vim不是当前窗口时,执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "FocusLost" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
end
