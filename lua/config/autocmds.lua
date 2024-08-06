-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local opt = vim.opt
local function augroup(name)
  return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

-- C/C++
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("c/c++"),
  pattern = { "c", "cpp" },
  callback = function()
    vim.b.autoformat = true
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.expandtab = false
    opt.diffopt = opt.diffopt + "iwhite"
  end,
})
