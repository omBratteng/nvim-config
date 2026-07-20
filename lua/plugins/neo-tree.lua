return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      group_empty_dirs = true,
      scan_mode = "deep",
      filtered_items = {
        visible = true, -- show filtered items by default
        hide_dotfiles = false, -- show .files
        hide_gitignored = false,
      },
    },
  },
}
