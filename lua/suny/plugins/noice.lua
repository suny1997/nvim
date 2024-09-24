return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- 添加 lsp 相关配置
    lsp = {
      -- 覆盖 markdown 渲染，以便在 hover 和 signature help 中显示更好的输出
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      -- 启用 signature help 悬浮窗
      signature = {
        enabled = true,
      },
      -- 启用 hover 悬浮窗
      hover = {
        enabled = true,
      },
    },
    -- 你可以启用一个预设
    presets = {
      bottom_search = true, -- 使用经典的底部 cmdline 搜索
      command_palette = true, -- 将 cmdline 和 popup 菜单放在一起
      long_message_to_split = true, -- 长消息拆分为多行
      inc_rename = false, -- 启用 inc-rename.nvim 风格的重命名
      lsp_doc_border = false, -- 为 hover 和 signature help 添加边框
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
