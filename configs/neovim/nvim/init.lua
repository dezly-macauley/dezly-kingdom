-- NOTE: How to enter filepaths when using require

-- Neovim automatically adds the ~/.config/nvim/lua 
-- directory to Lua's package search path. When you use require(), 
-- it specifically looks for modules in directories named lua/ within 
-- Neovim's runtime path. This is why you don't need to include "lua" 
-- in the require path - Neovim has already set this up for you.

require("core-settings.01_leader_key")
require("core-settings.02_neovim_options")
require("core-settings.03_plugin_manager")
require("core-settings.04_custom_keymaps")
