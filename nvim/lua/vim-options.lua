vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
