return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '|', ':Neotree buffers<CR>', desc = 'NeoTree buffers', silent = true },
  },
  opts = {
      window = {
        mappings = {
          ['|'] = 'close_window',
          ['h'] = 'show_file_details',
          ['i'] = 'move_cursor_up',
        },
      },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['h'] = 'show_file_details',
          ['i'] = 'move_cursor_up',
        }
      }
    }
  },
}
