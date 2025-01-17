return {

    {
	-- This will install the plugin from GitHub
	"marko-cerovac/material.nvim",
	enabled = false,
	-- config will trigger the annoymous function,
	-- to perform some tasks after the plugin has been installed
	config = function()

	    -- The first task is to setup the default configurations 
	    -- of the plugin
	    require("material").setup({


	    })

	    -- Activate the theme
	    vim.cmd 'colorscheme material'


	end
    }

}
