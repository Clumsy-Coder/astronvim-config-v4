-- A completion plugin for neovim coded in Lua.
-- https://github.com/hrsh7th/nvim-cmp
--
-- obtained from
--    https://code.mehalter.com/AstroNvim_user/~files/42dca1/lua/plugins/cmp.lua
--    https://astronvim.github.io/recipes/cmp
--    https://astronvim.github.io/configuration/plugin_defaults#cmp
--    https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/cmp.lua
--    https://github.com/datamonsterr/astronvim_config/blob/main/plugins/cmp.lua
--    https://code.mehalter.com/AstroNvim_user/~files/42dca1/lua/plugins/cmp.lua

-- default astronvim cmp mappings
-- check https://github.com/AstroNvim/AstroNvim/blob/0fee587489/lua/configs/cmp.lua
-- <Up> : previous item
-- <Down> : next item
-- <C-p> : previous item
-- <C-n> : next item
-- <C-k> : previous item
-- <C-j> : next item
-- <C-d> : scroll up in selected item preview
-- <C-f> : scroll down in selected item preview
-- <C-e> : exit cmp
-- <Tab> : next item
-- <S-Tab> : previous item
--
---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- "hrsh7th/cmp-calc",
    -- "hrsh7th/cmp-emoji",
    -- "jc-doyle/cmp-pandoc-references",
    -- "kdheepak/cmp-latex-symbols",
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    -- cmp sources
    opts.sources = {
      -- https://github.com/hrsh7th/cmp-nvim-lsp
      {
        name = "nvim_lsp",
        priority = 1000,
        option = { markdown_oxide = { keyword_pattern = [[\(\k\| \|\/\|#\)\+]] } },
      },
      { name = "nvim_lua", priority = 750 }, -- https://github.com/hrsh7th/cmp-nvim-lua
      { name = "luasnip" , priority = 750 }, -- https://github.com/saadparwaiz1/cmp_luasnip
      { name = "buffer"  , priority = 500 }, -- https://github.com/hrsh7th/cmp-buffer
      { name = "neorg"   , priority = 400 }, -- https://github.com/nvim-neorg/neorg/wiki/Nvim-Cmp
      { name = "path"    , priority = 250 }, -- https://github.com/hrsh7th/cmp-path
      { name = "cmdline" , priority = 200 }, -- https://github.com/hrsh7th/cmp-cmdline
      { name = "git"     , priority = 100 }, -- https://github.com/petertriho/cmp-git
    }

    opts.cmdline = {
      -- first key is the source that you are setting up
      ["/"] = {
        -- set up custom mappings
        mapping = cmp.mapping.preset.cmdline(),
        -- configure sources normally without getting priority from cmp.source_priority
        sources = { { name = "buffer" } }, -- hrsh7th/cmp-buffer
      },
      [":"] = {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          -- {{ name = "path", option = { trailing_slash = true }}},
          { { name = "cmdline" } } -- hrsh7th/cmp-cmdline
        ),
      },
    }

    -- formatting cmp results
    opts.formatting = {
      fields = { "kind", "abbr", "menu" }, -- icon, abbreviation, type(snippet, function)
      -- rendering using `lspkind.nvim`
      -- check https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 100,
        ellipsis_char = "...",
        menu = {
          nvim_lsp = "[LSP]", -- use nvim plugin hrsh7th/cmp-nvim-lsp
          nvim_lua = "[NVIM_LUA]", -- use nvim plugin hrsh7th/cmp-nvim-lua
          luasnip = "[Snippet]", -- saadparwaiz1/cmp_luasnip
          buffer = "[Buffer]", -- hrsh7th/cmp-buffer
          path = "[Path]", -- hrsh7th/cmp-path
          git = "[Git]", -- petertriho/cmp-git
        },
      }),
    }

    -- window styling
    -- obtained from
    --   https://code.mehalter.com/AstroNvim_user/~files/cd190d/plugins/cmp.lua?position=source-22.1-29.9-1
    -- opts.window = {
    --   completion = {
    --     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
    --     -- border = "none",
    --     -- col_offset = -1,
    --     side_padding = 1,
    --   },
    -- }

    if not opts.sorting then opts.sorting = {} end
    local compare = require("cmp.config.compare")
    opts.sorting.comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    }
  end,
}

