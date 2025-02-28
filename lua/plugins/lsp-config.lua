return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
      
      -- Ensure tools are installed
      local mason_registry = require("mason-registry")
      local tools = {
        "stylua",      -- Lua formatter
        "prettier",    -- JavaScript/TypeScript formatter
        "eslint_d",    -- JavaScript/TypeScript linter
        "codespell",   -- Spell checker
      }
      
      -- Install missing tools
      for _, tool in ipairs(tools) do
        if not mason_registry.is_installed(tool) then
          vim.cmd("MasonInstall " .. tool)
        end
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "ts_ls",   -- TypeScript/JavaScript (note: it's "tsserver", not "ts_ls")
        "lua_ls",     -- Lua
        "jsonls",     -- JSON
        "graphql",    -- GraphQL
        "eslint",     -- ESLint
        "html",       -- HTML
        "cssls",      -- CSS
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({  -- Fixed: "tsserver" not "ts_ls"
        capabilities = capabilities
      })
      lspconfig.jsonls.setup({})
      lspconfig.graphql.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end,
  },
}
