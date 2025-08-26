vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "Always autoreload python and shell files",
	pattern = { "*.py", "*.sh" },
	callback = function(ev)
		require("autoread")
		vim.cmd(":AutoreadOn")
	end,
})
