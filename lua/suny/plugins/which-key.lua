-- 键盘提示插件
return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = "<Up> ",
        Down = "<Down> ",
        Left = "<Left> ",
        Right = "<Right> ",
        C = "<C-…> ",
        M = "<M-…> ",
        D = "<D-…> ",
        S = "<S-…> ",
        CR = "<CR> ",
        Esc = "<Esc> ",
        ScrollWheelDown = "<ScrollWheelDown> ",
        ScrollWheelUp = "<ScrollWheelUp> ",
        NL = "<NL> ",
        BS = "<BS> ",
        Space = "<Space> ",
        Tab = "<Tab> ",
        F1 = "<F1>",
        F2 = "<F2>",
        F3 = "<F3>",
        F4 = "<F4>",
        F5 = "<F5>",
        F6 = "<F6>",
        F7 = "<F7>",
        F8 = "<F8>",
        F9 = "<F9>",
        F10 = "<F10>",
        F11 = "<F11>",
        F12 = "<F12>",
      },
    },

    -- Document existing key chains
    spec = {
      -- { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      { "<leader>c", group = "[C]ode(代码项)" },
      { "<leader>f", group = "[F]ind(搜索项)" },
      { "<leader>l", group = "[L]sp(LSP项)" },
      { "<leader>s", group = "[S]plit(分屏项)" },
      { "<leader>w", group = "[W]orksession(会话项)" },
      { "<leader>t", group = "[T]abufline(标签项)" },
      { "<leader>x", group = "[X]trouble(问题项)" },
      { "<leader>g", group = "[G]it(Git项)" },
      { "<leader>h", group = "[H]unk(GitSign项)" },
    },
  },
}
