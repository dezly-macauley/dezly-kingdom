return {
    -- When you type ( or { or [,
    -- the closing pair will be added for you.
    -- E.g. () {} [] `` '' ""

    {
        "windwp/nvim-autopairs",
	enabled = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
	    require("nvim-autopairs").setup({})
        end,
    }

}
