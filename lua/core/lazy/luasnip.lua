return {
	"L3MON4D3/LuaSnip",

	version = "v2.*",

	build = "make install_jsregexp",

	dependencies = {
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		require("luasnip.loaders.from_snipmate").lazy_load({paths = "./snippets"})
		ls = require("luasnip")
		vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
		vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})

		vim.keymap.set({"i", "s"}, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end,
		{
			silent = true
		})
	end
}