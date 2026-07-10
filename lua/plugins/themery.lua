return {
  "zaldih/themery.nvim",
  lazy = false,
  -- enabled = false,
  config = function()
    require("themery").setup({
      themes = {
        "bratteng-dark",
        "bratteng-dark-old",
        "onedark",
        "catppuccin",
        "tokyonight-moon",
      },
      livePreview = true,
    })
  end,
}
