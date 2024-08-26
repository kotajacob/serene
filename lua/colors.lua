local add = MiniDeps.add

add('rose-pine/neovim')
require("rose-pine").setup({
	variant = "dawn",
	highlight_groups = {
		CursorLine = { bg = "surface" },

		TelescopeBorder = { fg = "overlay", bg = "overlay" },
		TelescopeNormal = { fg = "subtle", bg = "overlay" },
		TelescopeSelection = { fg = "text", bg = "highlight_med" },
		TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
		TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

		TelescopeTitle = { fg = "base", bg = "love" },
		TelescopePromptTitle = { fg = "base", bg = "pine" },
		TelescopePreviewTitle = { fg = "base", bg = "iris" },

		TelescopePromptNormal = { fg = "text", bg = "surface" },
		TelescopePromptBorder = { fg = "surface", bg = "surface" },
	},
	palette = {
		dawn = {
			_nc = "#f8f8f8",
			base = "#ffffff",
			surface = "#f8f8f8",
			overlay = "#eeeeee",
			muted = "#939393", -- #9893a5
			subtle = "#787878", -- #797593
			text = "#000000",
			love = "#bc1854", -- #b4637a
			gold = "#e4943a", -- #ea9d34
			rose = "#e36da8", -- #d7827e
			pine = "#286983", --
			foam = "#34859d", -- #56949f
			iris = "#9b70ff", -- #907aa9
			leaf = "#769836", -- #6d8f89
			highlight_low = "#e0e0e0",
			highlight_med = "#d2d2d2",
			highlight_high = "#c8c8c8",
			none = "NONE",
		},
	}
})
vim.cmd("colorscheme rose-pine")
