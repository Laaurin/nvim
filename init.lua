vim.g.mapleader = " "

local opt = vim.o
opt.number = true
opt.relativenumber = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.tabstop = 2
opt.shiftwidth = 4
opt.scrolloff = 3
opt.winborder = 'rounded'
opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
})

local servers = {
	"lua_ls",
	"ts_ls",
	"pyright",
}

for _, server in ipairs(servers) do
	vim.lsp.enable({ server })
end

require 'mini.pick'.setup()
require 'oil'.setup()
require 'mason'.setup()
require 'vague'.setup({ transparent = true })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.keymap.set('n', '<leader>o', ':update<CR> :source %<CR>')

vim.keymap.set('v', '<leader>"', 'c""<esc>P')
vim.keymap.set('v', "<leader>'", "c''<esc>P")

vim.keymap.set('n', '<leader>a', ':split | terminal <CR>')

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
			}
		}
	}
})


vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
