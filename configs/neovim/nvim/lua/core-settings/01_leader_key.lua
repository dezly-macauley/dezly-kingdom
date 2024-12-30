-- The <leader> key is the first key that you press, 
-- when you want to activate a custom shortcut in Neovim

-- This will set the <leader> key to the space key on a global level
-- The leader key will be set to space even when you don't have a file open
vim.g.mapleader = " "

-- This will set the <leader> key to the space key on a local level
-- The leader key will be set to space when you have a file open
vim.g.maplocalleader = "\\"

-- When you press the leader key, Neovim will give you 500 milliseconds
-- (half a second) for you to enter a keyboard shortcut. 
-- If you press the shortcut faster than that, it will be immediately executed.
vim.opt.timeoutlen = 500
