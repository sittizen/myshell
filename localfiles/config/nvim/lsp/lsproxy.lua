return {
	cmd = { "lsproxy", "--stdio" },
	cmd_env = { RUST_LOG = "none,lsproxy=debug" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"requirements.txt",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
	-- config = function()
	--	vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
	-- end,
}
