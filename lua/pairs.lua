local add = MiniDeps.add

add('windwp/nvim-autopairs')
require('nvim-autopairs').setup({
	enable_check_bracket_line = false
})
