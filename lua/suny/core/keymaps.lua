vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk(退出插入模式)" })
-- normal模式 实现物理行的跳转
keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
-- visual模式 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
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
keymap.set(
  "n",
  "<leader>tf",
  "<cmd>tabnew %<CR>",
  { desc = "Open current buffer in new tab(打开当前文件到新的选项卡)" }
)

-- 配置c/c++ 编译执行方法
-- 定义一个函数来安全地检查 noice 是否可用
local function is_noice_available()
  local ok, _ = pcall(require, "noice")
  return ok
end

-- 显示消息的函数，noice可用则使用，没有就使用vim.notify
local function display_message(msg, level)
  if is_noice_available() then
    require("noice").notify(msg, level)
  else
    vim.notify(msg, level)
  end
end

local function compile_and_run()
  -- 保存当前文件
  vim.cmd("write")

  -- 获取当前文件名、无扩展名的文件名和扩展名
  local file = vim.fn.expand("%")
  local file_noext = vim.fn.expand("%:r")
  local extension = vim.fn.expand("%:e")

  -- 根据文件扩展名选择编译器命令
  local compile_cmd
  if extension == "c" then
    compile_cmd = string.format("clang %s -o %s", file, file_noext)
  elseif extension == "cpp" or extension == "cc" or extension == "cxx" then
    compile_cmd = string.format("clang++ %s -o %s", file, file_noext)
  else
    display_message("Unsupported file type 暂不支持的文件类型", vim.log.levels.ERROR)
    return
  end

  -- 使用vim.fn.jobstart 来异步执行编译命令
  local compile_job = vim.fn.jobstart(compile_cmd, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        display_message("Compilation successful 编译成功", vim.log.levels.INFO)
        -- 编译成功,运行程序
        local run_cmd = string.format("%s", file_noext)
        local output = {}
        local run_job = vim.fn.jobstart(run_cmd, {
          on_stdout = function(_, data)
            if data then
              for _, line in ipairs(data) do
                if line ~= "" then
                  table.insert(output, line)
                end
              end
            end
          end,
          on_stderr = function(_, data)
            if data then
              for _, line in ipairs(data) do
                if line ~= "" then
                  table.insert(output, line)
                end
              end
            end
          end,
          on_exit = function(_, exit_code)
            if #output > 0 then
              display_message(table.concat(output, "\n"), vim.log.levels.INFO)
            end
            if exit_code ~= 0 then
              display_message("Program exited with code" .. exit_code, vim.log.levels.WARN)
            end
          end,
        })
      else
        display_message("Compilation failed 编译失败", vim.log.levels.ERROR)
      end
    end,
  })
end

-- 设置键映射
keymap.set("n", "<F5>", compile_and_run, { noremap = true, silent = true })
