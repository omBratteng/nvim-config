return {
  {
    dir = "/Users/ole-martin.bratteng/Developer/omBratteng/vscode-bratteng-dark/nvim",
    name = "bratteng-dark-old",
    lazy = false,
    priority = 1000,
    config = function()
      require("bratteng-dark-old").setup({})
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "bratteng-dark-old" },
  },
}
