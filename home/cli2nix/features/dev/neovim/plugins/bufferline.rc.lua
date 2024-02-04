local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    indicator = {
    },
  },
})
