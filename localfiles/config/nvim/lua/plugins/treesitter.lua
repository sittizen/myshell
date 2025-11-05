return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"html",
				"python",
				"bash",
				"fish",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {

				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = { query = "@function.outer", desc = "Select all the function" },
						["if"] = { query = "@function.inner", desc = "Select inside the function" },
						["ac"] = { query = "@class.outer", desc = "Select all the class" },
						["ic"] = { query = "@class.inner", desc = "Select inside the class" },
						["is"] = { query = "@local.scope", desc = "Select inside the scope" },
						["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
						["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
						["al"] = { query = "@loop.outer", desc = "around a loop" },
						["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
						["aa"] = { query = "@parameter.outer", desc = "around parameter" },
						["ia"] = { query = "@parameter.inner", desc = "inside a parameter" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_previous_start = {
							["[f"] = { query = "@function.outer", desc = "Previous function" },
							["[c"] = { query = "@class.outer", desc = "Previous class" },
							["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
						},
						goto_next_start = {
							["]f"] = { query = "@function.outer", desc = "Next function" },
							["]c"] = { query = "@class.outer", desc = "Next class" },
							["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
						},
					},
				},
			},
		})
	end,
}
