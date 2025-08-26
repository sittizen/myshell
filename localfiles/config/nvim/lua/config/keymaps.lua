vim.keymap.set(
	"n",
	"<Esc>",
	"<cmd>nohlsearch<CR>",
	{ desc = "Clear highlights on search when pressing <Esc> in normal mode." }
)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Arrow keys with what I'm used to
vim.keymap.set("n", "h", "i")
vim.keymap.set("n", "i", "<up>")
vim.keymap.set("n", "j", "<left>")
vim.keymap.set("n", "k", "<down>")
vim.keymap.set("n", "l", "<right>")

vim.keymap.set("x", "i", "<up>")
vim.keymap.set("x", "j", "<left>")
vim.keymap.set("x", "k", "<down>")
vim.keymap.set("x", "l", "<right>")

vim.keymap.set("v", "i", "<up>")
vim.keymap.set("v", "j", "<left>")
vim.keymap.set("v", "k", "<down>")
vim.keymap.set("v", "l", "<right>")

-- Move lines the way I'm used to
vim.keymap.set("n", "<C-i>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-k>", ":m .+1<CR>==")
vim.keymap.set("v", "<C-k>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-i>", ":m '<-2<CR>gv=gv")

-- Uppercase word under cursor
vim.keymap.set("n", "<C-u>", "g~iw", { desc = "Uppercase word under cursor" })

-- LSP
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
