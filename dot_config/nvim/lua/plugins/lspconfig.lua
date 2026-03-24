return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          cmd = {
            vim.fn.expand("~/.nvm/versions/node/v22.16.0/bin/node"),
            vim.fn.expand("~/.local/share/nvim/mason/packages/vtsls/node_modules/@vtsls/language-server/dist/main.js"),
            "--stdio",
          },
        },
      },
    },
  },

  -- Force Neovim’s Node provider (used by remote plugins) to Node v22
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.g.node_host_prog = vim.fn.expand("~/.nvm/versions/node/v22.16.0/bin/neovim-node-host")
    end,
  },
}
