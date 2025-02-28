return {
    { "rebelot/kanagawa.nvim" },
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        config = function()
			require("material").setup({
               contrast = {
                    sidebars = true, -- Aumenta o contraste da lateral
                    floating_windows = true, -- Melhora visibilidade em popups/flutuantes
                    line_numbers = true, -- Destaca números de linha
					lualine_style = "stealth",
					cursor_line = true,

                },
            })
			vim.wo.cursorline = true
			vim.cmd("colorscheme material-deep-ocean")
		end
    },
}
