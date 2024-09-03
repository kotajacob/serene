local add = MiniDeps.add

add('karb94/neoscroll.nvim')
require('neoscroll').setup({
	mappings = { -- Keys to be mapped to their corresponding default scrolling animation
		'<C-u>', '<C-d>',
		'<C-b>', '<C-f>',
		'<C-y>', '<C-e>',
		'zt', 'zz', 'zb',
	},
	easing = 'quadratic', -- Default easing function
})
