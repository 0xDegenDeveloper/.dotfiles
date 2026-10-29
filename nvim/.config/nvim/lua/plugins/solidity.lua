return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solidity = { enabled = false },
        solidity_ls = { enabled = false },
        forge_lsp = {
          mason = false,
          cmd = { "forge", "lsp" },
          filetypes = { "solidity" },
          root_markers = { "foundry.toml" },
        },
      },
    },
  },
}
