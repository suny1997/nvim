-- lua/config/loader.lua

local config_path = "config" -- Specify the module path relative to the 'lua' directory

-- Function to load all Lua files in the config directory
local function load_config_files()
  local files = vim.fn.globpath(vim.fn.stdpath "config" .. "/lua/" .. config_path, "*.lua", false, true)

  for _, file in ipairs(files) do
    -- Remove the directory path and the .lua extension
    local module_name = file:match "lua/(.+)%.lua$"

    -- Load the Lua module
    if module_name ~= config_path .. "/loader" then -- Avoid reloading this file
      require(module_name:gsub("/", "."))
    end
  end
end

-- Call the function to load config files
load_config_files()
