return {

    {
	"folke/trouble.nvim",
	enabled = true,
        -- The plugin will only load when a new file has been created,
        -- or right before you switch to an existing file.
        event = { "BufReadPre", "BufNewFile" },
	opts = {}
    }

}
