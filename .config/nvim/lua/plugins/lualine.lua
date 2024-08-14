return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_y = { { "progress", separator = " ", padding = { left = 1, right = 1 } } }
      opts.sections.lualine_z = { { "location", padding = { left = 0, right = 2 } } }
    end,
  },
}
