return {

    {
	"stevearc/oil.nvim",
	dependencies = {
	    "echasnovski/mini.icons",
	    config = function()
		require("mini.icons").setup({})
	    end
	},
	config = function()
	    require("oil").setup({

		-- Show files and directories that start with "."
		view_options = {
		    show_hidden = false
		},
		
		-- I only want to Enter as a keymap
		use_default_keymaps = false,
		keymaps = {
		    ["<CR>"] = "actions.select",
		},

	    })
	end
    }

}
