local function get_venv()
  local venv_name = vim.env.VIRTUAL_ENV or require("venv-selector").get_active_venv()
  if venv_name ~= nil then
    local dirname = venv_name:match("[^/\\]+$")
    return "(" .. dirname .. ")"
  else
    return ""
  end
end

return {
  "linux-cultist/venv-selector.nvim",
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, 4, {
        function()
          local venv = get_venv()
          return venv
        end,
        separator = "",
        padding = { left = 0, right = 0 },
        cond = function()
          return vim.bo.filetype == "python"
        end,
      })
    end,
  },
}
