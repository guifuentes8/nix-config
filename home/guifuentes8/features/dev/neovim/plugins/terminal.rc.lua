local terminal = require("nvterm.terminal")
require("nvterm").setup({
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.3,
        col = 0.25,
        width = 0.5,
        height = 0.4,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = true,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
})

vim.keymap.set({ 'n', 't' }, '<A-h>', function()
  terminal.toggle('horizontal')
end)
vim.keymap.set({ 'n', 't' }, '<A-v>', function()
  terminal.toggle('vertical')
end)
vim.keymap.set({ 'n', 't' }, '<A-f>', function()
  terminal.toggle('float')
end)

vim.keymap.set({ 'n', 't' }, 'th', function()
  terminal.new('horizontal')
end)
vim.keymap.set({ 'n', 't' }, 'tv', function()
  terminal.new('vertical')
end)
