
return {
cmd = {
	"pyright-langserver", "--stdio"
},
filetypes = {
	"python",
},
root_markers = {
	".git",
	"pyproject.toml"
},
settings = {
python = {
analysis = {
	autoSearchPaths = true,
	typeCheckingMode = "strict",
	diagnosticMode = "workspace",
}
}
 },

single_file_support = true,
log_level = vim.lsp.protocol.MessageType.Warning,
}
