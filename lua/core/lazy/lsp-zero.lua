return {
	{
		"williamboman/mason-lspconfig.nvim",

		config = true,

		dependencies = {
			"williamboman/mason.nvim",
			config = true,
		},
	},

	{
		"VonHeikemen/lsp-zero.nvim", branch = "v3.x",

		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
		},

		config = function()
			local lsp_zero = require('lsp-zero')

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({buffer = bufnr})
			end)

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				},
			})

			local cmp = require('cmp')
			local luasnip = require('cmp')
			local cmp_action = require('lsp-zero').cmp_action()

			cmp.setup({
				sources = {
					{ name = 'luasnip' },
					{ name = 'nvim_lsp' },
					{ name = 'path' }
				},
				-- A mapping chinchin would probably like.
				-- reference: https://lsp-zero.netlify.app/v3.x/autocomplete.html
				mapping = cmp.mapping.preset.insert({
					['<CR>'] = cmp.mapping.confirm({select = false}),
					['<Tab>'] = cmp_action.tab_complete(),
					['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
				}),
			})
		end
	},
}
