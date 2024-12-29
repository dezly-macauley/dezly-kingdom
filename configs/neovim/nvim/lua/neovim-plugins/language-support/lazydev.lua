return {

    -- This plugin will let Lua know about global variables like
    -- `vim` that are specific Neovim.
    -- This will get rid of the yellow warnings when editing
    -- your Neovim config
	{
	    "folke/lazydev.nvim",

	    -- This will only load the plugin when you open a lua file
	    ft = "lua",
	    opts = {

	      library = {
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } }
	      }

	    }

      }

}
