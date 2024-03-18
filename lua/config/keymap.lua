local map = vim.keymap.set

-- :map 查看键位
-- n normal 常规模式
-- t terminal-job 终端作业模式
-- i insert 插入模式
-- v visual 可视化模式,选择模式
-- x 可视化模式
-- c command 命令行模式
-- 基础键位绑定
-- normal模式 esc时执行nohlsearch命令
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- normal模式 [+d 上一个诊断信息
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- normal模式 ]+d 下一个诊断信息
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- normal模式 空格+e 显示诊断的错误信息
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- normal模式 空格+q 打开诊断的快速修复列表
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- terminal模式 esc+esc 退出terminal模式
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- normal模式 ctrl+h 将光标移到左窗口
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- normal模式 ctrl+l 将光标移到右窗口
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- normal模式 ctrl+j 将光标移到下窗口
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- normal模式 ctrl+k 将光标移到上窗口
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Insert模式 j+k设置为esc
map("i", "jk", "<Esc>")
-- normal模式 实现物理行的跳转
map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
-- visual模式 单行或多行移动
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Comment插件的快捷键 用于注释和取消注释
local api = require("Comment.api")
-- g> 注释
map("n", "g>", api.call("comment.linewise", "g@"), { expr = true, desc = "Comment region linewise" })
-- g>c 将当前行单行注释
map("n", "g>c", api.call("comment.linewise.current", "g@$"), { expr = true, desc = "Comment current line" })
-- g>b 将当前行多行注释
map("n", "g>b", api.call("comment.blockwise.current", "g@$"), { expr = true, desc = "Comment current block" })

-- g< 取消注释
map("n", "g<", api.call("uncomment.linewise", "g@"), { expr = true, desc = "Uncomment region linewise" })
-- g<c 取消当前单行的注释
map("n", "g<c", api.call("uncomment.linewise.current", "g@$"), { expr = true, desc = "Uncomment current line" })
-- g<b 取消当前行多行注释
map("n", "g<b", api.call("uncomment.blockwise.current", "g@$"), { expr = true, desc = "Uncomment current block" })

local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
-- 先选中在注释或取消注释
map("x", "g>", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.locked("comment.linewise")(vim.fn.visualmode())
end, { desc = "Comment region linewise (visual)" })

map("x", "g<", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.locked("uncomment.linewise")(vim.fn.visualmode())
end, { desc = "Uncomment region linewise (visual)" })

return {}
