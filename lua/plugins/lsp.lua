return {
  {"neovim/nvim-lspconfig"},

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"mason.nvim"},
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig") -- IMPORTANT: Require lspconfig here

      local installed_lsps = mason_lspconfig.get_installed_servers()

      local default_lsps = { "lua_ls", "clangd"}

      -- Note: vim.tbl_deep_extend("force", ...) is for tables with nested tables.
      -- For simple lists like this, you might just want to combine and deduplicate.
      -- Mason-lspconfig's ensure_installed handles duplicates internally.
      local ensure_installed = vim.tbl_deep_extend("force", installed_lsps, default_lsps)
      -- A simpler way for a list:
      -- local ensure_installed = {}
      -- for _, v in ipairs(installed_lsps) do table.insert(ensure_installed, v) end
      -- for _, v in ipairs(default_lsps) do table.insert(ensure_installed, v) end


      mason_lspconfig.setup({
        ensure_installed = ensure_installed,
        -- THIS IS WHERE 'handlers' GOES NOW, REPLACING setup_handlers()
        handlers = {
          -- This function will be called for each LSP server that Mason manages
          -- It tells lspconfig how to set up that specific server.
          function(server_name)
            lspconfig[server_name].setup({})
          end,

          -- You can also add custom handlers for specific servers if needed
          -- Example: if you wanted specific settings for 'lua_ls'
          -- ["lua_ls"] = function()
          --   lspconfig.lua_ls.setup({
          --     -- specific lua_ls settings here
          --   })
          -- end,
        },
      })

      -- You might also want to explicitly set up individual LSP servers
      -- if you have specific configurations for them that go beyond the default handler.
      -- For example, for lua_ls:
      -- lspconfig.lua_ls.setup({
      --   -- Add your specific lua_ls settings here
      --   settings = {
      --     Lua = {
      --       workspace = {
      --         library = vim.api.nvim_get_runtime_file("", true),
      --       },
      --       telemetry = { enable = false },
      --     },
      --   },
      -- })

      -- lspconfig.clangd.setup({
      --   -- Add your specific clangd settings here
      -- })

    end,
  },
}
