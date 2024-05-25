-- 用于在输入代码时显示函数签名帮助信息
-- 主要功能
-- 实时签名帮助：在你输入函数名和左括号时显示函数的参数列表。
-- 参数高亮：当前正在输入的参数会被高亮显示，帮助你理解参数的位置和类型。
-- 多语言支持：支持 Neovim 所有 LSP 语言服务器，适用于多种编程语言。
-- 可配置：可以根据需要配置提示框的位置、外观和行为。
return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
}
