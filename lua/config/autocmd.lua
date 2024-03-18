--文本复制时高亮
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--自动命令,检测到vimLeave事件和FocusGained事件时执行切换输入法命令
--需要在退出vim前执行一次im-select 2052
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	callback = function()
		vim.cmd(":silent :!im-select.exe 2052")
	end,
})
--聚焦vim时执行一次im-select 2052
vim.api.nvim_create_autocmd({ "FocusGained" }, {
	callback = function()
		vim.cmd(":silent :!im-select.exe 2052")
	end,
})

return {}
