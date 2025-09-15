return {
	"github/copilot.vim",
	enabled = true,
	config = function()
		vim.b.copilot_enabled = true
		vim.g.copilot_filetypes = {
			["*"] = false,
			["python"] = true,
			["sh"] = true,
			["bash"] = true,
			["lua"] = false,
		}
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}
