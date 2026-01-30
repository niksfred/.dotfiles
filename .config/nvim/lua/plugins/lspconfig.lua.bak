return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      cmd_env = {
        NODE = "~/.nvm/versions/node/v22.13.0/bin/node", -- Global setting
      },
      servers = {
        ts_ls = {
          cmd = { "~/.nvm/versions/node/v22.13.0/bin/node", vim.fn.exepath("typescript-language-server"), "--stdio" },
          init_options = {
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifierPreference = "non-relative",
              -- other settings
            },
          },
          settings = {
            javascript = {
              format = {
                insertSpaceAfterKeywordsInControlFlowStatements = false, -- Disable space after keywords like 'if'
              },
            },
            typescript = {
              format = {
                insertSpaceAfterKeywordsInControlFlowStatements = false, -- Disable space after keywords like 'if'
              },
            },
          },
        },
      },
    },
  },
}
