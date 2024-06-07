-- Customize Treesitter
---@type LazySpec
-- 帮助安装特定的 Treesitter 解析器
-- 提升代码高亮和解析的效果
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "cpp",
      "python",
      -- add more arguments for adding more treesitter parsers
      -- 添加需要的treesitter解析器,比如python,cpp
    })
  end,
}
