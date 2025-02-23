return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true, -- Ativa o lazy-loading
  cmd = "Neotree", -- O plugin também pode ser carregado via comando
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "<leader>E", "<cmd>Neotree toggle dir=" .. os.getenv("HOME") .. "<CR>", desc = "Neo-tree Home" },
    { "<leader>be", "<cmd>Neotree buffers<CR>", desc = "Neo-tree Buffers" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw = true,
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { "node_modules", ".git", "build" },
          never_show = { ".DS_Store", "thumbs.db" },
        },
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
      git_status = {
        enabled = false, -- Desabilita integração com Git para melhorar a performance
      },
      window = {
        mappings = {
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["<BS>"] = "navigate_up",
          ["h"] = "navigate_up",
          ["l"] = "open",
        },
      },
    })
  end,
}
