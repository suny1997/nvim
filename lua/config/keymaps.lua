local map = vim.keymap.set
-- Insert模式 j+k设置为esc
map("i", "jk", "<Esc>")
-- normal模式 实现物理行的跳转
map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
-- visual模式 单行或多行移动
map("v", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
