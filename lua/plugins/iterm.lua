return {
  "ombratteng/iterm.nvim",
  version = false,
  cond = vim.env.TERM_PROGRAM == "iTerm.app",
  opts = { profile = "Neovim" },
  config = function(_, opts)
    local iterm = require("iterm")
    iterm.setup(opts)

    local function set_title()
      iterm.set_name(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
    end

    set_title()
    vim.api.nvim_create_autocmd("DirChanged", { callback = set_title })
  end,
}
