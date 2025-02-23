return{
	"nvim-treesitter/nvim-treesitter",
	dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},

	config = function()
		require'nvim-treesitter.configs'.setup ({
			-- A list of parser names
			ensure_installed = { 
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query", 
				"markdown", 
				"markdown_inline",
				"cpp",
				"python",
				"java",
				"javascript",
				"css",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"html",
				"typescript"
			},
			auto_install = true,

			highlight = {
				enable = true,
			},
			-- Config for treesitter-textobjects
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

						["ap"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
						["ip"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

						["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

						["aF"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["iF"] = { query = "@call.inner", desc = "Select inner part of a function call" },

						["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
						["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

						["aC"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["iC"] = { query = "@class.inner", desc = "Select inner part of a class" },
					},

					selection_modes = {
						['@parameter.outer'] = 'v', -- charwise
						['@function.outer'] = 'v', -- charwise
						['@class.outer'] = '<c-v>', -- blockwise
					},
					include_surrounding_whitespace = true,
				},
			},	
		})	
	end,
}
