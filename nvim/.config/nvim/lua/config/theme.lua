local M = {}

local path = vim.fn.expand("~/.local/state/theme/current/nvim.lua")

function M.name()
  if vim.fn.filereadable(path) == 1 then
    local ok, name = pcall(dofile, path)
    if ok and type(name) == "string" then
      return name
    end
  end
  return "catppuccin-frappe"
end

function M.apply()
  local name = M.name()
  if vim.g.colors_name ~= name then
    pcall(vim.cmd.colorscheme, name)
  end
  return name
end

return M
