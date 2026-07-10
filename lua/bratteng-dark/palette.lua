-- Bratteng Dark palette
-- Extracted from the VSCode "Bratteng Dark" color theme.
-- An Atom One Dark derivative with a custom near-black background.

local palette = {
  -- Backgrounds
  bg = "#1d1f20", -- editor.background
  bg_dark = "#181a1f", -- editorGroup.border / tab.border / widget borders
  bg_float = "#1d1f20", -- editorHoverWidget / editorWidget background
  bg_highlight = "#2c313c", -- editor.lineHighlightBackground (cursor line)
  bg_sidebar = "#1d1f20", -- sideBar.background
  bg_statusline = "#1d1f20", -- statusBar.background
  bg_selection = "#3e4451", -- editor.selectionBackground (#67769660 blended)
  bg_visual = "#3e4451",
  bg_search = "#42557b", -- editor.findMatchBackground
  bg_search_hl = "#314365", -- editor.findMatchHighlightBackground
  bg_word_hl = "#484e5b", -- editor.wordHighlightBackground
  bg_match_paren = "#515a6b", -- editorBracketMatch.background
  bg_menu = "#1d1f20", -- editorSuggestWidget.background
  bg_menu_sel = "#2c313a", -- editorSuggestWidget.selectedBackground / list.activeSelectionBackground
  bg_pmenu_thumb = "#4e5666", -- scrollbarSlider.background (opaque approximation)

  -- Foregrounds
  fg = "#abb2bf", -- editor.foreground
  fg_sidebar = "#d7dae0", -- list.activeSelectionForeground
  fg_statusline = "#9da5b4", -- statusBar.foreground
  fg_dark = "#737984", -- editorLineNumber.activeForeground
  fg_gutter = "#495162", -- editorLineNumber.foreground
  fg_conceal = "#7f848e", -- terminal.ansiBrightBlack / word highlight border

  -- Guides / whitespace
  indent = "#3b4048", -- editorIndentGuide.background / editorWhitespace.foreground
  indent_active = "#c8c8c8", -- editorIndentGuide.activeBackground (#c8c8c859)

  -- Cursor
  cursor = "#528bff", -- editorCursor.foreground
  cursor_bg = "#ffffff", -- editorCursor.background (#ffffffc9)

  -- Border / separators
  border = "#181a1f",
  focus_border = "#464646",

  -- Syntax core colors (Atom One Dark family)
  comment = "#5c6370",
  red = "#e06c75",
  green = "#98c379",
  yellow = "#e5c07b",
  orange = "#d19a66",
  blue = "#61afef",
  purple = "#c678dd",
  cyan = "#56b6c2",
  white = "#d7dae0",

  -- Diagnostics / states
  error = "#c24038", -- editorError.foreground
  error_bright = "#f44747", -- terminal.ansiBrightRed / token.error-token
  warning = "#e5c07b",
  info = "#61afef",
  hint = "#56b6c2",

  -- Git decoration (from commented gitDecoration.* keys in source theme)
  git_add = "#81b88b",
  git_change = "#e2c08d",
  git_delete = "#c74e39",
  git_conflict = "#6c6cc4",
  git_ignored = "#8c8c8c",
  git_untracked = "#73c991",

  -- Diff
  diff_add = "#a6e22e",
  diff_delete = "#f92672",
  diff_change = "#e6db74",
  diff_header = "#75715e",

  -- Accents
  accent = "#d19a66", -- tab.activeBorder
  link = "#61afef", -- textLink.foreground

  -- Terminal ANSI (from terminal.ansi* keys)
  terminal = {
    black = "#2d3139",
    red = "#e06c75",
    green = "#98c379",
    yellow = "#e5c07b",
    blue = "#61afef",
    magenta = "#c678dd",
    cyan = "#56b6c2",
    white = "#d7dae0",
    bright_black = "#7f848e",
    bright_red = "#f44747",
    bright_green = "#98c379",
    bright_yellow = "#e5c07b",
    bright_blue = "#528bff",
    bright_magenta = "#7e0097",
    bright_cyan = "#56b6c2",
    bright_white = "#d7dae0",
  },

  none = "NONE",
}

return palette
