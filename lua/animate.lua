local add = MiniDeps.add

add('karb94/neoscroll.nvim')
require('neoscroll').setup({
	easing = 'quadratic', -- Default easing function
})
