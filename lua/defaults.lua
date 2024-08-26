local o = vim.o
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd

o.number = true
o.cursorline = true
o.colorcolumn = '80'
o.scrolloff = 5
o.laststatus = 3
o.sidescrolloff = 5

-- Always leave room for gitsigns
o.signcolumn = "yes"

-- Disable mode text below statusline
o.showmode = false

-- Disable default netrw plugin
g.loaded_netrwPlugin = 1
g.loaded_netrw = 1

-- Disable default fzf plugin
g.loaded_fzf = 1

-- Enable persistent undo
o.undofile = true

-- Traverse lines with arrow keys
o.whichwrap = 'b,s,<,>,[,]'

-- Default indentation settings for using hard tabs for indent
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = false

-- Use case insensitive search, except when using capital letters
o.ignorecase = true
o.smartcase = true

-- Display hidden characters
-- o.list = true

-- Time out on keycodes, but not mappings
o.timeout = false

-- Set word wrapping on
o.linebreak = true

-- Automatically write when :make or similar are called
o.autowrite = true

-- Set the default register to * for a shared OS clipboard
o.clipboard = 'unnamed'

-- Enable nvim diffing
o.diffopt = 'filler,internal,algorithm:histogram,indent-heuristic'

-- Faster response time
o.updatetime = 100

-- Show a dialog to confirm changes instead of failure
o.confirm = true

-- Enable use of the mouse for all modes
o.mouse = 'a'
-- vim.cmd([[
-- 	aunmenu *
-- 	vnoremenu PopUp.Cut                     "+x
-- 	vnoremenu PopUp.Copy                    "+y
-- 	anoremenu PopUp.Paste                   "+gP
-- 	vnoremenu PopUp.Paste                   "+P
-- 	vnoremenu PopUp.Delete                  "_x
-- 	nnoremenu PopUp.Select\ All             ggVG
-- 	vnoremenu PopUp.Select\ All             gg0oG$
-- 	inoremenu PopUp.Select\ All             <C-Home><C-O>VG
-- ]])

-- Open all folds by default
o.foldlevelstart = 99

-- Multiline indenting
o.breakindent = true

-- Project local configs in .nvimrc or .exrc
o.exrc = true

-- Help text fullscreen
autocmd('FileType', {
        pattern = {"help"},
        command = "wincmd o",
    }
)

-- Restore cursor position
autocmd('BufReadPost', {
	pattern = '*',
	callback = function()
		vim.fn.setpos('.', vim.fn.getpos("'\""))
	end,
})

-- Highlight on yank
autocmd('TextYankPost', {
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 350 }
	end,
})

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.nvim', mini_path
	}
	local checkout_cmd = {
		'git', '-C', mini_path, 'checkout', '19e1584124cda35388d4fdb911eab7124014e541'
	}
	vim.fn.system(clone_cmd)
	vim.fn.system(checkout_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require('mini.deps').setup({ path = { package = path_package } })
