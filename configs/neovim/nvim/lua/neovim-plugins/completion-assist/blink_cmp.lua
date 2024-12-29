return {

    {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

    -- NOTE: This requires Rust to be installed on your system
    build = "cargo build --release",

	config = function()
	    require("blink.cmp").setup({

		-- NOTE: This is an experiemental feature
		-- This will start showing the signature of
		-- a function when you start typing 
		-- `name_of_your_function(` and it will update
		-- the menu as you add each arguement
		signature = { enabled = true }
	    })
	end
    }

}
