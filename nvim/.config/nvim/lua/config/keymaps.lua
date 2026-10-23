-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>w-", "<cmd>split<CR>", { desc = "Horizontal Split" })

vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>")
