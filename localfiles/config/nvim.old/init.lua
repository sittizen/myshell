--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 12
vim.opt.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Arrow keys with what I'm used to
vim.keymap.set('n', 'h', 'i')
vim.keymap.set('n', 'i', '<up>')
vim.keymap.set('n', 'j', '<left>')
vim.keymap.set('n', 'k', '<down>')
vim.keymap.set('n', 'l', '<right>')

vim.keymap.set('x', 'i', '<up>')
vim.keymap.set('x', 'j', '<left>')
vim.keymap.set('x', 'k', '<down>')
vim.keymap.set('x', 'l', '<right>')

vim.keymap.set('v', 'i', '<up>')
vim.keymap.set('v', 'j', '<left>')
vim.keymap.set('v', 'k', '<down>')
vim.keymap.set('v', 'l', '<right>')

-- Move lines with what I'm used to
vim.keymap.set("n", "<C-i>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-k>", ":m .+1<CR>==")
vim.keymap.set("v", "<C-k>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-i>", ":m '<-2<CR>gv=gv")

-- Uppercase word under cursor
vim.keymap.set('n', '<C-u>', "g~iw", { desc = 'Uppercase word under cursor' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({timeout = 300})
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
require("lazy").setup({
  spec = {
    { import = "plugins" }
  }
})


require("nightfox").setup({
  options = {
    dim_inactive = true
  }
})
vim.cmd("colorscheme nightfox")

require("mini.statusline").setup()

require("nvim-treesitter.configs").setup({
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
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
  },
})

local harpoon = require("harpoon")
harpoon:setup({})
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
    { desc = "Add to harpoon list" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.lsp.config['pyright'] = {
  -- cmd = {'script', '-q', '-c', '\'pyright-langserver --stdio\'', '/tmp/pyright.log'},
  cmd = {'pyright-langserver', '--stdio'},
  filetypes = { 'python' },
  root_markers = { '.git', 'pyproject.toml' },
}
vim.lsp.enable('pyright')
vim.lsp.set_log_level 'debug'
require('vim.lsp.log').set_format_func(vim.inspect)
--[[ Configure and start the Docker Pyright LSP client 
local bufnr = vim.api.nvim_get_current_buf()
local client_id = vim.lsp.start_client({
  name = "docker_pyright",
  cmd = vim.lsp.rpc.connect("127.0.0.1", 2087),
  root_dir = '/workspace/test',
  root_markers = { '.git', 'pyproject.toml' },
  filetypes = { 'python' }}
)

vim.lsp.enable('docker_pyright')
if client_id then
  vim.lsp.buf_attach_client(bufnr, client_id)
else
  vim.notify("Failed to attach docker_pyright LSP client", vim.log.levels.ERROR)
end
--]]

--[[
require("autoread")
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
     pattern = {"*.py", "*.yaml", "*.sh"},
     command = "AutoreadOn",
})
--]]

vim.g.copilot_filetypes = {
  ['*'] = false,
  ['python'] = false,
  ['lua'] = false,
}
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
