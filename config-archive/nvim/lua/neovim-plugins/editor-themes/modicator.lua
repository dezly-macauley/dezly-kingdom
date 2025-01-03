return {
    -- This works with the plugin lualine
    -- Makes your cursorline number the same colour as the current Neovim mode
    {
        "mawkler/modicator.nvim",
	enabled = true,
        config = function()
            require("modicator").setup({
                highlights = {
                    defaults = {
                        bold = true,
                    },
                },
            })
        end
    }
}
