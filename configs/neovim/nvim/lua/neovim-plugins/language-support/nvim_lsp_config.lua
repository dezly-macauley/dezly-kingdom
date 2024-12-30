return {

    {
	    "neovim/nvim-lspconfig",
	    config = function()

	    -- NOTE: This line below requires the plugin `blink-cmp`
	    local blink_cmp = require("blink.cmp").get_lsp_capabilities()
	    -- This creates a local variable that will activate the 
	    -- enhanced lsp capabilities of blink-cmp

	    -------------------------------------------------------------------
	    --- NOTE: Check this link to see the list of available-lsp-servers
	    -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
	    -------------------------------------------------------------------
	    -- Low-Level Systems Programming
	    require("lspconfig").rust_analyzer.setup({
		-- Now blink-cmp can be added to the existing
		-- capabilities of each language server
		capabilities = blink_cmp
	    })

	    -------------------------------------------------------------------
	    -- Scripting
	    require("lspconfig").lua_ls.setup({
		capabilities = blink_cmp
	    })
	    
	    -------------------------------------------------------------------

	end
    }

}
