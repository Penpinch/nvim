vim.g.mapleader=" "
local lazypath=vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.scrolloff=8
vim.opt.cursorline=true
vim.opt.breakindent=true
vim.opt.autoindent=true
vim.opt.smartindent=true
vim.opt.cindent=true
vim.opt.expandtab=true
vim.opt.shiftwidth=4
vim.opt.tabstop=4
require("lazy").setup("plugins")
