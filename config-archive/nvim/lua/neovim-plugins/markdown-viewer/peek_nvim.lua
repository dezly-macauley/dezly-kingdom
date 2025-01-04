return {

    {
	"toppair/peek.nvim",
	enabled = true,

	-- This will load the plugin only when a markdown file is opened 
	ft = "markdown",

	-- NOTE: This line requires you to have Deno installed on your system

	--  This will use Deno to build the plugin when it is installed
	--  for the first time
	build = "deno task --quiet build:fast",

	-- This is a function that will execute two tasks
	config = function()

	    -- Task 1: Load the default configuration of the plugin
	    require("peek").setup({
		app = { "firefox", "--new-window" }
	    })

	    -- Task 2: Create the commands `:PeekOpen` and `:PeekClose`
	    vim.api.nvim_create_user_command(
		"PeekOpen", require("peek").open, {}
	    )
	    vim.api.nvim_create_user_command(
		"PeekClose", require("peek").close, {}
	    )
	end
    }

}
