-- SECTION: Install lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- This will add lazy.nvim to Neovim's runtime path
-- After installing this, and re-opening Neovim,
-- you should see that lazy.nvim has been added to your runtime path
-- by running the following command:
-- `:e echo nvim_list_runtime_paths()`
vim.opt.rtp:prepend(lazypath)

-- You can also run this command to check that the plugin manager
-- has everything needed to do its job:
-- `:checkhealth lazy`

-------------------------------------------------------------------------------
-- Setup lazy.nvim
require("lazy").setup({

    spec = {
	-- List the directories in `neovim-plugins
	{ import = "neovim-plugins.editor-themes" },
	{ import = "neovim-plugins.visual-guides" },
	{ import = "neovim-plugins.completion-assist" },
	{ import = "neovim-plugins.language-support" },
	{ import = "neovim-plugins.navigation-tools" },
	{ import = "neovim-plugins.navigation-tools" },
	{ import = "neovim-plugins.markdown-viewer"}
    }

})


-------------------------------------------------------------------------------
