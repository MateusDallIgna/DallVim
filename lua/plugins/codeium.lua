return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local codeium_active = true

    require("codeium").setup({
      enable = true,
      suggestion = {
        enabled = true,         -- Habilita sugestões automáticas (ghost text)
        auto_trigger = true,    -- Sugestões aparecem automaticamente
        debounce = 75,          -- Ajuste o tempo de debounce se necessário
        keymap = {
          accept  = "<Tab>",     -- <Tab> para aceitar a sugestão
          next    = "<C-n>",     -- Próxima sugestão
          prev    = "<C-p>",     -- Sugestão anterior
          dismiss = "<C-e>",     -- Descartar sugestão
        },
      },
      virtual_text = { enabled = true },  -- Habilita o ghost text
    })

    -- Função para alternar (toggle) o Codeium
    function _G.toggle_codeium()
      codeium_active = not codeium_active
      require("codeium").setup({
        enable = codeium_active,
        suggestion = {
          enabled = codeium_active,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept  = "<Tab>",
            next    = "<C-n>",
            prev    = "<C-p>",
            dismiss = "<C-e>",
          },
        },
        virtual_text = { enabled = codeium_active },
      })
      print("Codeium " .. (codeium_active and "ativado" or "desativado"))
    end

    -- Mapeamento para <leader>c para alternar o Codeium
    vim.keymap.set("n", "<leader>c", "<cmd>lua toggle_codeium()<CR>", { noremap = true, silent = true })
  end,
}
