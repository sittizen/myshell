return {
	"kylechui/nvim-surround",
	version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				insert = false,
				insert_line = false,
				normal = "yr",
				normal_cur = false,
				normal_line = false,
				normal_cur_line = false,
				delete = "dr",
				change = false,
				change_line = false,
			},
		})
	end,
}
