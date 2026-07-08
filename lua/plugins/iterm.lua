return {
  "izeau/iterm.nvim",
  version = false,
  cond = vim.env.TERM_PROGRAM == "iTerm.app",
  opts = { profile = "Neovim" },
}
