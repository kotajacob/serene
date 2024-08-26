local add = MiniDeps.add

-- Split and join long lines
add('Wansmer/treesj')
local splitjoin = require('treesj')
splitjoin.setup({
	use_default_keymaps = false,
	check_syntax_error = true,
	max_join_length = 120,

	---Cursor behavior:
	---hold - cursor follows the node/place on which it was called
	---start - cursor jumps to the first symbol of the node being formatted
	---end - cursor jumps to the last symbol of the node being formatted
	---@type 'hold'|'start'|'end'
	cursor_behavior = 'hold',
	notify = true,
	dot_repeat = true,
	on_error = nil,
})
