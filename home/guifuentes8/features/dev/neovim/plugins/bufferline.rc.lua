local status, bufferline = pcall(require, "bufferline")
if (not status) then return end
local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    indicator = {
    },
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get {
    styles = { "italic", "bold" },
    custom = {
      all = {
        fill = { bg = '#45475B' },
      },
      mocha = {
        background = { fg = mocha.text },
      },
    },
  },
})
