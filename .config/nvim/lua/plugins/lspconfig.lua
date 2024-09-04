return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          init_options = {
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifierPreference = "non-relative",
              -- other settings
            },
          },
        },
      },
    },
  },
}
