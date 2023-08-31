require('material').setup({
    contrast = {
        sidebars = true,
        floating_windows = false,
        cursor_line = true,
        popup_menu = false,
    },
    plugins = {
       "dap",
       "gitsigns",
       "indent-blankline",
       "neogit",
       "nvim-cmp",
       "nvim-tree",
       "nvim-web-devicons",
       "telescope",
       "which-key",
    },
    styles = {
        comments = { italic = true },
        functions = { italic = true },
    },
    disable = {
        borders = true,
        background = true,
        term_colors = false,
        eob_lines = false
    },
    lualine_style = 'stealth'
})

vim.cmd([[ colorscheme material-deep-ocean]] )
