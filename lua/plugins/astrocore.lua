-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  -- astrocore 核心插件
  -- 提供了一种集中方式来修改键映射、Vim 选项、自动命令等
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  -- 配置选项
  opts = {
    -- Configure core features of AstroNvim
    -- 功能配置
    features = {
      -- 设置大文件的全局限制，用于禁用例如 treesitter 之类的功能
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      -- 启动时启用自动配对,添加括号
      autopairs = true, -- enable autopairs at start
      -- 启动时启用补全
      cmp = true, -- enable completion at start
      -- 启动时的诊断模式 (0 = 关闭, 1 = 无标志/虚拟文本, 2 = 无虚拟文本, 3 = 开启)
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      -- 启动时高亮显示 URL
      highlighturl = true, -- highlight URLs at start
      -- 启动时禁用通知
      notifications = false, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    -- 诊断配置
    diagnostics = {
      -- 启用虚拟文本
      virtual_text = true,
      -- 启用下划线
      underline = true,
    },
    -- vim options can be configured here
    -- vim 选项配置
    options = {
      opt = { -- vim.opt.<key>
        -- 设置显示的是相对行号
        relativenumber = true, -- sets vim.opt.relativenumber
        -- 设置显示行号
        number = true, -- sets vim.opt.number
        -- 禁用拼写检查
        spell = false, -- sets vim.opt.spell
        -- 始终显示标志列
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        -- 启用自动换行
        wrap = true, -- sets vim.opt.wrap
        -- 使用linebreak选项来确保在单词边界处进行换行，而不是在字符中间换行
        linebreak = true,
        -- 显示换行符号
        showbreak = "↪",
        -- 防止水平滚动,光标会在屏幕上保持固定位置，文本会在屏幕上移动
        sidescrolloff = 0,
        sidescroll = 0,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    -- 键映射配置
    mappings = {
      -- first key is the mode
      -- 代表normal模式
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- 导航缓冲区标签,即左右切换打开的文件
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        -- 按下后,选择要关闭的文件,缓冲区有按键提示
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
