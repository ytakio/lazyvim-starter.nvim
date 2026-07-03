return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false, -- to handle manually
      anti_conceal = {
        -- This enables hiding added text on the line the cursor is on.
        enabled = false,
        -- Modes to disable anti conceal feature.
        disabled_modes = false,
        -- Number of lines above cursor to show.
        above = 0,
        -- Number of lines below cursor to show.
        below = 0,
        -- Which elements to always show, ignoring anti conceal behavior. Values can either be
        -- booleans to fix the behavior or string lists representing modes where anti conceal
        -- behavior will be ignored. Valid values are:
        --   bullet
        --   callout
        --   check_icon, check_scope
        --   code_background, code_border, code_language
        --   dash
        --   head_background, head_border, head_icon
        --   indent
        --   latex
        --   link
        --   quote
        --   sign
        --   table_border
        --   virtual_lines
        ignore = {
          code_background = true,
          indent = true,
          sign = true,
          virtual_lines = true,
        },
      },
      overrides = {
        filetype = {
          Avante = { enabled = true },
        },
      },
    },
  },
}
