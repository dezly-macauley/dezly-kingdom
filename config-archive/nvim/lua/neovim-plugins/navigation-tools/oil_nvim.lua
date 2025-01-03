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

		-- When a file is deleted, it will be sent
		-- to the trash instead of being immediately
		-- deleted.

		-- NOTE: When a file is deleted it goes to 
		-- `.local/share/Trash`
		delete_to_trash = true,

		-- Show files and directories that start with "."
		view_options = {
		    show_hidden = true 
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
