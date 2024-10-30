-- 查找文件和字符的插件
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            -- ctrl + j / k ，在查找界面上下移动光标
            -- ctrl + q   用tab 选中查找界面的行，发送到快速修复
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- telescope.load_extension("fzf")
    -- 尝试加载 fzf 扩展
    local status_ok, _ = pcall(telescope.load_extension, "fzf")
    if not status_ok then
      print("fzf extension not loaded")
    end

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      { desc = "Fuzzy find files in cwd(当前目录查找文件名)" }
    )
    keymap.set(
      "n",
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      { desc = "Fuzzy find recent files(最近打开的文件里查找文件名)" }
    )
    keymap.set(
      "n",
      "<leader>fs",
      "<cmd>Telescope live_grep<cr>",
      { desc = "Find string in cwd(当前目录查找字符串)" }
    )
    keymap.set(
      "n",
      "<leader>fc",
      "<cmd>Telescope grep_string<cr>",
      { desc = "Find string under cursor in cwd(当前目查找光标所在字符)" }
    )
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fc", function()
      -- 设置 Neovim 配置目录路径
      local config_dir = vim.fn.stdpath("config")

      -- 切换到配置目录
      vim.fn.chdir(config_dir)
      require("telescope.builtin").find_files({
        prompt_title = "Neovim Config Files",
        cwd = config_dir, -- Neovim 配置文件目录
      })
    end, { desc = "Find Config File(查找配置文件)" })
  end,
}
