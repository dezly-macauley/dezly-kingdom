return {

    {
	-- This will install the plugin from GitHub
	"navarasu/onedark.nvim",

	-- config will trigger the annoymous function,
	-- to perform some tasks after the plugin has been installed
	config = function()

	    -- The first task is to setup the default configurations 
	    -- of the plugin
	    require("onedark").setup({

		-- NOTE: You do not need to put anything here in order
		-- for the plugin to work.
		-- This area is for overwritting the default settings,
		-- or when you want to explicitly add a setting.
		style = "deep",
		transparent = true,

	    })

	    -- The second task is to actually set the plugin
	    -- as the colour scheme for the Neovim editor.
	    -- Most plugins that are not colour schemes will not have
	    -- a second task.
	    require("onedark").load()
	end
    }

}
