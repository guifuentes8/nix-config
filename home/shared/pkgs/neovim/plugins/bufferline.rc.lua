local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  highlights = {
    fill = {
      bg = "#24283b",
    },
    buffer_selected = {
      fg = '#2ac3de',
      underline = true,
      sp = "#2ac3de"

    },
    background = {
      fg = "#7aa2f7",
    },
    separator = {
      fg = '#73daca',
    },
    separator_selected = {
      fg = '#24283b',
      bg = '#2ac3de',
    },
  },
  options = {
    mode = "tabs",
    separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    indicator = {
      style = 'underline',
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      }
    },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
