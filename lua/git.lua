local add = MiniDeps.add

add('sindrets/diffview.nvim')
require("diffview").setup({
	use_icons = false,
})

add('NeogitOrg/neogit')
require('neogit').setup()
