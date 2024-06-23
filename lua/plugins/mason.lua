-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      format_on_save = false,
      automatic_installation = true,
      ensure_installed = {
        "angularls",
        "ansiblels",
        "arduino_language_server",
        "bashls",
        "cssls",
        "dockerls",
        "emmet_ls",
        "html",
        "jsonls",
        "lua_ls",
        "prismals",
        "prosemd_lsp",
        "solargraph",
        "tailwindcss",
        "tsserver",
        "vimls",
        "yamlls",
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "actionlint",
        "ansible-lint",
        "beautysh",
        "codespell",
        "editorconfig-checker",
        "eslint-lsp",
        "gitlint",
        "hadolint",
        "jsonlint",
        "luacheck",
        "markdownlint",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
        "vint",
        "yamllint",
        -- "misspell",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
