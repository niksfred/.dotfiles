return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        ts_ls = {
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
