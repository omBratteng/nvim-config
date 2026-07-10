-- Builds the highlight-group table for Bratteng Dark.
local M = {}

---@param c table palette
---@param opts table config options
---@return table<string, table> highlights
function M.get(c, opts)
  opts = opts or {}

  local bg = opts.transparent and c.none or c.bg
  local bg_sidebar = opts.transparent and c.none or c.bg_sidebar
  local bg_float = opts.transparent and c.none or c.bg_float

  local it = function(on)
    return on and { italic = true } or {}
  end

  local comment_style = opts.styles.comments or {}
  local keyword_style = opts.styles.keywords or {}
  local function_style = opts.styles.functions or {}
  local type_style = opts.styles.types or {}

  local hl = {
    ------------------------------------------------------------------
    -- Editor UI
    ------------------------------------------------------------------
    Normal = { fg = c.fg, bg = bg },
    NormalNC = { fg = c.fg, bg = bg },
    NormalFloat = { fg = c.fg, bg = bg_float },
    FloatBorder = { fg = c.border, bg = bg_float },
    FloatTitle = { fg = c.fg_dark, bg = bg_float },
    ColorColumn = { bg = c.bg_highlight },
    Cursor = { fg = c.bg, bg = c.cursor },
    lCursor = { fg = c.bg, bg = c.cursor },
    CursorIM = { fg = c.bg, bg = c.cursor },
    CursorColumn = { bg = c.bg_highlight },
    CursorLine = { bg = c.bg_highlight },
    Directory = { fg = c.blue },
    EndOfBuffer = { fg = bg },
    ErrorMsg = { fg = c.error_bright, bold = true },
    VertSplit = { fg = c.border, bg = bg },
    WinSeparator = { fg = c.border, bg = bg },
    Folded = { fg = c.fg_dark, bg = c.bg_highlight },
    FoldColumn = { fg = c.fg_gutter, bg = bg },
    SignColumn = { fg = c.fg_gutter, bg = bg },
    SignColumnSB = { fg = c.fg_gutter, bg = bg_sidebar },
    LineNr = { fg = c.fg_gutter, bg = bg },
    CursorLineNr = { fg = c.fg_dark, bg = c.bg_highlight, bold = true },
    MatchParen = { bg = c.bg_match_paren, bold = true },
    ModeMsg = { fg = c.fg_statusline, bold = true },
    MsgArea = { fg = c.fg_statusline },
    MoreMsg = { fg = c.blue },
    NonText = { fg = c.indent },
    Whitespace = { fg = c.indent },
    SpecialKey = { fg = c.indent },
    Pmenu = { fg = c.fg, bg = c.bg_menu },
    PmenuSel = { bg = c.bg_menu_sel, bold = true },
    PmenuSbar = { bg = c.bg_menu },
    PmenuThumb = { bg = c.bg_pmenu_thumb },
    PmenuKind = { fg = c.blue, bg = c.bg_menu },
    PmenuKindSel = { fg = c.blue, bg = c.bg_menu_sel },
    PmenuExtra = { fg = c.fg_dark, bg = c.bg_menu },
    PmenuExtraSel = { fg = c.fg_dark, bg = c.bg_menu_sel },
    Question = { fg = c.blue },
    QuickFixLine = { bg = c.bg_menu_sel, bold = true },
    Search = { fg = c.fg, bg = c.bg_search },
    IncSearch = { fg = c.bg, bg = c.orange },
    CurSearch = { fg = c.bg, bg = c.orange },
    Substitute = { fg = c.bg, bg = c.red },
    StatusLine = { fg = c.fg_statusline, bg = c.bg_statusline },
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline },
    TabLine = { fg = c.fg_gutter, bg = c.bg_dark },
    TabLineFill = { bg = c.bg_dark },
    TabLineSel = { fg = c.white, bg = bg },
    Title = { fg = c.blue, bold = true },
    Visual = { bg = c.bg_visual },
    VisualNOS = { bg = c.bg_visual },
    WarningMsg = { fg = c.warning },
    WildMenu = { bg = c.bg_menu_sel },
    Winbar = { fg = c.fg_statusline, bg = bg },
    WinbarNC = { fg = c.fg_gutter, bg = bg },
    Conceal = { fg = c.fg_conceal },
    LineNrAbove = { fg = c.fg_gutter },
    LineNrBelow = { fg = c.fg_gutter },
    CursorLineSign = { bg = c.bg_highlight },
    CursorLineFold = { bg = c.bg_highlight },

    ------------------------------------------------------------------
    -- Standard syntax groups
    ------------------------------------------------------------------
    Comment = vim.tbl_extend("force", { fg = c.comment }, comment_style),
    Constant = { fg = c.orange },
    String = { fg = c.green },
    Character = { fg = c.cyan },
    Number = { fg = c.orange },
    Float = { fg = c.orange },
    Boolean = { fg = c.orange },

    Identifier = { fg = c.red },
    Function = vim.tbl_extend("force", { fg = c.blue }, function_style),

    Statement = { fg = c.purple },
    Conditional = { fg = c.purple },
    Repeat = { fg = c.purple },
    Label = { fg = c.purple },
    Operator = { fg = c.cyan },
    Keyword = vim.tbl_extend("force", { fg = c.purple }, keyword_style),
    Exception = { fg = c.purple },

    PreProc = { fg = c.purple },
    Include = { fg = c.yellow },
    Define = { fg = c.purple },
    Macro = { fg = c.purple },
    PreCondit = { fg = c.yellow },

    Type = vim.tbl_extend("force", { fg = c.yellow }, type_style),
    StorageClass = vim.tbl_extend("force", { fg = c.purple }, type_style),
    Structure = { fg = c.yellow },
    Typedef = { fg = c.yellow },

    Special = { fg = c.cyan },
    SpecialChar = { fg = c.cyan },
    Tag = { fg = c.red },
    Delimiter = { fg = c.fg },
    SpecialComment = vim.tbl_extend("force", { fg = c.comment }, comment_style),
    Debug = { fg = c.red },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.fg_gutter },
    Error = { fg = c.error_bright },
    Todo = { fg = c.bg, bg = c.yellow, bold = true },

    ------------------------------------------------------------------
    -- Diagnostics (LSP)
    ------------------------------------------------------------------
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    DiagnosticOk = { fg = c.green },
    DiagnosticVirtualTextError = { fg = c.error, bg = c.none },
    DiagnosticVirtualTextWarn = { fg = c.warning, bg = c.none },
    DiagnosticVirtualTextInfo = { fg = c.info, bg = c.none },
    DiagnosticVirtualTextHint = { fg = c.hint, bg = c.none },
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
    DiagnosticFloatingError = { fg = c.error },
    DiagnosticFloatingWarn = { fg = c.warning },
    DiagnosticFloatingInfo = { fg = c.info },
    DiagnosticFloatingHint = { fg = c.hint },
    DiagnosticSignError = { fg = c.error },
    DiagnosticSignWarn = { fg = c.warning },
    DiagnosticSignInfo = { fg = c.info },
    DiagnosticSignHint = { fg = c.hint },
    DiagnosticUnnecessary = { fg = c.comment },
    DiagnosticDeprecated = { fg = c.comment, strikethrough = true },

    LspReferenceText = { bg = c.bg_word_hl },
    LspReferenceRead = { bg = c.bg_word_hl },
    LspReferenceWrite = { bg = c.bg_word_hl },
    LspSignatureActiveParameter = { fg = c.orange, bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { fg = c.fg_gutter, bg = c.bg_highlight },

    ------------------------------------------------------------------
    -- Diff / Git
    ------------------------------------------------------------------
    DiffAdd = { fg = c.git_add, bg = c.none },
    DiffChange = { fg = c.git_change, bg = c.none },
    DiffDelete = { fg = c.git_delete, bg = c.none },
    DiffText = { fg = c.blue, bg = c.none },
    diffAdded = { fg = c.git_add },
    diffRemoved = { fg = c.git_delete },
    diffChanged = { fg = c.git_change },
    diffOldFile = { fg = c.diff_header },
    diffNewFile = { fg = c.diff_header },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.cyan },
    Added = { fg = c.git_add },
    Changed = { fg = c.git_change },
    Removed = { fg = c.git_delete },

    ------------------------------------------------------------------
    -- Spell
    ------------------------------------------------------------------
    SpellBad = { undercurl = true, sp = c.error },
    SpellCap = { undercurl = true, sp = c.warning },
    SpellLocal = { undercurl = true, sp = c.info },
    SpellRare = { undercurl = true, sp = c.hint },
  }

  ------------------------------------------------------------------
  -- Treesitter (@-captures)
  ------------------------------------------------------------------
  local ts = {
    ["@comment"] = "Comment",
    ["@comment.documentation"] = { fg = c.comment, italic = true },
    ["@comment.error"] = { fg = c.error },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.todo"] = "Todo",
    ["@comment.note"] = { fg = c.hint },

    ["@constant"] = { fg = c.orange },
    ["@constant.builtin"] = { fg = c.orange },
    ["@constant.macro"] = { fg = c.orange },

    ["@string"] = { fg = c.green },
    ["@string.regexp"] = { fg = c.green },
    ["@string.escape"] = { fg = c.green },
    ["@string.special"] = { fg = c.cyan },
    ["@string.special.url"] = { fg = c.purple, underline = true },
    ["@string.documentation"] = { fg = c.green },
    ["@character"] = { fg = c.cyan },
    ["@character.special"] = { fg = c.cyan },

    ["@number"] = { fg = c.orange },
    ["@number.float"] = { fg = c.orange },
    ["@boolean"] = { fg = c.orange },
    ["@float"] = { fg = c.orange },

    ["@function"] = vim.tbl_extend("force", { fg = c.blue }, function_style),
    ["@function.builtin"] = { fg = c.cyan },
    ["@function.call"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.cyan },
    ["@function.method"] = vim.tbl_extend("force", { fg = c.blue }, function_style),
    ["@function.method.call"] = { fg = c.blue },
    ["@constructor"] = { fg = c.yellow },

    ["@keyword"] = vim.tbl_extend("force", { fg = c.purple }, keyword_style),
    ["@keyword.function"] = vim.tbl_extend("force", { fg = c.purple }, keyword_style),
    ["@keyword.operator"] = { fg = c.purple },
    ["@keyword.return"] = { fg = c.purple },
    ["@keyword.conditional"] = { fg = c.purple },
    ["@keyword.repeat"] = { fg = c.purple },
    ["@keyword.exception"] = { fg = c.purple },
    ["@keyword.import"] = { fg = c.yellow },
    ["@keyword.export"] = { fg = c.yellow },
    ["@keyword.storage"] = { fg = c.purple, italic = true },
    ["@keyword.coroutine"] = { fg = c.purple, italic = true },
    ["@keyword.directive"] = { fg = c.purple },

    ["@operator"] = { fg = c.cyan },

    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.red },
    ["@variable.parameter"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.orange },

    ["@property"] = { fg = c.orange },
    ["@field"] = { fg = c.orange },
    ["@parameter"] = { fg = c.fg },

    ["@type"] = vim.tbl_extend("force", { fg = c.yellow }, type_style),
    ["@type.builtin"] = vim.tbl_extend("force", { fg = c.yellow }, type_style),
    ["@type.definition"] = { fg = c.yellow },
    ["@type.qualifier"] = { fg = c.purple },
    ["@attribute"] = { fg = c.cyan },
    ["@namespace"] = { fg = c.yellow },
    ["@module"] = { fg = c.yellow },
    ["@module.builtin"] = { fg = c.red },

    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.cyan },

    ["@tag"] = { fg = c.red },
    ["@tag.builtin"] = { fg = c.red },
    ["@tag.attribute"] = { fg = c.orange, italic = true },
    ["@tag.delimiter"] = { fg = c.fg },

    ["@label"] = { fg = c.cyan },

    -- Markdown / markup
    ["@markup.heading"] = { fg = c.red, bold = true },
    ["@markup.heading.1"] = { fg = c.red, bold = true },
    ["@markup.heading.2"] = { fg = c.orange, bold = true },
    ["@markup.heading.3"] = { fg = c.yellow, bold = true },
    ["@markup.heading.4"] = { fg = c.green, bold = true },
    ["@markup.heading.5"] = { fg = c.blue, bold = true },
    ["@markup.heading.6"] = { fg = c.purple, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.raw"] = { fg = c.cyan },
    ["@markup.raw.block"] = { fg = c.cyan },
    ["@markup.link"] = { fg = c.purple, underline = true },
    ["@markup.link.label"] = { fg = c.blue },
    ["@markup.link.url"] = { fg = c.purple, underline = true },
    ["@markup.list"] = { fg = c.cyan },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.fg_dark },
    ["@markup.quote"] = { fg = c.comment, italic = true },
    ["@markup.math"] = { fg = c.orange },
    ["@markup.environment"] = { fg = c.purple },

    -- diff (treesitter)
    ["@diff.plus"] = { fg = c.git_add },
    ["@diff.minus"] = { fg = c.git_delete },
    ["@diff.delta"] = { fg = c.git_change },

    ["@none"] = { fg = c.fg },
  }

  ------------------------------------------------------------------
  -- LSP semantic tokens
  ------------------------------------------------------------------
  local lsp = {
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.comment"] = {},
    ["@lsp.type.decorator"] = "@attribute",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.macro"] = "@constant.macro",
    ["@lsp.type.method"] = "@function.method",
    ["@lsp.type.namespace"] = "@namespace",
    ["@lsp.type.parameter"] = "@variable.parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.struct"] = "@type",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.typeParameter"] = "@type",
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.string"] = "@string",
    ["@lsp.type.number"] = "@number",
    ["@lsp.type.operator"] = "@operator",
    ["@lsp.mod.readonly"] = { fg = c.orange },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
  }

  ------------------------------------------------------------------
  -- Plugins
  ------------------------------------------------------------------
  local plugins = {
    -- gitsigns.nvim
    GitSignsAdd = { fg = c.git_add },
    GitSignsChange = { fg = c.git_change },
    GitSignsDelete = { fg = c.git_delete },
    GitSignsAddNr = { fg = c.git_add },
    GitSignsChangeNr = { fg = c.git_change },
    GitSignsDeleteNr = { fg = c.git_delete },
    GitSignsAddLn = { bg = c.bg_highlight },
    GitSignsChangeLn = { bg = c.bg_highlight },
    GitSignsCurrentLineBlame = { fg = c.comment, italic = true },

    -- Telescope
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },
    TelescopeBorder = { fg = c.border, bg = c.bg_float },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_menu_sel },
    TelescopePromptBorder = { fg = c.bg_menu_sel, bg = c.bg_menu_sel },
    TelescopePromptTitle = { fg = c.bg, bg = c.orange, bold = true },
    TelescopePreviewTitle = { fg = c.bg, bg = c.green, bold = true },
    TelescopeResultsTitle = { fg = c.bg_float, bg = c.bg_float },
    TelescopeSelection = { bg = c.bg_menu_sel, bold = true },
    TelescopeSelectionCaret = { fg = c.orange, bg = c.bg_menu_sel },
    TelescopeMatching = { fg = c.orange, bold = true },
    TelescopePromptPrefix = { fg = c.orange },

    -- nvim-cmp
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.comment, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.orange, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.orange, bold = true },
    CmpItemMenu = { fg = c.comment },
    CmpItemKindText = { fg = c.fg },
    CmpItemKindMethod = { fg = c.blue },
    CmpItemKindFunction = { fg = c.blue },
    CmpItemKindConstructor = { fg = c.yellow },
    CmpItemKindField = { fg = c.orange },
    CmpItemKindVariable = { fg = c.red },
    CmpItemKindClass = { fg = c.yellow },
    CmpItemKindInterface = { fg = c.yellow },
    CmpItemKindModule = { fg = c.yellow },
    CmpItemKindProperty = { fg = c.orange },
    CmpItemKindUnit = { fg = c.cyan },
    CmpItemKindValue = { fg = c.orange },
    CmpItemKindEnum = { fg = c.yellow },
    CmpItemKindKeyword = { fg = c.purple },
    CmpItemKindSnippet = { fg = c.green },
    CmpItemKindColor = { fg = c.cyan },
    CmpItemKindFile = { fg = c.blue },
    CmpItemKindReference = { fg = c.red },
    CmpItemKindFolder = { fg = c.blue },
    CmpItemKindEnumMember = { fg = c.cyan },
    CmpItemKindConstant = { fg = c.orange },
    CmpItemKindStruct = { fg = c.yellow },
    CmpItemKindEvent = { fg = c.cyan },
    CmpItemKindOperator = { fg = c.cyan },
    CmpItemKindTypeParameter = { fg = c.yellow },

    -- blink.cmp
    BlinkCmpMenu = { fg = c.fg, bg = c.bg_menu },
    BlinkCmpMenuBorder = { fg = c.border, bg = c.bg_menu },
    BlinkCmpMenuSelection = { bg = c.bg_menu_sel, bold = true },
    BlinkCmpLabelMatch = { fg = c.orange, bold = true },
    BlinkCmpDoc = { fg = c.fg, bg = c.bg_float },
    BlinkCmpDocBorder = { fg = c.border, bg = c.bg_float },

    -- nvim-tree
    NvimTreeNormal = { fg = c.fg, bg = bg_sidebar },
    NvimTreeNormalNC = { fg = c.fg, bg = bg_sidebar },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeFolderIcon = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.blue, bold = true },
    NvimTreeEmptyFolderName = { fg = c.fg_dark },
    NvimTreeSpecialFile = { fg = c.orange, underline = true },
    NvimTreeGitDirty = { fg = c.git_change },
    NvimTreeGitStaged = { fg = c.git_add },
    NvimTreeGitNew = { fg = c.git_untracked },
    NvimTreeGitDeleted = { fg = c.git_delete },
    NvimTreeGitIgnored = { fg = c.git_ignored },
    NvimTreeIndentMarker = { fg = c.indent },
    NvimTreeWinSeparator = { fg = c.border, bg = bg_sidebar },
    NvimTreeCursorLine = { bg = c.bg_menu_sel },

    -- neo-tree
    NeoTreeNormal = { fg = c.fg, bg = bg_sidebar },
    NeoTreeNormalNC = { fg = c.fg, bg = bg_sidebar },
    NeoTreeDirectoryName = { fg = c.blue },
    NeoTreeDirectoryIcon = { fg = c.blue },
    NeoTreeRootName = { fg = c.purple, bold = true },
    NeoTreeGitAdded = { fg = c.git_add },
    NeoTreeGitDeleted = { fg = c.git_delete },
    NeoTreeGitModified = { fg = c.git_change },
    NeoTreeGitUntracked = { fg = c.git_untracked },
    NeoTreeGitIgnored = { fg = c.git_ignored },
    NeoTreeIndentMarker = { fg = c.indent },
    NeoTreeWinSeparator = { fg = c.border, bg = bg_sidebar },

    -- bufferline
    BufferLineFill = { bg = c.bg_dark },
    BufferLineBackground = { fg = c.fg_gutter, bg = c.bg_dark },
    BufferLineBufferSelected = { fg = c.white, bg = bg, bold = true },
    BufferLineIndicatorSelected = { fg = c.accent, bg = bg },
    BufferLineModified = { fg = c.green, bg = c.bg_dark },
    BufferLineModifiedSelected = { fg = c.green, bg = bg },

    -- indent-blankline (v3)
    IblIndent = { fg = c.indent },
    IblWhitespace = { fg = c.indent },
    IblScope = { fg = c.fg_gutter },
    -- indent-blankline (v2)
    IndentBlanklineChar = { fg = c.indent },
    IndentBlanklineContextChar = { fg = c.fg_gutter },

    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = c.fg_gutter },

    -- which-key
    WhichKey = { fg = c.orange },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat = { bg = c.bg_float },
    WhichKeyBorder = { fg = c.border, bg = c.bg_float },
    WhichKeyValue = { fg = c.comment },

    -- flash.nvim / leap
    FlashBackdrop = { fg = c.comment },
    FlashLabel = { fg = c.bg, bg = c.orange, bold = true },
    LeapBackdrop = { fg = c.comment },
    LeapMatch = { fg = c.orange, bold = true },
    LeapLabelPrimary = { fg = c.bg, bg = c.orange, bold = true },

    -- notify
    NotifyERRORBorder = { fg = c.error },
    NotifyWARNBorder = { fg = c.warning },
    NotifyINFOBorder = { fg = c.info },
    NotifyDEBUGBorder = { fg = c.comment },
    NotifyTRACEBorder = { fg = c.purple },
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyTRACEIcon = { fg = c.purple },
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
    NotifyDEBUGTitle = { fg = c.comment },
    NotifyTRACETitle = { fg = c.purple },

    -- dashboard / alpha
    DashboardHeader = { fg = c.blue },
    DashboardFooter = { fg = c.comment },
    AlphaHeader = { fg = c.blue },
    AlphaFooter = { fg = c.comment },

    -- lazy.nvim
    LazyProgressDone = { fg = c.green, bold = true },
    LazyProgressTodo = { fg = c.fg_gutter, bold = true },

    -- mason
    MasonHighlight = { fg = c.cyan },
    MasonHighlightBlock = { fg = c.bg, bg = c.cyan },
    MasonMuted = { fg = c.comment },

    -- rainbow-delimiters
    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterBlue = { fg = c.blue },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterGreen = { fg = c.green },
    RainbowDelimiterViolet = { fg = c.purple },
    RainbowDelimiterCyan = { fg = c.cyan },

    -- illuminate
    IlluminatedWordText = { bg = c.bg_word_hl },
    IlluminatedWordRead = { bg = c.bg_word_hl },
    IlluminatedWordWrite = { bg = c.bg_word_hl },
  }

  -- Merge everything.
  for k, v in pairs(ts) do
    hl[k] = v
  end
  for k, v in pairs(lsp) do
    hl[k] = v
  end
  for k, v in pairs(plugins) do
    hl[k] = v
  end

  return hl
end

return M
