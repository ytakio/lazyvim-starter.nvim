return {
  {
    "linux-cultist/venv-selector.nvim",
    optional = true,
    opts = function(_, opts)
      --opts.enable_debug_output = true
      opts.parents = 5
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, 4, {
        require("lualine.components.venv-selector"),
        cond = function()
          return vim.bo.filetype == "python"
        end,
      })
    end,
  },
}
