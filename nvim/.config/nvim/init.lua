-- Use nvm's default Node even when Neovim was not started from an interactive zsh.
local nvm_dir = vim.env.HOME .. "/.nvm"

local function nvm_resolve_bin(name, seen)
  if not name or name == "" then
    return nil
  end
  seen = seen or {}
  if seen[name] then
    return nil
  end
  seen[name] = true

  local version = name:gsub("^v", "")
  local bin = nvm_dir .. "/versions/node/v" .. version .. "/bin"
  if vim.fn.isdirectory(bin) == 1 then
    return bin
  end

  local alias_file = nvm_dir .. "/alias/" .. name
  if vim.fn.filereadable(alias_file) == 1 then
    local next_name = vim.fn.trim(vim.fn.readfile(alias_file)[1] or "")
    return nvm_resolve_bin(next_name, seen)
  end

  return nil
end

local nvm_bin = nvm_resolve_bin("default")
if nvm_bin then
  vim.env.PATH = nvm_bin .. ":" .. vim.env.PATH
end

require("config.lazy")

vim.cmd.colorscheme("catppuccin-frappe")

vim.keymap.set("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>w-", "<cmd>split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal Split" })
