return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      float = {
        transparent = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
  },
}
