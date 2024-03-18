-- 补全时自动添加括号()的插件
return {
  'windwp/nvim-autopairs',
  event = 'VeryLazy',
  config = function()
    require('nvim-autopairs').setup {}
  end,
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
