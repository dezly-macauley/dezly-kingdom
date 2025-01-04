-- SECTION: Custom Keymaps - Native Neovim Commands

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
keymap('n', '<leader>q', vim.diagnostic.setloclist,
{ desc = 'Open diagnostic [Q]uickfix list' })
-------------------------------------------------------------------------------

-- keymap("n", "grr", vim.lsp.buf.references)

-------------------------------------------------------------------------------
-- Buffer = The in-memory text of a file

-- A Window = A viewport of a buffer
-- You can have several windows viewing the same buffer

-- A tab is a collection of buffers

-------------------------------------------------------------------------------
-- SECTION: Custom Keymaps - Neovim Plugins

-------------------------------------------------------------------------------
-- SUB_SECTION: Peek.nvim 
-- View markdown files in a brower window

keymap(
    "n", "<leader>mo",
    ":PeekOpen<CR>",
    { desc = "[m]arkdown [o]pen" }
)

keymap(
    "n", "<leader>mc",
    ":PeekClose<CR>",
    { desc = "[m]arkdown [c]close" }
)

-------------------------------------------------------------------------------
-- SUB_SECTION: Oil.nvim
-- View and edit files and directories like they are text

keymap(
    "n", "<leader>fe",
    "<CMD>Oil<CR>",
    { desc = "[f]ile [e]plorer" }
)

-------------------------------------------------------------------------------
-- SUB_SECTION: Telescope.nvim
-- An efficient way to seach for a file

-- NOTE: To close telescope without selecting an option,
-- press `Ctrl c` or `Esc` twice

local tsb = require("telescope.builtin")

keymap(
    "n", "<leader><leader>",
    tsb.buffers,
    { desc = "View files that are currently open" }
)

keymap(
    "n", "<leader>sf",
    tsb.find_files,
    { desc = "[s]earch [f]iles in directory" }
)
keymap(
    "n", "<leader>sd",
    tsb.diagnostics,
    { desc = "[s]earch [d]iagnostics" }
)

keymap(
    "n", "<leader>sk",
    tsb.keymaps,
    { desc = "[s]earch [k]eymaps" }
)

keymap(
    "n", "<leader>sh",
    tsb.help_tags,
    { desc = "[s]earch [h]elp" }
)

keymap(
    "n", "<leader>snc",
    function ()
	tsb.find_files({
	    cwd = vim.fn.stdpath("config")
	})
    end,
    { desc = "[s]earch [n]eovim [c]onfig" }
)

keymap(
    "n", "<leader>sdk",
    function ()
        tsb.find_files({
            cwd = "$HOME/.dezly-kingdom"
        })
    end,
    { desc = "[s]earch [d]ezly [k]ingdom" }
)

-------------------------------------------------------------------------------
