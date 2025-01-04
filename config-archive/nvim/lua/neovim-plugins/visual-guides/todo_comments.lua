return {

    {
        "folke/todo-comments.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" }
        },
        config = function()
            require("todo-comments").setup({
		-- Show icons in the sign column on the left
		-- of the line numbers
                signs = true,
		-- Ensure that the signs are visible
                sign_priority = 8,
                keywords = {
                    SECTION = { icon = "🚀", color = "section" },
                    SUB_SECTION = { icon = "🛩️", color = "sub_section" },
                    NOTE = { icon = "📚", color = "note" },
                    ABOUT = { icon = "📜", color = "about" },
                    AUDIT = { icon = "🕵️", color = "audit" },
                    TODO = { icon = "🍨", color = "todo"}
                },
                colors = {
                    note = { "#00ff91" },
                    section = { "#c048f7" },
                    sub_section = { "#ff0062" },
                    audit = { "#00ff50" },
                    about = { "#ffb000" },
                    todo = { "#1ecbe1"}
                },

            })
	end

    }

}
