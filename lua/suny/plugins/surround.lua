-- 字符串两侧添加字符，比如双引号的插件
-- 添加 ysiw 选中光标所在的字符串 + 想在两端添加的字符比如""
-- 删除 ds + 想删除两侧的字符(两侧字符必须相同,比如"")
-- 替换 cs + 替换前的字符 + 替换后的字符 (比如先"" 后 ''  将两侧"" 替换成 '')
-- t html标签
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
