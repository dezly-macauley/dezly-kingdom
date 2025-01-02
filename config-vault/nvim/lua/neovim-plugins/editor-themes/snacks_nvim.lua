return {

    -- NOTE: Snacks.nvim id
    -- A collection of small QoL plugins for Neovim.

    {
	"folke/snacks.nvim",

	opts = {
	    -- NOTE: These is where you select which plugins to enable	

	    -- This plugin is for smooth scrolling in Neovim
	    scroll = { enabled = true },

	    -- This adds a vertical line that shows you what scope you are
	    -- currently inside
	    indent = { enabled = true },

	}

    }

}
