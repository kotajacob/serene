local add = MiniDeps.add

-- Better directory browser
add('stevearc/oil.nvim')
local oil = require("oil")
oil.setup({
	skip_confirm_for_simple_edits = true,
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
		["<C-w>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["<C-r>"] = "actions.refresh",
		["_"] = "actions.parent",
		["-"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	}
})
