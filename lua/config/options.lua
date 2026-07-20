-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config(vim.tbl_deep_extend("force", vim.diagnostic.config() or {}, {
  virtual_text = { source = "if_many" },
  float = { source = true },
}))
