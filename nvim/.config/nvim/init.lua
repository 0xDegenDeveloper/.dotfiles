-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--require("config.autocmds")

-- Enable spell checking by default
vim.opt.spell = true
--vim.g.mapleader = " "

-- Set default theme
vim.cmd.colorscheme("catppuccin-frappe")

-- Use <leader> + <w> + "|" or "-" for window splitting
-- |: veritiacl split
-- -: horizontal split
vim.api.nvim_set_keymap("n", "<leader>w|", "<cmd>vsplit<CR>", {
  noremap = true,
  silent = true,
  desc = "Vertical Split",
})
vim.api.nvim_set_keymap("n", "<leader>wv", "<cmd>vsplit<CR>", {
  noremap = true,
  silent = true,
  desc = "Vertical Split",
})
vim.api.nvim_set_keymap("n", "<leader>w-", "<cmd>split<CR>", {
  noremap = true,
  silent = true,
  desc = "Horizontal Split",
})
vim.api.nvim_set_keymap("n", "<leader>ws", "<cmd>split<CR>", {
  noremap = true,
  silent = true,
  desc = "Horizontal Split",
})

-- -- Open the dashboard on launch
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- Open the dashboard
--     vim.cmd("Dashboard")
--   end,
-- })

vim.api.nvim_create_user_command("SetCurrentColorschemeAsDefault", function()
  -- Get the current colorscheme
  local current = vim.g.colors_name

  if current and current ~= "" then
    -- Update the init.lua file to set this colorscheme
    local init_file = vim.fn.stdpath("config") .. "/init.lua"
    local content = io.open(init_file, "r"):read("*all")

    -- Replace or add the colorscheme line
    if content:find("vim.cmd.colorscheme%(") then
      content = content:gsub('vim.cmd.colorscheme%(".-"%)', 'vim.cmd.colorscheme("catppuccin-frappe")')
    else
      content = content .. '\n\n-- Set default colorscheme\nvim.cmd.colorscheme("catppuccin-frappe")\n'
    end

    -- Write back to the file
    local file = io.open(init_file, "w")
    if file then
      file:write(content)
      file:close()
      vim.notify("Default colorscheme set to " .. current, vim.log.levels.INFO)
    else
      vim.notify("Failed to write to " .. init_file, vim.log.levels.ERROR)
    end
  else
    vim.notify("No colorscheme is currently set", vim.log.levels.ERROR)
  end
end, {})

-- Add a keymap to set the current colorscheme as default
vim.keymap.set("n", "<leader>cP", function()
  vim.cmd("SetCurrentColorschemeAsDefault")
end, { desc = "Set Colorscheme" })
