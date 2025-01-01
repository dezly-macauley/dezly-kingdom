local colors = {
    blue   = "#000AB8",
    cyan   = "#79dac8",
    black  = "#080808",
    white  = "#FFFFFF",
    pink    = "#B8004B",
    purple = "#750095",
    purple2 = "#9E00FF",
    grey   = "#303030",
    orange = "#D03300",
    green = "#006921",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.purple },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  command = { a = { fg = colors.white, bg = colors.orange } },
  insert = { a = { fg = colors.purple2, bg = colors.black } },
  visual = { a = { fg = colors.white, bg = colors.blue} },
  replace = { a = { fg = colors.black, bg = colors.pink } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

-------------------------------------------------------------------------------
return {

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" }
        },
        config = function()
            require("lualine").setup({

                options = {
                    theme = bubbles_theme,
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                    lualine_b = { "filename", "branch" },
                    lualine_c = {
                        "%=", --[[ add your center compoentnts here in place of this comment ]]
                    },
                    lualine_x = {},
                    lualine_y = { "filetype", "progress" },
                    lualine_z = {
                        { "location", separator = { right = "" }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                tabline = {},
                extensions = {},

            })
        end

    }

}
