local add = MiniDeps.add

local function make_fzf_native(params)
	vim.cmd("lcd " .. params.path)
	vim.cmd("!make -s")
	vim.cmd("lcd -")
end
add({
	source = 'nvim-telescope/telescope-fzf-native.nvim',
	hooks = {
		post_install = make_fzf_native,
		post_checkout = make_fzf_native,
	},
})

add('debugloop/telescope-undo.nvim')

add('nvim-telescope/telescope.nvim')
require('telescope').setup {
	defaults = {
		path_display = { 'truncate' },
		layout_strategy = "vertical",
		layout_config = {
			prompt_position = "bottom",
			preview_cutoff = 1, -- Show preview (unless previewer = false)

			width = function(_, max_columns, _)
				return math.min(max_columns, 160)
			end,
		},
		border = true,
	},
	pickers = {
		spell_suggest = {
			theme = "cursor",
		},
		buffers = {
			mappings = {
				i = {
					["<Del>"] = require('telescope.actions').delete_buffer,
				},
			},
		}
	},
	extensions = {
		undo = {
			use_delta = false,
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").restore,
					["<S-cr>"] = false,
					["<C-cr>"] = false,
					-- alternative defaults, for users whose terminals do questionable things with modified <cr>
					["<C-y>"] = false,
					["<C-r>"] = false,
				},
				n = {
					["y"] = require("telescope-undo.actions").yank_additions,
					["Y"] = require("telescope-undo.actions").yank_deletions,
					["u"] = require("telescope-undo.actions").restore,
					["<cr>"] = require("telescope-undo.actions").restore,
				},
			},
		},
	},
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("undo")
