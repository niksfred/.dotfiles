return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      -- You can add your configuration here
      -- Here are some example options:
      show = true,
      handle = {
        blend = 0,
      },
      marks = {
        Search = { color = "#FFB86C" },
        Error = { color = "#FF5555" },
        Warn = { color = "#F1FA8C" },
        Info = { color = "#8BE9FD" },
        Hint = { color = "#50FA7B" },
        Misc = { color = "#BD93F9" },
      },
      handler = {
        gitsigns = true,
      },
    })
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
