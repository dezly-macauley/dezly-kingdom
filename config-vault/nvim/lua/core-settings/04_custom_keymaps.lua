-- SECTION: Local Variables (For Convenience)
local keymap = vim.keymap.set

-------------------------------------------------------------------------------
-- SECTION: Terminal

keymap(
    "n",
    "<leader>t",
    -- This will open the terminal without any line numbers
    ":split<CR>:terminal<CR>:setlocal nonumber norelativenumber<CR>i",
    { desc = "Open the [t]erminal and switch to insert mode" }
)


keymap(
    "n",
    "<leader>vt",
    -- This will open the terminal without any line numbers
    ":vsplit<CR>:terminal<CR>:setlocal nonumber norelativenumber<CR>i",
    { desc = "Open the [t]erminal and switch to insert mode" }
)

-- Alt + e
-- Switch back to `Normal Mode` when using the `Terminal Mode`,
-- and then go back to the screen that has your code.
-- Press `Alt t`
keymap(
    "t",
    "<M-e>",
    "<C-\\><C-n><C-w>w",
    { desc = "[e]xit the terminal and return to your code" }
)

-------------------------------------------------------------------------------
-- Window Navigation

keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-------------------------------------------------------------------------------
-- SECTION: File Navigation

-- Ctrl + n
keymap(
    "n",
    "<C-n>",
    ":bn<CR>",
    { desc = "[f]ile [n]ext"}
)

keymap(
    "n",
    "<leader>c",
    ":bd<CR>",
    { desc = "[c]lose buffer" }
)

-------------------------------------------------------------------------------
-- Error handling
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-------------------------------------------------------------------------------

-- keymap("n", "grr", vim.lsp.buf.references)

-------------------------------------------------------------------------------
-- Buffer = The in-memory text of a file

-- A Window = A viewport of a buffer
-- You can have several windows viewing the same buffer

-- A tab is a collection of buffers

-------------------------------------------------------------------------------

-- SECTION: Custom Keymaps For Plugins
-------------------------------------------------------------------------------
-- NOTE: This keymap requires the plugin oil.nvim
keymap("n", "<leader>fe", "<CMD>Oil<CR>",
{ desc = "Open parent directory" })

-------------------------------------------------------------------------------
-- NOTE: This keymap is for `nvim telescope`

local tsb = require("telescope.builtin")

keymap("n", "<leader>sf", tsb.find_files)
-- To close nvim telescope after opening it press `Esc` `Esc`

-- This allows you to search and open files in your Neovim config 
-- from any directory
keymap(
    "n", "<leader>snc",
    function ()
	tsb.find_files({
	    cwd = vim.fn.stdpath("config")
	})
    end
)

-- This allows you to search and open configuration files 
-- in Dezly Kingdom from any directory
keymap(
    "n", "<leader>sdk",
    function ()
        tsb.find_files({
            -- cwd = "/home/dezly-macauley/.dezly-kingdom"
            cwd = "$HOME/.dezly-kingdom"
        })
    end
)
-------------------------------------------------------------------------------
-- SECTION: Requires Peek
-- keymap("n", "<leader>mo", ":PeekOpen<CR>")
-- keymap("n", "<leader>mc", ":PeekClose<CR>")

-------------------------------------------------------------------------------
