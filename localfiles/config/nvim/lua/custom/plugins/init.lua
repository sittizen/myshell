-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
{
  'nvimtools/none-ls.nvim',
  dependencies = {
  'nvimtools/none-ls-extras.nvim',
  'jayp0521/mason-null-ls.nvim',
  },
  config = function()
  require('mason-null-ls').setup {
    ensure_installed = {
      'prettier',
    },
    automatic_installation = true,
  }
  local null_ls = require 'null-ls'
  local sources = {
    null_ls.builtins.formatting.prettier.with { filetypes = { 'json', 'yaml', 'markdown' } },
  }
  
  end,
},
}
