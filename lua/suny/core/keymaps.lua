vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk(退出插入模式)" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights(清除高亮)" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number(数字+1)" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Increment number(数字-1)" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically(左右分屏)" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally(上下分屏)" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size(让分屏大小相等)" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split(关闭当前分屏)" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab(打开新选项卡)" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab(关闭当前选项卡)" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab(跳转下一选项卡)" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab(跳转上一选项卡)" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab(打开当前文件到新的选项卡)" })


