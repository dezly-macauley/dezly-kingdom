return {


--- NOTE: Check this link for a list of supported languages
-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages

    {
	"nvim-treesitter/nvim-treesitter",
	-- This tells the package manager `lazy.nvim`,
	-- That whenever nvim-treesitter is updated,
	-- it should run the command `:TSUpdage`,
	-- to ensure that both nvim-treesitter and the syntax highlighting
	-- for the specific languages listed in `ensure installed` 
	-- are updated as well
	build = ":TSUpdate",
	config = function()
	    require'nvim-treesitter.configs'.setup {
		ensure_installed = {
		    -------------------------------------------------------
		    -- Systems Programming
		    "rust", "zig", "c", "go", "asm",

		    -------------------------------------------------------
		    -- Database Management
		    "sql",

		    -------------------------------------------------------
		    -- Smart Contract Development 

		    "solidity",

		    -------------------------------------------------------
		    -- Web Development 

		    "htmldjango",
		    "svelte",

		    "html",
		    "css",
		    "typescript", "javascript",
		    "python",

		    -------------------------------------------------------
		    -- Data Serialization 
		    "json", "toml", "gomod",
		    "gitignore", "ini",

		    -------------------------------------------------------
		    -- Scripting
		    "bash", "lua", "make",

		    -------------------------------------------------------
		    -- Documentation
		    "markdown", "markdown_inline"

		    -------------------------------------------------------
		},
		sync_install = false,
		auto_install = false,
		modules = {},
		ignore_install = {},
		highlight = {
		    enable = true,
		}
	    }
	end
    }

}
