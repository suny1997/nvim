-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
-- 允许自定义 Neovim 的用户界面
-- return {
--   "AstroNvim/astroui",
--   ---@type AstroUIOpts
--   opts = {
--     -- change colorscheme
--     -- 颜色方案配置
--     colorscheme = "catppuccin-mocha",
--     -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
--     -- 高亮组配置
--     -- 为所有主题或者特定主题（如 astrodark）定义和覆盖高亮组
--     highlights = {
--       init = { -- this table overrides highlights in all themes
--         -- Normal = { bg = "#000000" },
--       },
--       astrodark = { -- a table of overrides/changes when applying the astrotheme theme
--         -- Normal = { bg = "#000000" },
--       },
--     },
--     -- Icons can be configured throughout the interface
--     -- 图标配置
--     icons = {
--       -- configure the loading of the lsp in the status line
--       -- 配置状态栏中的 LSP 加载图标
--       -- 这些图标会在状态栏中显示 LSP 加载的进度
--       LSPLoading1 = "⠋",
--       LSPLoading2 = "⠙",
--       LSPLoading3 = "⠹",
--       LSPLoading4 = "⠸",
--       LSPLoading5 = "⠼",
--       LSPLoading6 = "⠴",
--       LSPLoading7 = "⠦",
--       LSPLoading8 = "⠧",
--       LSPLoading9 = "⠇",
--       LSPLoading10 = "⠏",
--     },
--   },
-- }
--
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    highlights = {
      -- set highlights for all themes
      -- use a function override to let us use lua to retrieve
      -- colors from highlight group there is no default table
      -- so we don't need to put a parameter for this function
      init = function()
        local get_hlgroup = require("astroui").get_hlgroup
        -- get highlights from highlight groups
        local normal = get_hlgroup "Normal"
        local fg, bg = normal.fg, normal.bg
        local bg_alt = get_hlgroup("Visual").bg
        local green = get_hlgroup("String").fg
        local red = get_hlgroup("Error").fg
        -- return a table of highlights for telescope based on
        -- colors gotten from highlight groups
        return {
          TelescopeBorder = { fg = bg_alt, bg = bg },
          TelescopeNormal = { bg = bg },
          TelescopePreviewBorder = { fg = bg, bg = bg },
          TelescopePreviewNormal = { bg = bg },
          TelescopePreviewTitle = { fg = bg, bg = green },
          TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
          TelescopePromptNormal = { fg = fg, bg = bg_alt },
          TelescopePromptPrefix = { fg = red, bg = bg_alt },
          TelescopePromptTitle = { fg = bg, bg = red },
          TelescopeResultsBorder = { fg = bg, bg = bg },
          TelescopeResultsNormal = { bg = bg },
          TelescopeResultsTitle = { fg = bg, bg = bg },
        }
      end,
    },
  },
}
