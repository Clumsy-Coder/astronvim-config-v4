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
        -- "angularls",               -- angular
        -- "ansiblels",               -- ansible
        -- "arduino_language_server", -- arduino
        -- "bashls",                  -- bash
        -- "cssls",                   -- css
        -- "dockerls",                -- docker
        -- "emmet_ls",                -- html
        -- "html",                    -- html
        -- "jsonls",                  -- json
        -- "lua_ls",                  -- lua
        -- "prismals",                -- prisma
        -- "prosemd_lsp",             -- markdown
        -- "solargraph",              -- ruby
        -- "tailwindcss",             -- css
        -- "tsserver",                -- typescript
        -- "vimls",                   -- vim
        -- "yamlls",                  -- yaml
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
        "actionlint",              -- yaml for github actions
        "ansible-lint",            -- ansible
        "beautysh",                -- bash, csh, ksh, sh, zsh
        "codespell",               -- spell checking
        "editorconfig-checker",    -- editorconfig
        "eslint-lsp",              -- eslint
        "gitlint",                 -- git
        "hadolint",                -- docker
        "jsonlint",                -- json
        "luacheck",                -- lua
        "markdownlint",            -- markdown
        "prettierd",               -- prettier
        "shellcheck",              -- bash
        "shfmt",                   -- bash, mksh, shell
        "stylua",                  -- lua
        "vint",                    -- vim
        "yamllint",                -- yaml
        "misspell",                -- spell checking
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
