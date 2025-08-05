return {
	cmd = { "basedpyright-langserver", "--stdio" },
	-- cmd = vim.lsp.rpc.connect("127.0.0.1", 2087),
	filetypes = {
		"python",
	},
	root_markers = {
		".git",
		"pyproject.toml",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				typeCheckingMode = "strict",
				diagnosticMode = "workspace",
			},
		},
	},

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
