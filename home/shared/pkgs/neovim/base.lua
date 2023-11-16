local g = vim.g
local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

cmd('autocmd!')
cmd('set modifiable')

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

g.loaded_netrwPlugin = 1
g.loaded_netrw = 1

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'zsh'
opt.backupskip = '/tmp/*'
opt.inccommand = 'split'
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true -- Auto indent
opt.si = true -- Smart indent
opt.wrap = false -- No wrap lines
opt.backspace = 'start,eol,indent'
opt.path:append  { '**' } -- Finding files - search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])


-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = 'set nopaste'
})

opt.formatoptions:append { 'r' } 

opt.clipboard = "unnamedplus"

