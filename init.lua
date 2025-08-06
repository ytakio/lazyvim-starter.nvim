-- bootstrap lazy.nvim, LazyVim and your plugins

local function dl_util(target, base_url, archive)
  os.execute("mkdir -p ~/.local/bin/")
  local dl_cmd = string.format("curl -Lo %s '%s/%s'", archive, base_url, archive)
  os.execute(dl_cmd)
  os.execute(string.format("tar xf '%s' '%s'", archive, target))
  os.execute(string.format("mv '%s' ~/.local/bin/", target))
  os.execute(string.format("rm '%s'", archive))
end

function Update_LazyGit(force)
  local target = "lazygit"
  if (vim.fn.executable(target) == 0) or force then
    local id = "jesseduffield"
    local version = "0.53.0"
    local base_url = string.format("https://github.com/%s/%s/releases/download/v%s", id, target, version)
    local archive = string.format("%s_%s_Linux_x86_64.tar.gz", target, version)
    dl_util(target, base_url, archive)
  end
end
Update_LazyGit(false)

function Update_FzF(force)
  local target = "fzf"
  if (vim.fn.executable(target) == 0) or force then
    local id = "junegunn"
    local version = "0.64.0"
    local base_url = string.format("https://github.com/%s/%s/releases/download/v%s", id, target, version)
    local archive = string.format("%s-%s-linux_amd64.tar.gz", target, version)
    dl_util(target, base_url, archive)
  end
end
Update_FzF(false)

require("config.lazy")
