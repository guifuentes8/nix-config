local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
}

-- keymaps
vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';s', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', ';h', function()
  builtin.search_history()
end)
vim.keymap.set('n', ';t', function()
  builtin.filetypes()
end)
vim.keymap.set('n', ';g', function()
  builtin.git_status()
end)
vim.keymap.set('n', ';gb', function()
  builtin.git_branches()
end)
