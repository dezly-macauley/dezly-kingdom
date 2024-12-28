-- SECTION: Using Neovim

-- To use Tutor
-- `:Tutor`
-- Last lesson = `Lesson 2.7: The undo command`

-------------------------------------------------------------------------------
-- SUB_SECTION: Normal Mode
-- This is the mode that Neovim starts fo by default

-------------------------------------------------------------------------------
-- Basic Movements

-- `j` move the cursor to the line below
-- Think of this as `j`umping down to the next line

-- `k` move the cursor to the line above 
-- Think of this as `k`icking the cursor up to the line above 

-- `h` move the cursor to towards the beginning of the current line
-- `l` move the cursor to away from the beginning of the current line

-- `0` zero will move your cursor to the start of the line
-- `$` will move your cursor to the end of the line

-- `w` move the cursor to the start of the next word
-- `e` move the cursor to the end of the next word

-------------------------------------------------------------------------------
-- Destructive Keys
-- `x` delete the character that the cursor is on
-- `X` delete the character on the left of where the cursor is

-- `dw` delte the current word
-- `dd` delete the entire line
-- `d$` delete everything from the cursor until the end of the line

-- `u` undo the last change you made to a file
-- `U` undo all changes made to the current line
-- `Ctrl-r` redo


-------------------------------------------------------------------------------
-- Copy (In Neovim copying is called `yanking`), Cut, Paste

-- NOTE: In Neovim deleting content is the same as cutting it
-- In simple terms anything you delete can be pasted.

-- `yy` to copy the entire line 
-- `p` to paste below the current line
-- `P` to paste above the current line

-------------------------------------------------------------------------------
-- SUB_SECTION: Insert Mode

-- `i` This will switch the cursor to insert mode, 
-- and place it before the current word

-- `a` This will switch the cursor to insert mode, 
-- and place it after the current word

-- To switch the cursor back to normal mode press `Ctrl-c` or `Esc`

-- `I` Move the cursor to the beginning of a line
-- `A` Move the cursor to the end of a line

-------------------------------------------------------------------------------
-- SUB_SECTION: Command Mode

-- Saving and Quiting Neovim

-- Press `:` to enter command mode, then type a command and press enter.
-- To exit command mode, press `Ctrl-c` or `Esc`

-- `:w` This will save the changes that you have made to the current file

-- `:q` quit Neovim (You will be stopped from exiting if you
-- have not saved your changes)

-- You can combine the two commands above:
-- `:wq` This will save your changes and quit Neovim

-- `:q!` This will quit Neovim WITHOUT saving your changes

-------------------------------------------------------------------------------

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
