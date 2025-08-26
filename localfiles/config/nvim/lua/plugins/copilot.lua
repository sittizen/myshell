return {
	"github/copilot.vim",
	enabled = true,
	config = function()
		vim.g.copilot_filetypes = {
			["*"] = false,
			["python"] = true,
			["sh"] = true,
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
