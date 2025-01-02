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
	    -- Now blink-cmp can be added to the existing
	    -- capabilities of each language server

	    -------------------------------------------------------------------
	    -- SECTION: Low-Level Systems Programming

	    -- Rust
	    require("lspconfig").rust_analyzer.setup({
		capabilities = blink_cmp
	    })

	    --- Zig
	    require("lspconfig").zls.setup({
		capabilities = blink_cmp
	    })

	    --- C and C++
	    require("lspconfig").clangd.setup({
		capabilities = blink_cmp
	    })

	    -------------------------------------------------------------------
	    -- SECTION: Back-End Development	    

	    -- Go
	    require("lspconfig").gopls.setup({
		capabilities = blink_cmp
	    })

	    -- Python
	    require("lspconfig").pyright.setup({
		capabilities = blink_cmp
	    })

	    -------------------------------------------------------------------
	    -- SECTION: Scripting

	    -- Bash
	    require("lspconfig").lua_ls.setup({
		capabilities = blink_cmp
	    })
    
	    -- Lua
	    require("lspconfig").bashls.setup({
		capabilities = blink_cmp
	    })

	    -------------------------------------------------------------------

	end
    }

}
