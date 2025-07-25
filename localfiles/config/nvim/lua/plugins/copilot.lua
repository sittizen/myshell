return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_filetypes = {
			["*"] = false,
			["python"] = true,
			["lua"] = false,
		}
		vim.g.copilot_no_tab_map = true
		vim.b.copilot_enabled = false
		vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}
