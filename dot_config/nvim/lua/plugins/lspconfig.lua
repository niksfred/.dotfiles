return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {},
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
