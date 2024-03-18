-- 切换输入法插件
return {
  'keaising/im-select.nvim',
  config = function()
    require('im_select').setup {
      default_im_select = '1033',
      set_previous_events = { 'InsertEnter', 'FocusLost' },
    }
  end,
}
