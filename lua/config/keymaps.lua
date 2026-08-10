-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ao", function()
  Snacks.terminal.toggle("omp", {
    win = {
      position = "right",
      width = 0.4,
    },
  })
end, { desc = "Toggle Oh My Pi" })

vim.keymap.set("n", "<leader>th", function()
  Snacks.terminal(nil, { win = { position = "bottom", height = 0.3 } })
end, { desc = "Terminal (horizontal split)" })

vim.keymap.set("n", "<leader>tv", function()
  Snacks.terminal(nil, { win = { position = "right", width = 0.4 } })
end, { desc = "Terminal (vertical split)" })
