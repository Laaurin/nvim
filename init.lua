vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')

vim.pack.add({
	{src = "https://github.com/vague2k/vague.nvim"},
	{src = "https://github.com/stevearc/oil.nvim"},
	{src = "https://github.com/echasnovski/mini.pick"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

require 'mini.pick'.setup()
require 'oil'.setup()

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')



vim.lsp.enable({"lua_ls"})
