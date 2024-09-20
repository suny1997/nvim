local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",-- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "suny.plugins" }, { import = "suny.plugins.lsp" } }, {
  -- 更新检查,这里加上，状态栏才会显示
  checker = {
    enabled = true,
    notify = false,
  },
  -- 改变配置时,不通知
  change_detection = {
    notify = false,
  },
})
