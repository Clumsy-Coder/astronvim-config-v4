-- preview markdown in a browser
-- https://github.com/iamcco/markdown-preview.nvim

local prefix = "<Leader>m"

---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix] = {
              -- use markdown icon from nvim-tree/nvim-web-devicons
              name = require("nvim-web-devicons").get_icon_by_filetype("markdown") .. " Markdown",
              r = { "<cmd>MarkdownPreview<cr>", "Render Markdown in browser" },
              s = { "<cmd>MarkdownPreviewStop<cr>", "Stop rendering Markdown in browser" },
              t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle rendering Markdown in browser" },
            },
          },
        },
      },
    },
  },
  ft = { "markdown", "rmd" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}


