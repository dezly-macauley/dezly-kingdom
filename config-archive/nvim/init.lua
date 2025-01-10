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

-- SECTION: Vyper Lsp

-- local blink_cmp = require("blink.cmp").get_lsp_capabilities()

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.vy" },
    callback = function()
	vim.lsp.start({
	    name = "vyper_lsp",
	    cmd = { "vyper-lsp" },
	    root_dir = vim.fs.dirname(vim.fs.find({ ".git" },
	    { upward = true })[1]),
	    capabilities = blink_cmp
	})
    end,
})

-------------------------------------------------------------------------------
