
local M = {}
local vim = vim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

M.setup = function()
    -- Keybindings gerais
    map("n", "<leader>s", "<cmd>w<cr>", { desc = "Save file" })
    map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Neovim" })
	-- Window Navigation
    map("n", "<C-h>", "<C-w>h", opts)
    map("n", "<C-j>", "<C-w>j", opts)
    map("n", "<C-k>", "<C-w>k", opts)
    map("n", "<C-l>", "<C-w>l", opts)
	-- Normal mode
	--Open Mason
	 map("n","<leader>m","<cmd>Mason<cr>")
	 --Open Lazy
	 map("n","<leader>l","<cmd>Lazy<cr>")
	-- Resize with arrows
	map("n", "<C-Up>", ":resize -2<CR>", opts)
	map("n", "<C-Down>", ":resize +2<CR>", opts)
	map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
	map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

	-- Navigate buffers
	map("n", "<S-l>", ":bnext<CR>", opts)
	map("n", "<S-h>", ":bprevious<CR>", opts)

	-- Move text up and down
	map("n", "<A-j>", ":m .+1<CR>==", opts)
	map("n", "<A-k>", ":m .-2<CR>==", opts)

	-- Insert --
	-- Press jk fast to exit insert mode 
	map("i", "jk", "<ESC>", opts)
	map("i", "kj", "<ESC>", opts)

	-- Visual --
	-- Stay in indent mode
	map("v", "<", "<gv^", opts)
	map("v", ">", ">gv^", opts)

	-- Move text up and down
	map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
	map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
	map("v", "p", '"_dP', opts)
    -- LSP Keybindings
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

return M
