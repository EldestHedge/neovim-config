return {
	{
		"folke/noice.nvim",

		event = "VeryLazy",

		config = function()
			require("noice").setup({
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 50,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 50,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
			})
		end
	},

	{
		"rcarriga/nvim-notify",

		config = function()
			require("notify").setup({
				render = "wrapped-compact",
				stages = "static",
				timeout = 1125,
			})
		end,

		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	}
}
