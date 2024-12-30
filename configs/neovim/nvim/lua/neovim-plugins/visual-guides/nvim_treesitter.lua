return {

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

		require("nvim-treesitter.configs").setup({
		    -- I only want treesitter to install parsers for
		    -- the languages listed in `ensure_installed`  
		    auto_install = false,

		    -- NOTE: Check this link for a list of supported languages
		    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
		    ensure_installed = {

			-------------------------------------------------------
			-- Low-Level Systems Programming
			"rust", "zig", "c", "cpp",

			-------------------------------------------------------
			-- AI and Web3
			"python", "solidity",

			-------------------------------------------------------
			-- Back-End Development	
			"go",

			-------------------------------------------------------
			-- Front-End Development
			"svelte", "typescript", "javascript",

			-- User Interface Design
			"css", "html",

			-------------------------------------------------------
			-- Database Management
			"sql",

			-- Data Serialization 
			"json", "toml", "gomod",

			-------------------------------------------------------
			-- Scripting
			"bash", "lua",

			-------------------------------------------------------
			-- Documentation
			"markdown", "markdown_inline"

			-------------------------------------------------------

		    }
		    

		})

	    end

	}

}
