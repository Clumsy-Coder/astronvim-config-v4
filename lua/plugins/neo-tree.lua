-- Neovim plugin to manage the file system and other tree like structures.
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- obtained from
--    https://code.mehalter.com/AstroNvim_user/~files/42dca1/lua/plugins/neo-tree.lua
--
--- @type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        indent_size = 2,
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        always_show = { ".github", ".gitignore" },
        hide_by_name = {
          ".DS_Store",
          ".git",
          "node_modules",
        },
      },
    },
    nesting_rules = {
      docker = {
        pattern = "^dockerfile$",
        ignore_case = true,
        files = { ".dockerignore", "docker-compose.*", "dockerfile*" },
      },
      git_files = {
        pattern = "^%.gitignore$",
        files = { ".gitattributes", ".gitmodules", ".gitmessage", ".mailmap", ".git-blame*" },
      },
      readme = {
        pattern = "^readme.*",
        ignore_case = true,
        files = {
          "authors",
          "backers*",
          "changelog*",
          "citation*",
          "code_of_conduct*",
          "codeowners",
          "contributing*",
          "contributors",
          "copying*",
          "credits",
          "governance.md",
          "history.md",
          "license*",
          "maintainers",
          "readme*",
          "security.md",
          "sponsors*",
        },
      },
    },
  },
}
