return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "MagicDuck/grug-far.nvim",
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "Yazi(当前文件)",
    },
    {
      -- Open in the current working directory
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Yazi(当前工作目录)",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Yazi(上一次会话)",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  config = function()
    require("grug-far").setup({
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    })
  end,
}
