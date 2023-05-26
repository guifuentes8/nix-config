require('lualine').setup({
    options = {
        theme = 'nightfox'
    }
})

require("dashboard").setup({})

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })