return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
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
