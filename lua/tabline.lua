local add = MiniDeps.add

vim.g.barbar_auto_setup = false
add('romgrk/barbar.nvim')

require('barbar').setup({
	tabpages = false,
	auto_hide = 1,
	icons = {
		button = '×',
		modified = { button = '•' },
		pinned = { button = '', filename = true },
		filetype = {
			enabled = false,
		},
	},
})
