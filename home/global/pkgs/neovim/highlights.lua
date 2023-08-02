local g = vim.g
local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'

cmd([[ colorscheme tokyonight-storm]] )