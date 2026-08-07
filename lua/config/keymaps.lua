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
