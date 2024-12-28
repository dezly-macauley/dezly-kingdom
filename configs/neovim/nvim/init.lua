-- This will sync Neovim with your system clipboard,
-- so that it is easy to copy and paste things into Neovim, 
-- and out of Neovim as well.
vim.opt.clipboard = "unnamedplus"

-------------------------------------------------------------------------------
-- This is how to make a single line comment in Lua
-- Since this message is init.lua, it will show up at the bottom of the editor
print("Neovim is the best")


-- To view this message in Neovim
-- `:messages`

-------------------------------------------------------------------------------
-- SECTION: How to execute a line of lua code

-- E.g. To execute a line of lua code do this:
print("Dezly Kingdom")

-- Move your cursor to the line `print("Dezly Kingdom")
-- Select the line by pressing `V` (captital letter)
-- Then press `:` to enter command mode

-- You should see this in command mode:
-- `:'<,'>`

-- Type lua at the end, and then press enter to run the code
-- `:'<,'>lua`

-- What does '<,'> mean?
-- This is the range of what you selected when you press `V`
-- '< means the start of your selection
-- '> means the end of your selection

-- So `:'<,'>lua` means, execute everything I selected using the lua compiler 

-------------------------------------------------------------------------------
-- SECTION: How to make functions in Lua

-- Create the function
function greetKing()
    print("Greetings Dezly Macauley")
end

-- Call the function
greetKing()

-- You can also call this function from Neovim:
-- `:lua greetKing()`

-------------------------------------------------------------------------------

-- SECTION: Sourcing a file

-- `:so %` shorthand in Neovim for `:source %`
-- This is used to source (reload) a file in Neovim
-- The syntax is `:so path-to-the-file`

-- `%` means `this current file`
-- :so %

-------------------------------------------------------------------------------
