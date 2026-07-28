-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config(vim.tbl_deep_extend("force", vim.diagnostic.config() or {}, {
  virtual_text = { source = "if_many" },
  float = { source = true },
}))

if vim.env.SSH_TTY then
  vim.opt.clipboard = "unnamedplus"

  local function paste()
    return { vim.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end

  local copy
  local name
  if vim.fn.executable("it2copy") == 1 then
    name = "it2copy"
    copy = { "bash", "-c", "it2copy > $SSH_TTY" }
  else
    name = "OSC 52"
    local osc52 = require("vim.ui.clipboard.osc52")
    copy = nil
    vim.g.clipboard = {
      name = name,
      copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
      paste = { ["+"] = paste, ["*"] = paste },
    }
  end

  if copy then
    vim.g.clipboard = {
      name = name,
      copy = { ["+"] = copy, ["*"] = copy },
      paste = { ["+"] = paste, ["*"] = paste },
    }
  end
end
