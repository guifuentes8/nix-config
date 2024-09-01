local status, koalight = pcall(require, "koalight")
if (not status) then return end

vim.cmd.colorscheme 'koalight'
