if vim.g.vscode then
-- For running in VS code
else
	require("mercury.plugins-setup")
	require("mercury.core.options")
	require("mercury.core.keymaps")
	require("mercury.core.colorscheme")
	require("mercury.plugins.comment")
	require("mercury.plugins.nvim-tree")
	require("mercury.plugins.lualine")
	require("mercury.plugins.telescope")
	require("mercury.plugins.nvim-cmp")
	require("mercury.plugins.autopairs")
	require("mercury.plugins.lsp.mason")
	require("mercury.plugins.lsp.lspsaga")
	require("mercury.plugins.lsp.lspconfig")
	require("mercury.plugins.lsp.null-ls")
	require("mercury.plugins.treesitter")
	require("mercury.plugins.git-signs")
end
