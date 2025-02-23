return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup {
			options = {
				theme = 'material',
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = { 			
				lualine_a = {'mode'},
				lualine_b = {'filename'},
				lualine_c = {'fileformat'},
			}
		}
	end
}
