return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
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
