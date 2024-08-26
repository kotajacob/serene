local add = MiniDeps.add

add('windwp/nvim-ts-autotag')
require('nvim-ts-autotag').setup({
	aliases = {
		["gohtmltmpl"] = "html",
	}
})
