-- Nvim Treesitter configurations and abstraction layer
-- https://github.com/nvim-treesitter/nvim-treesitter

-- treesitter languages to autoinstall
local ensure_installed = {
  -- "org",
  "bash",
  "c_sharp",
  "comment",
  "css",
  "dockerfile",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "html",
  "http",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "jsonc",
  "lua",
  "markdown",
  "regex",
  "todotxt",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    -- even better % navigate and highlight matching words
    -- https://github.com/andymass/vim-matchup
    "nvim-treesitter/nvim-treesitter-context",
    {
      -- obtained from https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/plugins/treesitter.lua?position=source-5.1-5.95-1
      "andymass/vim-matchup",
      event = "User AstroFile",
      init = function() vim.g.matchup_matchparen_deferred = 1 end,
    },
    -- Rainbow delimiters for Neovim with Tree-sitter
    -- https://github.com/HiPhish/rainbow-delimiters.nvim
    {
      -- obtained from https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/plugins/treesitter.lua?position=source-6.1-19.7-1
      "HiPhish/rainbow-delimiters.nvim",
      event = "User AstroFile",
      dependencies = {
        "catppuccin",
        optional = true,
        ---@type CatppuccinOptions
        opts = { integrations = { rainbow_delimiters = true } },
      },
      opts = function()
        return {
          strategy = {
            [""] = function()
              -- load if the buffer is NOT large
              if not vim.b.large_buf then return require("rainbow-delimiters").strategy.global end
            end,
          },
        }
      end,
      main = "rainbow-delimiters.setup",
    },
    -- Use treesitter to auto close and auto rename html tag
    -- https://github.com/windwp/nvim-ts-autotag
    {
      "windwp/nvim-ts-autotag",
      config = function() require('nvim-ts-autotag').setup() end,
    },
    -- treesitter plugin for setting the commentstring based on the cursor location in a file
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false
      },
      config = function(_, opts) require('ts_context_commentstring').setup(opts) end,
    }
  },
  -------------------------------------------------------------------------------------------------
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = ensure_installed,
    auto_install = vim.fn.executable "tree-sitter" == 1,
    sync_install = false,
    ignore_install = {},
    highlight = { -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = { -- https://github.com/nvim-treesitter/nvim-treesitter#incremental-selection
      enable = true,
    },
    indent = { -- https://github.com/nvim-treesitter/nvim-treesitter#indentation
      enable = true,
      disable = { "yaml" },
    },
    autopairs = { -- needs plugin https://github.com/windwp/nvim-autopairs
      enable = true,
    },
    -- autotag = { -- needs plugin https://github.com/windwp/nvim-ts-autotag
    --   enable = true,
    -- },
    -- context_commentstring = { -- needs plugin https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    --   enable = true,
    --   enable_autocmd = false,
    -- },
    matchup = { -- needs plugin https://github.com/andymass/vim-matchup
      enable = true,
    },
  },
}
