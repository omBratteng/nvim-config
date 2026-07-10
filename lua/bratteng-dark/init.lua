-- Bratteng Dark colorscheme for Neovim.
-- Converted from the VSCode "Bratteng Dark" theme.

local M = {}

---@class BrattengConfig
local defaults = {
  -- Disable setting a background color (use terminal background).
  transparent = false,
  -- Per-group style overrides. Each is a table passed to nvim_set_hl
  -- (e.g. { italic = true }). Set to {} to disable.
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = { italic = true },
    types = { italic = true },
  },
  -- Override or add highlight groups after the theme is built.
  ---@type table<string, table>
  on_highlights = {},
  -- Callback for programmatic overrides: function(highlights, colors)
  ---@type fun(highlights: table, colors: table)|nil
  on_colors = nil,
}

M.config = vim.deepcopy(defaults)

---Merge user options into the current config.
---@param opts BrattengConfig|nil
function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts)

  -- `styles.*` entries are replaced wholesale (not deep-merged) so that
  -- passing an empty table clears a default style such as italics.
  if opts.styles then
    for key, value in pairs(opts.styles) do
      M.config.styles[key] = value
    end
  end
end

---Apply the colorscheme.
---@param opts BrattengConfig|nil optional one-shot config overrides
function M.load(opts)
  if opts then
    M.setup(opts)
  end
  local config = M.config

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "bratteng-dark"
  vim.o.background = "dark"

  local colors = require("bratteng-dark.palette")

  -- Optional programmatic palette tweaks.
  if type(config.on_colors) == "function" then
    config.on_colors(colors)
  end

  local highlights = require("bratteng-dark.highlights").get(colors, config)

  -- User highlight overrides.
  for group, spec in pairs(config.on_highlights or {}) do
    highlights[group] = vim.tbl_extend("force", highlights[group] or {}, spec)
  end

  local set_hl = vim.api.nvim_set_hl
  for group, spec in pairs(highlights) do
    if type(spec) == "string" then
      set_hl(0, group, { link = spec })
    else
      set_hl(0, group, spec)
    end
  end

  require("bratteng-dark.terminal").setup(colors)
end

---Expose the raw palette for statusline / lualine integrations.
---@return table
function M.colors()
  return require("bratteng-dark.palette")
end

return M
