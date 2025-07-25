-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.fn.executable("lazygit") == 0 then
  local name = "lazygit"
  local user = "jesseduffield"
  local ext = ".tar.gz"
  local version = "0.53.0"
  local archive = name .. "_" .. version .. "_Linux_x86_64" .. ext
  local file = name .. ext
  local cmd = "curl -Lo "
    .. file
    .. " 'https://github.com/"
    .. user
    .. "/"
    .. name
    .. "/releases/download/v"
    .. version
    .. "/"
    .. archive
    .. "'"
  os.execute(cmd)
  os.execute("tar xf " .. file .. " " .. name)
  os.execute("mkdir -p ~/.local/bin/")
  os.execute("mv " .. name .. "  ~/.local/bin/")
  os.execute("rm " .. file)
end

if vim.fn.executable("fzf") == 0 then
  local name = "fzf"
  local user = "junegunn"
  local ext = ".tar.gz"
  local version = "0.64.0"
  local archive = name .. "-" .. version .. "-linux_amd64" .. ext
  local file = name .. ext
  local cmd = "curl -Lo "
    .. file
    .. " 'https://github.com/"
    .. user
    .. "/"
    .. name
    .. "/releases/download/v"
    .. version
    .. "/"
    .. archive
    .. "'"
  os.execute(cmd)
  os.execute("tar xf " .. file .. " " .. name)
  os.execute("mkdir -p ~/.local/bin/")
  os.execute("mv " .. name .. "  ~/.local/bin/")
  os.execute("rm " .. file)
end

require("config.lazy")
