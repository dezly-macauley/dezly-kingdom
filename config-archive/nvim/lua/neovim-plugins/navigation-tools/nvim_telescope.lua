return {

    {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	dependencies = {
	    "nvim-lua/plenary.nvim",

	    -- This is an extension to improve 
	    -- the sorting speed of telescope
	    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

	    config = function()
		require("telescope").load_extension("fzy_native")
	    end
	}

    }

}

