require('dashboard').setup {
  theme = 'hyper',
  shortcut_type = 'letter',
  config = {
    project = {
      enable = false,
      limit = 8,
      icon = ' ',
      label = '',
      action = 'Telescope find_files'
    },
    week_header = {
      enable = false,
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
