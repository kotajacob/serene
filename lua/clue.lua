local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- space key
		{ mode = 'n', keys = '<space>' },

		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },

		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },

		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },

		-- Window commands
		{ mode = 'n', keys = '<C-w>' },

		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},

	clues = {
		{ mode = 'n', keys = '<space>b',  desc = '+Buffers' },
		{ mode = 'n', keys = '<space>e',  desc = '+Edit' },
		{ mode = 'n', keys = '<space>f',  desc = '+Files' },
		{ mode = 'n', keys = '<space>g',  desc = '+Git' },
		{ mode = 'n', keys = '<space>l',  desc = '+LSP' },
		{ mode = 'n', keys = '<space>p',  desc = '+Projects' },
		{ mode = 'n', keys = '<space>h',  desc = '+Help' },
		{ mode = 'n', keys = '<space>q',  desc = '+Quit' },
		{ mode = 'n', keys = '<space>qa', desc = '+All' },
		{ mode = 'n', keys = '<space>s',  desc = '+Settings' },
		{ mode = 'n', keys = '<space>w',  desc = '+Windows' },
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},

	window = {
		delay = 0,
		config = {
			width = '60',
		}
	}
})
