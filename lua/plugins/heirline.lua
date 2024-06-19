-- neovim status line plugin
-- https://github.com/rebelot/heirline.nvim
--
---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")
    -- show vim mode on status line
    -- obtained from https://astronvim.com/Recipes/status#default-statusline-with-mode-text
    opts.statusline[1] = status.component.mode({
      mode_text = {
        padding = {
          left = 1,
          right = 1,
        },
      },
    })

    -- add breadcrumbs for the file opened
    -- obtained from
    --   https://code.mehalter.com/AstroNvim_user/~files/2d782a1/plugins/heirline.lua?position=source-9.1-26.6-1
    -- check:
    --   https://astronvim.com/Recipes/status#replicate-visual-studio-code-winbar
    opts.winbar[1][1] = status.component.separated_path({ path_func = status.provider.filename({ modify = ":.:h" }) })
    opts.winbar[2] = {
      status.component.separated_path({ path_func = status.provider.filename({ modify = ":.:h" }) }),
      -- add file_info to breadcrumbs
      status.component.file_info({
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      }),
      status.component.breadcrumbs({
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      }),
    }

    return opts
  end,
}


