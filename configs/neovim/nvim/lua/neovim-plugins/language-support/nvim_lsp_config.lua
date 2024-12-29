return {

    {
	"neovim/nvim-lspconfig",
	config = function()

	    -- -- Low-Level Systems Programming
	    -- require("lspconfig").rust_analyzer.setup({})
	    --
	    -- -- Scripting
	    require("lspconfig").lua_ls.setup({})

	end
    }

}
