local add = MiniDeps.add

add({
	source = 'neovim/nvim-lspconfig',
})
local nvim_lsp = require("lspconfig")

add('lukas-reineke/lsp-format.nvim')
local format = require("lsp-format")
format.setup({})

add('hrsh7th/cmp-nvim-lsp')
add('hrsh7th/cmp-buffer')
add('hrsh7th/cmp-path')
add('hrsh7th/cmp-cmdline')
add('hrsh7th/nvim-cmp')

-- Setup autocomplete
local cmp = require('cmp')
cmp.setup({
	preselect = cmp.PreselectMode.None,
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<ESC>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort()
			end
			fallback()
		end),
		['<CR>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if cmp.get_active_entry() then
					cmp.confirm()
				else
					fallback()
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior })
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior })
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	}),
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Setup LSP servers
-- We need to pass cmp's capabilities into each one to use autocomplete.
-- To enable automatic style formatting on save, pass in the on attach function.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
	format.on_attach(client, bufnr)
end
-- nvim_lsp.gopls.setup {
-- 	capabilities = capabilities
-- }
-- nvim_lsp.lua_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = 'LuaJIT',
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = {
-- 					'vim',
-- 					'MiniDeps',
-- 					'MiniDiff',
-- 					'MiniFiles',
-- 					'MiniTrailspace',
-- 					'MiniBracketed',
-- 				},
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })
