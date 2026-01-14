function PreviewStub(url)
  print(url)
end

return {
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.mkdp_port = 18888
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_browser = "echo" -- just suppress opening browser
    end,
    keys = {},
  },
}
