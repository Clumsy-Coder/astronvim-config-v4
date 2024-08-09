-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources
-- https://github.com/nvimtools/none-ls.nvim

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require("null-ls")
    -- local completion = null_ls.builtins.completion
    local diagnostics = null_ls.builtins.diagnostics
    -- local formatting = null_ls.builtins.formatting
    -- local hover = null_ls.builtins.hover
    local code_actions = null_ls.builtins.code_actions

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
        -- code actions
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
        -- code_actions.eslint_d,            -- eslint code suggestions
        code_actions.gitsigns,               -- git action on a hunk
        -- code_actions.shellcheck,          -- shellcheck code suggestions

        -- ########################################################################################## --
        -- completion
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#completion
        -- completion.luasnip,               -- snippet engine for Neovim
        -- completion.spell,                 -- spell suggestions

        -- ########################################################################################## --
        -- diagnostics
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
        -- diagnostics.actionlint,           -- Github actions
        diagnostics.codespell.with({         -- spell check environments
          extra_args = function()
            return {
              -- obtained from
              -- - https://github.com/codespell-project/codespell/issues/66#issuecomment-270019597
              "--exclude-file=$HOME/.config/nvim/spell/en.utf-8.add"
            }
          end
        }),
        -- diagnostics.commitlint,           -- checks commit messages meets conventional commit format
        -- diagnostics.cspell,               -- spell checker for code
        -- diagnostics.editorconfig_checker, -- check files are using .editorconfig configs
        -- diagnostics.eslint_d,             -- like eslint but faster
        -- diagnostics.gitlint,              -- lint for git commit messages
        -- diagnostics.hadolint,             -- dockerfile linter
        -- diagnostics.jsonlint,             -- json linter
        -- diagnostics.luacheck,             -- lua linter
        -- diagnostics.markdownlint,         -- markdown linter
        -- diagnostics.misspell,             -- checks commonly misspelled words in code
        -- diagnostics.selene,
        -- diagnostics.shellcheck,           -- shell linter
        -- diagnostics.spectral,             -- json/yaml linter
        -- diagnostics.todo_comments,        -- show TODO comments
        -- diagnostics.trail_space,          -- detect trailing whitespace
        -- diagnostics.tsc,                  -- typescript linter
        -- diagnostics.vint,                 -- vimscript linter
        -- diagnostics.yamllint,             -- yaml linter
        -- diagnostics.zsh,                  -- zsh linter

        -- ########################################################################################## --
        -- formatting
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#formatting
        -- formatting.beautysh,              -- shell code formatter
        -- formatting.codespell,             -- fix common spelling mistakes
        -- formatting.eslint_d,              -- eslint formatter
        -- formatting.markdownlint,          -- markdown formatter
        -- formatting.markdown_toc,          -- markdown table of content generator
        -- formatting.nginx_beautifier,      -- nginx formatter
        -- formatting.prettierd,             -- js, ts, jsx, tsx, css
        -- formatting.shfmt,                 -- bash
        -- formatting.stylua,                -- lua

        -- ########################################################################################## --
        -- hover
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#hover
        -- hover.dictionary,                 -- dictionary

        -- ########################################################################################## --
    }
    return config -- return final config table
  end,
}

