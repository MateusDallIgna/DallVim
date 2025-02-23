return {
	{"neovim/nvim-lspconfig"},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {"mason.nvim"},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			local installed_lsps = mason_lspconfig.get_installed_servers()

			local default_lsps = { "lua_ls", "clangd", "pyright"}

			local ensure_installed = vim.tbl_deep_extend("force", installed_lsps, default_lsps)

			mason_lspconfig.setup({
				ensure_installed = ensure_installed,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
}
