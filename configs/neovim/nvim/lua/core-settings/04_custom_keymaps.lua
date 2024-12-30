-- SECTION: Local Variables (For Convenience)
local kms = vim.keymap.set

-------------------------------------------------------------------------------

-- kms("n", "grr", vim.lsp.buf.references)

-------------------------------------------------------------------------------
-- Buffer = The in-memory text of a file

-- A Window = A viewport of a buffer
-- You can have several windows viewing the same buffer

-- A tab is a collection of buffers

-------------------------------------------------------------------------------

-- SECTION: Custom Keymaps For Plugins
-------------------------------------------------------------------------------
-- NOTE: This keymap requires the plugin oil.nvim
kms("n", "<leader>fe", "<CMD>Oil<CR>",
{ desc = "Open parent directory" })

-------------------------------------------------------------------------------
-- NOTE: This keymap is for `nvim telescope`

local tsb = require("telescope.builtin")

kms("n", "<leader>sf", tsb.find_files)
-- To close nvim telescope after opening it press `Esc` `Esc`

-- This allows you to search and open files in your Neovim config 
-- from any directory
kms(
    "n", "<leader>snc",
    function ()
	tsb.find_files({
	    cwd = vim.fn.stdpath("config")
	})
    end
)

-- This allows you to search and open configuration files 
-- in Dezly Kingdom from any directory
kms(
    "n", "<leader>sdk",
    function ()
        tsb.find_files({
            -- cwd = "/home/dezly-macauley/.dezly-kingdom"
            cwd = "$HOME/.dezly-kingdom"
        })
    end
)


-------------------------------------------------------------------------------
