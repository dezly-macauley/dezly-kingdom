return {

    {
	    "neovim/nvim-lspconfig",
	    enabled = true,
	    config = function()
	    -------------------------------------------------------------------
		--- NOTE: To find out what is the correct name
		--- for the lsp server you want, check the link below:

		-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers

		local lsp = require("lspconfig")
	    -------------------------------------------------------------------
		-- NOTE: This line below requires the plugin `blink-cmp`

		-- This creates a local variable that will activate the 
		-- enhanced lsp capabilities of blink-cmp
		local blink_cmp = require("blink.cmp").get_lsp_capabilities()

	    -------------------------------------------------------------------
	    -- SECTION: Low-Level Systems Programming

		-- Rust
		lsp.rust_analyzer.setup({
		    capabilities = blink_cmp
		})

		--- Zig
		lsp.zls.setup({
		    capabilities = blink_cmp
		})

		--- C and C++
		lsp.clangd.setup({
		    capabilities = blink_cmp
		})

	    -------------------------------------------------------------------
	    -- SECTION: Back-End Development	    

		-- Go
		lsp.gopls.setup({
		    capabilities = blink_cmp
		})

		-- Python
		lsp.pyright.setup({
		    capabilities = blink_cmp
		})

		-- SQL
		lsp.sqlls.setup({
		    capabilities = blink_cmp
		})

	    -------------------------------------------------------------------
	    -- SECTION: Scripting

		-- Bash
		lsp.bashls.setup({
		    capabilities = blink_cmp
		})

		-- Lua
		lsp.lua_ls.setup({
		    capabilities = blink_cmp
		})


	    -------------------------------------------------------------------
	    -- SECTION: Front-End Development

		-- TypeScript
		lsp.denols.setup({
		    capabilities = blink_cmp
		})

		-- Svelte
		lsp.svelte.setup({
		    capabilities = blink_cmp
		})

		-- Tailwind CSS
		lsp.tailwindcss.setup({
		    capabilities = blink_cmp
		})

		-- CSS 
		lsp.cssls.setup({
		    capabilities = blink_cmp
		})

		-- HTML 
		lsp.html.setup({
		    capabilities = blink_cmp
		})

	    -------------------------------------------------------------------
	end
    }

}
