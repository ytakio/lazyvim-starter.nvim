-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.fn.executable("lazygit") == 0 then
  local version = "0.44.1"
  local cmd = "curl -Lo lazygit.tar.gz"
    .. " 'https://github.com/jesseduffield/lazygit/releases/download/v" .. version
    .. "/lazygit_" .. version .. "_Linux_x86_64.tar.gz'"
  os.execute(cmd)
  os.execute("tar xf lazygit.tar.gz lazygit")
  os.execute("mkdir -p ~/.local/bin/")
  os.execute("mv lazygit ~/.local/bin/")
  os.execute("rm lazygit.tar.gz")
end

require("config.lazy")
