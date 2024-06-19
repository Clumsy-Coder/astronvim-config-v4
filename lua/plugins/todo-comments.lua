-- Highlight, list and search todo comments in your projects
-- https://github.com/folke/todo-comments.nvim

---@type LazySpec
return {
  "folke/todo-comments.nvim",
  dependencies = {
    "AstroNvim/astroui",
  },
  event = "User AstroFile",
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon -- get icons from `astroui`. check file lua/plugins/astroui.lua
    -- local devicons = require("nvim-web-devicons") -- get icons from plugin `nvim-tree/nvim-web-devicons`

    ---@type TodoOptions
    local config = {
      signs = true,
      keywords = {
        -- HACK = { icon = get_icon('TodoHack', 0, true), color = "warning" },
        -- PERF = { icon = get_icon('TodoPerformance, 0, true'), color = "performance", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        -- WARN = { icon = get_icon("TodoWarn", 0, true), color = "warning",      alt = { "WARNING" } },
        DONE = { icon = get_icon("TodoDone", 0, true), color = "done", alt = { "COMPLETE" } },
        FIX = {
          icon = get_icon("TodoFix", 0, true),
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "DEBUG" },
        },
        NOTE = { icon = get_icon("TodoNote", 0, true), color = "hint", alt = { "INFO", "REVIEW" } },
        TEST = { icon = get_icon("TodoTest"), color = "test" },
        TODO = { icon = get_icon("Todo", 0, true), color = "todo" },
      },
      colors = {
        -- info    = { "DiagnosticInfo",     "#2563EB" },
        -- warning = { "DiagnosticWarning",  "WarningMsg", "#FBBF24" },
        default = { "#FFEB3B" },
        done = { "#4CAF50" },
        error = { "#f06292" },
        hint = { "Identifier", "#10B981" },
        test = { "DiagnosticHint", "#FF00FF" },
        todo = { "#FFBD2A" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--glob=!node_modules",
          "--glob=!meta/dotbot",
          "--glob=!.git",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    }

    return require("astrocore").extend_tbl(opts, config)
  end,
}
