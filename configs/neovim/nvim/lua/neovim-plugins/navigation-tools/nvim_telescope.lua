return {

    {
	"nvim-telescope/telescope.nvim",
	dependencies = {
	    "nvim-lua/plenary.nvim",

	    -- This will make Telescope nvim faster
	    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	    config = function()
    
	    end
	}

    }

}
