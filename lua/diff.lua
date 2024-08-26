local add = MiniDeps.add

add('lewis6991/gitsigns.nvim')
require('gitsigns').setup({
	signs = {
		add          = { text = '┃' },
		change       = { text = '┃' },
		delete       = { text = '┃' },
		topdelete    = { text = '┃' },
		changedelete = { text = '┃' },
		untracked    = { text = '┃' },
	},
	signs_staged_enable = false,
	on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']g', function()
			if vim.wo.diff then
				vim.cmd.normal({ ']g', bang = true })
			else
				gitsigns.nav_hunk('next')
			end
		end)

		map('n', '[g', function()
			if vim.wo.diff then
				vim.cmd.normal({ '[g', bang = true })
			else
				gitsigns.nav_hunk('prev')
			end
		end)
	end,
})
