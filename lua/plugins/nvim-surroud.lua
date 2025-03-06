return{
	'echasnovski/mini.surround',
	version = '*' ,
	config = function ()
		require ('mini.surround').setup({
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 500,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = 'sa', -- Add surrounding in Normal and Visual modes
				delete = 'sd', -- Delete surrounding
				find = 'sf', -- Find surrounding (to the right)
				find_left = 'sF', -- Find surrounding (to the left)
				highlight = 'sh', -- Highlight surrounding
				replace = 'sr', -- Replace surrounding
				update_n_lines = 'sn', -- Update `n_lines`

				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			},

			n_lines = 20,

			respect_selection_type = false,

			search_method = 'cover',

			silent = false,
		})
	end
}
