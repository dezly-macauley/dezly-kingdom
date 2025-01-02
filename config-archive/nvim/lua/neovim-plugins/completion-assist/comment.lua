return {
    -- Turn a line into a comment by typing gcc
    -- You can also create multiline comments by typing gbc

    {
        "numToStr/Comment.nvim",
        -- The plugin will only load when a new file has been created,
        -- or right before you switch to an existing file.
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("Comment").setup({})
        end
    }

}
