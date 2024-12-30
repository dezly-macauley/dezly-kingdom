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

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- SECTION: Neovim Configuration File Structure

-- NOTE: init.lua
-- When you open Neovim, it will look inside the `nvim` directory 
-- for a file specifically called `init.lua` and it will execute 
-- everything in the file starting from the top to the bottom, in order.

-- NOTE: `after/ftplugin/name_of_file_type.lua`
-- This a specific file path in Neovim. Do not rename it.
-- After Neovim had loaded all the settings from in init.lua, 
-- it will then look for a directory inside the `nvim` directory 
-- called `after/ftplugin`, 
-- and check if it needs to overwrite any settings for specific file types

-- E.g. Let's say that in `init.lua` I have 4 space indentation for all 
-- the languages but for `TypeScript` I want 2 space indentation.

-- If you are not sure what the filetype of a file is,
-- open the file in Neovim and then run this command
-- `:echo &filetype`

-- Then create a file that will automatically apply certain settings when
-- you open a TypeScript file:
-- after/ftplugin/typescript.lua (Make sure it ends with .lua)

-- Add this to the typescript.lua file:
-- vim.opt_local.shiftwidth = 2

-- NOTE: vim.opt_local means 
-- So normally vim.opt_local means 
-- "only apply these settings to this current file".
-- This is to ensure that these setting are not applied 
-- to everything in the editor. 

-- And when used with the after/ftplugin structure Neovim 
-- will apply this to all TypeScript files. 

