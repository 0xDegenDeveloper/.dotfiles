return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "solidity" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- solc --lsp does not load Foundry remappings, so `vm` looks undeclared.
        solidity = { enabled = false },
        solc = { enabled = false },
        solang = { enabled = false },
        solidity_ls_nomicfoundation = { enabled = false },
        -- Foundry's server. Reuse the solidity_ls client so nvim-lspconfig's
        -- root markers (foundry.toml, remappings.txt, .git) still apply.
        solidity_ls = {
          mason = false,
          cmd = { "forge", "lsp", "--stdio" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        solidity = { "forge_fmt" },
      },
    },
  },
}
