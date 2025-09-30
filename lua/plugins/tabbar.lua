return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = {
        always_show_bufferline = true,
        show_tab_indicators = true,
        separator_style = "thin",
      }
    end,
  },
}
