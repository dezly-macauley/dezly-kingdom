return {

    {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

    -- NOTE: This requires Rust to be installed on your system
    build = "cargo build --release",

	config = function()
	    require("blink.cmp").setup({})
	end
    }

}
