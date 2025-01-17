return {

    {
	"sphamba/smear-cursor.nvim",
        config = function()
            require("smear_cursor").setup({
		cursor_color = '#3deb34',
		-- Drawing the smear over a transparent background works 
		-- better when using a font that supports legacy computing 
		-- symbols, therefore setting the following option:
		legacy_computing_symbols_support = true,
	
		-- If your font does not support legacy computing symbols, 
		-- there will be a shadow under the smear. 
		-- You may set a color for this shadow to be less noticeable:
		transparent_bg_fallback_color = "#303030",
            })
        end

    }

}
