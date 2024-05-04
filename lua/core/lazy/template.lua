return {
	"glepnir/template.nvim",
	cmd = {'Template', 'TemProject'},
	config = function()
	require('template').setup({
		-- config here >:3
		temp_dir = '~/Documents/templates/'
	})
end}
