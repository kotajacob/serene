local add = MiniDeps.add

-- Disable hidden characters
vim.o.list = false

add('crispgm/nvim-go')
require('go').setup({
	auto_lint = false,
})

-- Y to copy to clipboard
vim.keymap.set("n", "Y", '"+y', {
	desc = "Copy to clipboard",
	noremap = true,
})

-- Setting it to html isn't ideal, but it allows us to use
-- https://github.com/windwp/nvim-ts-autotag
--
-- I spent several hours (2024/08/30) trying to get it to work with the gotmpl
-- treesitter filetype, but couldn't figure it out.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.tmpl",
	callback = function() vim.bo.filetype = "html" end,
})

add('folke/lazydev.nvim') -- lua dev plugin

add('https://git.sr.ht/~jcc/vim-sway-nav')

-- I spent many hours (2024/08/30) trying out different alternatives, this this
-- is still the best way to traverse/create markdown wiki links. Here's some
-- plugins I've tried:
--
-- markdown-oxide: an LSP for markdown wikis
-- Goto definition is used to enter a markdown link AND it detects wiki links
-- by default. It also allows you to see backlinks using "show references". The
-- big issue I had was it doesn't have a clean way to "create" links. I want to
-- press enter to create a link if missing, including adding the syntax around
-- the current work under my cursor, or follow the link if it exists. This
-- would've required another plugin.
--
-- obsidian.nvim and obs.nvim
-- These both might work eventually, but they want you to have an actual
-- obsidian vault setup and felt probably more janky than wiki.vim.
--
-- follow-md-links.nvim
-- This is a really small plugin that makes markdown links work. It uses
-- treesitter on the backend which is great, but also means it wont work
-- currently. The markdown treesitter parser is a mess. It has wiki link
-- support, but as a compile time option. I spent a few hours trying to first
-- compile it, which uses node for some reason, then while trying to get
-- treesitter to use the compiled parser I gave up. Link creation wouldn't work
-- anyway.
--
-- Ultimately, I'll eventually need to just write my own plugin for this.
vim.g.wiki_root = '~/docs/memex'
vim.g.wiki_mappings_use_defaults = 'none'
vim.g.wiki_link_creation = { md = { link_type = 'wiki', url_extension = '' } }
add('lervag/wiki.vim')

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.md",
	callback = function()
		vim.keymap.set('n', '<bs>', '<plug>(wiki-link-return)', {
			buffer = true,
		})
		vim.keymap.set('n', '<cr>', '<plug>(wiki-link-follow)', {
			buffer = true,
		})
		vim.keymap.set('x', '<cr>', '<plug>(wiki-link-transform-visual)', {
			buffer = true,
		})
		vim.keymap.set('n', '<tab>', '<plug>(wiki-link-next)', {
			buffer = true,
		})
		vim.keymap.set('n', '<s-tab>', '<plug>(wiki-link-prev)', {
			buffer = true,
		})
		vim.keymap.set('n', '<space>wb', '<plug>(wiki-graph-find-backlinks)', {
			desc = "Wiki backlinks",
			buffer = true,
		})
		vim.keymap.set('n', '<space>wr', '<plug>(wiki-page-rename)', {
			desc = "Wiki rename page",
			buffer = true,
		})
	end,
})

add('mhartington/formatter.nvim')
require("formatter").setup {
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		json = {
			require("formatter.filetypes.json").prettier
		},
		css = {
			require("formatter.filetypes.css").prettier
		},
		html = {
			require("formatter.filetypes.html").prettier
		},
		gohtmltmpl = {
			require("formatter.filetypes.html").prettier
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier
		},
		python = {
			require("formatter.filetypes.python").black,
		}
	},
}
