require('dashboard').setup {
  theme = 'hyper',
  shortcut_type = 'letter',
  config = {
    week_header = {
      enable = true,
    },
    packages = { enable = false },
    shortcut = {
      {
        icon = '󰈞 ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Files',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = '󱋡 ',
        icon_hl = '@variable',
        desc = 'Old Files',
        group = 'Label',
        action = 'Telescope oldfiles',
        key = 'o',
      },
      {
        icon = '󰈙 ',
        icon_hl = '@variable',
        desc = 'Search Text',
        group = 'Label',
        action = 'Telescope live_grep',
        key = 's',
      },

    },
  },
}
