return {

    {
	"saghen/blink.cmp",
	enabled = true,
	dependencies = {
	    "rafamadriz/friendly-snippets"
	},
	-- `+nightly` tells Rust to build the blink.cmp plugin using the 
	-- nightly version of the Rust compiler (even if you have 
	-- set your default compiler to use the stable version of Rust)

	-- You simply need the nightly version of cargo installed.
	build = "cargo +nightly build --release",
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
