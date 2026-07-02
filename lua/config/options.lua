-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.wrapscan = false
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 3

-- Python for optimization of launch time
if vim.fn.has("mac") == 1 then
  -- For MacOS
  vim.g.python3_host_prog = vim.fn.expand("~/.local/share/mise/shims/python3")
else
  -- For Linux
  -- vim.g.python3_host_prog = "~/.local/share/mise/shims/python3"
end

-- Set Picker
-- {telescope | fzf }
vim.g.lazyvim_picker = "snacks"
-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"
-- set animations disabled
vim.g.snacks_animate = false
