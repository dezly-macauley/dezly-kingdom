local keymap = vim.keymap.set

keymap(
    "n",
    "<leader>jf",
    ":%!jq .<CR>",
    { desc = "[j]son [f]ormat" }
)
