vim.g.mapleader = " "

-- Bootstrap plugins into pack/plugins/start/ via git clone
local pack_path = vim.fn.stdpath("data") .. "/site/pack/plugins/start"

local plugins = {
  ["catppuccin"] = { url = "https://github.com/catppuccin/nvim.git" },
  ["nvim-treesitter"] = { url = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
  ["nvim-lspconfig"] = { url = "https://github.com/neovim/nvim-lspconfig.git" },
  ["conform.nvim"] = { url = "https://github.com/stevearc/conform.nvim.git" },
  ["gitsigns.nvim"] = { url = "https://github.com/lewis6991/gitsigns.nvim.git" },
  ["snacks.nvim"] = { url = "https://github.com/folke/snacks.nvim.git" },
  ["lualine.nvim"] = { url = "https://github.com/nvim-lualine/lualine.nvim.git" },
  ["bufferline.nvim"] = { url = "https://github.com/akinsho/bufferline.nvim.git" },
  ["which-key.nvim"] = { url = "https://github.com/folke/which-key.nvim.git" },
  ["gitlinker.nvim"] = { url = "https://github.com/linrongbin16/gitlinker.nvim.git" },
  ["nvim-web-devicons"] = { url = "https://github.com/nvim-tree/nvim-web-devicons.git" },
}

local function ensure_plugin(name, spec)
  local dir = pack_path .. "/" .. name
  if not vim.uv.fs_stat(dir) then
    vim.notify("Cloning " .. name .. "...")
    vim.fn.system({ "git", "clone", "--filter=blob:none", spec.url, dir })
  end
  if spec.pin then
    vim.fn.system({ "git", "-C", dir, "checkout", spec.pin })
  end
end

for name, spec in pairs(plugins) do
  ensure_plugin(name, spec)
end

vim.cmd("packloadall")

vim.api.nvim_create_user_command("PackUpdate", function()
  for name, spec in pairs(plugins) do
    local dir = pack_path .. "/" .. name
    if spec.pin then
      vim.fn.system({ "git", "-C", dir, "fetch", "--tags" })
      vim.fn.system({ "git", "-C", dir, "checkout", spec.pin })
      vim.notify(name .. " pinned to " .. spec.pin)
    else
      vim.notify("Updating " .. name .. "...")
      vim.fn.system({ "git", "-C", dir, "pull", "--ff-only" })
    end
  end
  vim.notify("Pack update complete.")
end, {})

vim.api.nvim_create_user_command("PackClean", function()
  local handle = vim.uv.fs_scandir(pack_path)
  if not handle then return end
  while true do
    local name, typ = vim.uv.fs_scandir_next(handle)
    if not name then break end
    if typ == "directory" and not plugins[name] then
      local dir = pack_path .. "/" .. name
      vim.fn.delete(dir, "rf")
      vim.notify("Removed " .. name)
    end
  end
end, {})

-- Auto-load config modules and plugin configs
local config_dir = vim.fn.stdpath("config") .. "/lua/config"

for _, file in ipairs(vim.fn.glob(config_dir .. "/*.lua", true, true)) do
  local mod = file:match("lua/(.*)%.lua$"):gsub("/", ".")
  require(mod)
end

for _, file in ipairs(vim.fn.glob(config_dir .. "/plugins/*.lua", true, true)) do
  local mod = file:match("lua/(.*)%.lua$"):gsub("/", ".")
  require(mod)
end
