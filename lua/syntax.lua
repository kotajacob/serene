local add = MiniDeps.add

-- Dramatically improved syntax highlighting with treesitter
add({
	source = 'nvim-treesitter/nvim-treesitter',
	hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

add('nvim-treesitter/nvim-treesitter-textobjects')

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"angular",
		"awk",
		"bash",
		"c",
		"c_sharp",
		"cmake",
		"cpp",
		"css",
		"dockerfile",
		"gdscript",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"glsl",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"hare",
		"html",
		"java",
		"javascript",
		"json",
		"julia",
		"kotlin",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"perl",
		"php",
		"python",
		"query",
		"ruby",
		"rust",
		"scss",
		"sql",
		"toml",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
		"zig",
	},
	auto_install = false,
	highlight = {
		enable = true,
		disable = function(lang, buf)
			if lang == "markdown" then
				return true
			end
			local max_filesize = 50 * 1024 -- 50 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "vn",
			node_incremental = ".",
			node_decremental = ",",
			scope_incremental = false,
		},
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]]"] = "@function.outer",
			},
			goto_next_end = {
				["]["] = "@function.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
			},
			goto_next = {
				["]l"] = "@conditional.outer",
			},
			goto_previous = {
				["[l"] = "@conditional.outer",
			}
		},
	},
})
