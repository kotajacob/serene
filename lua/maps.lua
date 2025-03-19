local map = vim.api.nvim_set_keymap

-- General
vim.keymap.set("n", "<c-s>", ":w<CR>", {
	desc = "Save current buffer",
	noremap = true,
})
vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>a", {
	desc = "Save current buffer",
	noremap = true,
})

vim.keymap.set('n', '<c-q>', ':q<CR>', {
	desc = "Quit current window",
	noremap = true,
})
vim.keymap.set('i', '<c-q>', '<Esc>:q<CR>', {
	desc = "Quit current window",
	noremap = true,
})

vim.keymap.set('n', '<bs>', "<C-o>", {
	desc = "Go back",
	noremap = true,
	silent = true,
})

vim.keymap.set('n', "=", function()
	require("neoscroll").ctrl_u({
		duration = 250,
	})
end, {
	desc = "Scroll down",
	noremap = true,
})

vim.keymap.set('n', "-", function()
	require("neoscroll").ctrl_d({
		duration = 250,
	})
end, {
	desc = "Scroll down",
	noremap = true,
})

vim.keymap.set('n', "_", require("oil").open, {
	desc = "Edit parent directory",
	noremap = true,
})

-- Repeat macros with , because @@ is too long
vim.keymap.set('n', ',', '@@', {
	desc = "Repeat last macro",
	noremap = true,
})

-- Tab completion (instead of control-n)
vim.keymap.set(
	'i',
	'<Tab>',
	[[pumvisible() ? "\<C-n>" : "\<Tab>"]],
	{ expr = true }
)
vim.keymap.set(
	'i',
	'<S-Tab>',
	[[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
	{ expr = true }
)

-- Move between splits without C-W prefix
vim.keymap.set('n', '<C-j>', '<C-W><C-j>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W><C-k>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W><C-l>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-h>', '<C-W><C-h>', { silent = true, noremap = true })

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- Remap j and k to move by display with wrapped lines, but also move the
-- correct number of lines when preceded with a count. Counts greater than 5
-- will be added to the movement history to make Control-O and Control-I work.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quit --
vim.keymap.set('n', '<space>qs', ':wq<cr>', {
	desc = "Save and quit",
	noremap = true,
	silent = true,
})

vim.keymap.set('n', '<space>qq', ':q<cr>', {
	desc = "Save and quit",
	noremap = true,
	silent = true,
})

vim.keymap.set('n', '<space>qf', ':q!<cr>', {
	desc = "Force quit",
	noremap = true,
	silent = true,
})

vim.keymap.set('n', '<space>qas', ':wqa<cr>', {
	desc = "Save all and quit",
	noremap = true,
	silent = true,
})

vim.keymap.set('n', '<space>qaf', ':qa!<cr>', {
	desc = "Force quit all without saving",
	noremap = true,
	silent = true,
})

-- Setting toggles --
map("n", "<space>se", "", {
	desc = "Toggle error visibility",
	noremap = true,
	silent = true,
	callback = function()
		vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	end,
})

vim.keymap.set('n', '<space>sh', ':set list!<cr>', {
	desc = "Toggle viewing hidden characters",
	noremap = true,
	silent = true,
})

vim.keymap.set('n', '<space>sc', ':set spell!<cr>', {
	desc = "Toggle spell checking",
	noremap = true,
})

vim.keymap.set('n', '<space>sw', ':set wrap!<cr>', {
	desc = "Toggle line wrapping",
	noremap = true,
})

-- Edit --
vim.keymap.set("n", "<space>ew", MiniTrailspace.trim, {
	desc = "Trim trailing whitespace",
	noremap = true,
})

vim.keymap.set("n", "<space>eu", require("telescope").extensions.undo.undo, {
	desc = "Undo tree",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<space>es", require('treesj').split, {
	desc = "Split a long line",
	noremap = true,
})
vim.keymap.set("n", "S", require('treesj').split, {
	desc = "Split a long line",
	noremap = true,
})


vim.keymap.set("n", "<space>ej", require('treesj').join, {
	desc = "Join several lines into one",
	noremap = true,
})
vim.keymap.set("n", "J", require('treesj').join, {
	desc = "Join several lines into one",
	noremap = true,
})

vim.keymap.set("n", "<space>.", require("telescope.builtin").resume, {
	desc = "Last search",
	noremap = true,
})

-- Files --
vim.keymap.set("n", "<space><space>", require("telescope.builtin").find_files, {
	desc = "Find",
	noremap = true,
})
vim.keymap.set("n", "<space>ff", require("telescope.builtin").find_files, {
	desc = "Find files",
	noremap = true,
})

vim.keymap.set('n', "<space>fb", require("oil").open, {
	desc = "Browse files",
	noremap = true,
})

vim.keymap.set("n", "<space>fn", function() MiniBracketed.file("forward") end, {
	desc = "Next file",
	noremap = true,
})

vim.keymap.set("n", "<space>fp", function() MiniBracketed.file("backward") end, {
	desc = "Previous file",
	noremap = true,
})

map("n", "<space>fg", "", {
	desc = "Grep files",
	noremap = true,
	callback = function()
		require("telescope.builtin").live_grep()
	end,
})

-- Windows --
map("n", "<space>ww", ":vsplit<cr>", {
	desc = "Split vertical",
	noremap = true,
	silent = true,
})

map("n", "<space>ws", ":split<cr>", {
	desc = "Split horizontal",
	noremap = true,
	silent = true,
})

map("n", "<space>wq", ":close<cr>", {
	desc = "Quit window",
	noremap = true,
	silent = true,
})

map("n", "<space>wo", ":only<cr>", {
	desc = "Quit other windows",
	noremap = true,
	silent = true,
})

map("n", "<space>wr", "<c-w>r", {
	desc = "Rotate windows",
	noremap = true,
	silent = true,
})

map("n", "<space>wh", "<c-w>h", {
	desc = "Left focus",
	noremap = true,
	silent = true,
})

map("n", "<space>wl", "<c-w>l", {
	desc = "Right focus",
	noremap = true,
	silent = true,
})

map("n", "<space>wk", "<c-w>k", {
	desc = "Up focus",
	noremap = true,
	silent = true,
})

map("n", "<space>wj", "<c-w>j", {
	desc = "Down focus",
	noremap = true,
	silent = true,
})

-- Buffers --
map("n", "<space>b", "", {
	desc = "Buffers",
	noremap = true,
	callback = function()
		require("telescope.builtin").buffers({
			show_all_buffers = false,
			ignore_current_buffer = true,
			sort_mru = true,
		})
	end,
})

-- Git --
map("n", "<space>gg", "", {
	desc = "Interface",
	noremap = true,
	silent = true,
	callback = function()
		require("neogit").open()
	end,
})

map("n", "<space>gd", ":DiffviewOpen origin/HEAD...HEAD --imply-local=true<cr>", {
	desc = "Diff as PR",
	noremap = true,
	silent = true,
})

map("n", "<space>gf", "", {
	desc = "Find git files",
	callback = function()
		require("telescope.builtin").git_files()
	end,
	noremap = true,
})

map("n", "<space>gb", "", {
	desc = "Blame",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").blame()
	end,
})

map("n", "<space>gp", "", {
	desc = "Preview hunk",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").preview_hunk()
	end,
})

map("n", "<space>gs", "", {
	desc = "Stage hunk",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").stage_hunk()
	end,
})

map("n", "<space>gr", "", {
	desc = "Reset hunk",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").reset_hunk()
	end,
})

map("v", "<leader>hs", "", {
	desc = "Stage hunk",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").stage_hunk(vim.fn.line('.'), vim.fn.line('v'))
	end,
})

map("v", "<leader>hr", "", {
	desc = "Reset hunk",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").reset_hunk(vim.fn.line('.'), vim.fn.line('v'))
	end,
})

map("n", "<space>gu", "", {
	desc = "Undo stage hunk",
	noremap = true,
	silent = true,
	callback = function()
		require("gitsigns").undo_stage_hunk()
	end,
})

-- LSP --
map("n", "<space>ll", "", {
	desc     = "Documentation",
	noremap  = true,
	silent   = true,
	callback = function()
		vim.lsp.buf.hover()
	end,
})
map("n", "K", "", {
	desc = "Documentation",
	noremap = true,
	silent = true,
	callback = function()
		vim.lsp.buf.hover()
	end,
})

map("n", "<space>la", "", {
	desc = "All Errors",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").diagnostics()
	end,
})

map("n", "<space>le", "", {
	desc = "Error Details",
	noremap = true,
	silent = true,
	callback = function()
		vim.diagnostic.open_float()
	end,
})

map("n", "<space>ln", "", {
	desc = "Rename",
	noremap = true,
	silent = true,
	callback = function()
		vim.lsp.buf.rename()
	end,
})

map("n", "<space>lf", "", {
	desc = "Format",
	noremap = true,
	silent = true,
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})

map("n", "<space>lr", "", {
	desc = "References",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").lsp_references()
	end,
})

map("n", "<space>ld", "", {
	desc = "Definition",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").lsp_definitions()
	end,
})

map("n", "<cr>", "", {
	desc = "Definition",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").lsp_definitions()
	end,
})

map("n", "<space>lt", "", {
	desc = "Type Definition",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").lsp_type_definitions()
	end,
})

map("n", "<space>li", "", {
	desc = "Implementations",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").lsp_implementations()
	end,
})

map("n", "<space>ls", "", {
	desc = "Symbols",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").lsp_document_symbols()
	end,
})

-- Help --
map("n", "<space>hf", "", {
	desc = "Find help",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").help_tags()
	end,
})

map("n", "<space>hk", "", {
	desc = "Keymapping help",
	noremap = true,
	silent = true,
	callback = function()
		require("telescope.builtin").keymaps()
	end,
})
