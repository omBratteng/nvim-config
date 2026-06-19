return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zizmor = {},
      },
      setup = {
        zizmor = function()
          -- zizmor has no bundled runtime/lsp config, so define it here.
          vim.lsp.config("zizmor", {
            cmd = { "zizmor", "--lsp" },
            filetypes = { "yaml" },
            root_markers = { ".github", ".git" },
          })
          -- returning false lets LazyVim continue and call vim.lsp.enable("zizmor")
          return false
        end,
      },
    },
  },
}
