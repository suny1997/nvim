-- 打开目录时有竖线
-- :source % 重新加载
vim.cmd("let g:netrw_liststyle = 3")
vim.g.python3_host_prog = "~/.venv/nvim-env/bin/python"

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
  --自动命令,去掉^M
  -- 创建一个自动命令组
  vim.api.nvim_create_augroup("RemoveCarriageReturn", { clear = true })

  -- 在粘贴之前处理剪贴板内容
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "RemoveCarriageReturn",
    callback = function()
      if vim.v.event.operator == "p" or vim.v.event.operator == "P" then
        local clipboard = vim.fn.getreg("+")
        clipboard = clipboard:gsub("\r\n", "\n")
        vim.fn.setreg("+", clipboard)
      end
    end,
  })

  -- 重新映射粘贴键以使用处理后的剪贴板内容
  vim.keymap.set("n", "p", function()
    local clipboard = vim.fn.getreg("+")
    clipboard = clipboard:gsub("\r\n", "\n")
    vim.fn.setreg('"', clipboard)
    return "p"
  end, { expr = true, silent = true })

  vim.keymap.set("n", "P", function()
    local clipboard = vim.fn.getreg("+")
    clipboard = clipboard:gsub("\r\n", "\n")
    vim.fn.setreg('"', clipboard)
    return "P"
  end, { expr = true, silent = true })
end
