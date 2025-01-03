return {

    {
        "akinsho/bufferline.nvim",
	enabled = true,
        dependencies = {
	    "nvim-tree/nvim-web-devicons",
	    config = function()
		require("nvim-web-devicons").setup({})
	    end
	},
        config = function()
            require("bufferline").setup({})
        end
    }

}
