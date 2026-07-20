return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    local c = {
      bg = "#1d1f20",
      fg = "#abb2bf",
      red = "#e06c75",
      green = "#98c379",
      yellow = "#e5c07b",
      orange = "#d19a66",
      blue = "#61afef",
      cyan = "#56b6c2",
      purple = "#c678dd",
      comment = "#5c6370",
      cursor = "#528bff",
    }

    require("onedarkpro").setup({
      colors = { bg = c.bg, fg = c.fg },
      highlights = {
        -- comments
        Comment = { fg = c.comment, italic = true },
        ["@comment"] = { fg = c.comment, italic = true },

        -- functions
        ["@function"] = { fg = c.blue, italic = true },
        ["@function.call"] = { fg = c.blue, italic = true },
        ["@function.method"] = { fg = c.blue, italic = true },
        ["@function.method.call"] = { fg = c.blue, italic = true },
        ["@function.builtin"] = { fg = c.cyan },
        ["@constructor"] = { fg = c.yellow },

        -- keywords / storage
        ["@keyword"] = { fg = c.purple },
        ["@keyword.function"] = { fg = c.purple },
        ["@keyword.return"] = { fg = c.purple },
        ["@keyword.operator"] = { fg = c.purple },
        ["@keyword.import"] = { fg = c.yellow },
        ["@type.qualifier"] = { fg = c.purple },

        -- types
        ["@type"] = { fg = c.yellow, italic = true },
        ["@type.builtin"] = { fg = c.yellow, italic = true },
        ["@type.definition"] = { fg = c.yellow },

        -- strings
        ["@string"] = { fg = c.green },
        ["@string.regexp"] = { fg = c.green },
        ["@string.escape"] = { fg = c.green },

        -- numbers / constants
        ["@number"] = { fg = c.orange },
        ["@boolean"] = { fg = c.orange },
        ["@constant"] = { fg = c.orange },
        ["@constant.builtin"] = { fg = c.orange },
        ["@character"] = { fg = c.cyan },

        -- variables / properties
        ["@variable"] = { fg = c.fg },
        ["@variable.parameter"] = { fg = c.fg },
        ["@variable.member"] = { fg = c.orange },
        ["@property"] = { fg = c.orange },
        ["@variable.builtin"] = { fg = c.red },

        -- operators / punctuation
        ["@operator"] = { fg = c.cyan },
        ["@punctuation.delimiter"] = { fg = c.fg },
        ["@punctuation.bracket"] = { fg = c.fg },
        ["@punctuation.special"] = { fg = c.cyan },

        -- tags
        ["@tag"] = { fg = c.red },
        ["@tag.attribute"] = { fg = c.orange, italic = true },
        ["@tag.delimiter"] = { fg = c.fg },

        -- markdown
        ["@markup.heading"] = { fg = c.red },
        ["@markup.link.url"] = { fg = c.purple },
        ["@markup.link.label"] = { fg = c.blue },
        ["@markup.raw"] = { fg = c.cyan },
        ["@markup.strong"] = { bold = true },

        -- LSP semantic tokens
        ["@lsp.type.namespace"] = { fg = c.yellow, italic = true },
        ["@lsp.type.type"] = { fg = c.yellow, italic = true },
        ["@lsp.type.class"] = { fg = c.yellow, italic = true },
        ["@lsp.type.struct"] = { fg = c.yellow, italic = true },
        ["@lsp.type.interface"] = { fg = c.yellow, italic = true },
        ["@lsp.type.enum"] = { fg = c.yellow, italic = true },
        ["@lsp.type.typeParameter"] = { fg = c.yellow, italic = true },
        ["@lsp.type.function"] = { fg = c.blue, italic = true },
        ["@lsp.type.method"] = { fg = c.blue, italic = true },
        ["@lsp.type.property"] = { fg = c.orange },
        ["@lsp.type.parameter"] = { fg = c.fg },
        ["@lsp.type.variable"] = { fg = c.fg },
        ["@lsp.type.keyword"] = { fg = c.purple },
        ["@lsp.type.string"] = { fg = c.green },
        ["@lsp.type.number"] = { fg = c.orange },
        ["@lsp.type.enumMember"] = { fg = c.orange },
        ["@lsp.type.comment"] = { fg = c.comment, italic = true },
        ["@lsp.type.decorator"] = { fg = c.cyan },
        ["@lsp.type.macro"] = { fg = c.cyan },
        ["@lsp.type.operator"] = { fg = c.cyan },
        ["@lsp.type.modifier"] = { fg = c.purple, italic = true },
        ["@lsp.type.regexp"] = { fg = c.green },

        -- gopls modifiers
        ["@lsp.typemod.variable.readonly"] = { fg = c.orange },
        ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.orange, italic = true },
        ["@lsp.typemod.function.defaultLibrary"] = { fg = c.cyan, italic = true },
        ["@lsp.typemod.method.defaultLibrary"] = { fg = c.cyan, italic = true },
        ["@lsp.typemod.type.defaultLibrary"] = { fg = c.yellow, italic = true },

        -- neo-tree
        NeoTreeNormal = { fg = c.fg, bg = c.bg },
        NeoTreeNormalNC = { fg = c.fg, bg = c.bg },
        NeoTreeSignColumn = { bg = c.bg },
        NeoTreeDirectoryName = { fg = c.blue },
        NeoTreeDirectoryIcon = { fg = c.blue },
        NeoTreeRootName = { fg = c.purple, bold = true },
        NeoTreeFileNameOpened = { fg = c.fg, bold = true },
        NeoTreeDotfile = { fg = c.comment },
        NeoTreeGitAdded = { fg = c.green },
        NeoTreeGitDeleted = { fg = c.red },
        NeoTreeGitModified = { fg = c.yellow },
        NeoTreeGitRenamed = { fg = c.cyan },
        NeoTreeGitStaged = { fg = c.green },
        NeoTreeGitUntracked = { fg = c.green },
        NeoTreeGitUnstaged = { fg = c.yellow },
        NeoTreeGitConflict = { fg = c.purple },
        NeoTreeGitIgnored = { fg = c.comment },
        NeoTreeIgnored = { fg = c.comment },
        NeoTreeIndentMarker = { fg = "#3b4048" },
        NeoTreeWinSeparator = { fg = "#181a1f", bg = c.bg },
        NeoTreeCursorLine = { bg = "#2c313a" },

        SnacksPickerGitStatusUntracked = { fg = "#98c379" },
      },
      options = { cursorline = true, transparency = false },
    })

    vim.cmd.colorscheme("onedark")
    vim.api.nvim_set_hl(0, "Cursor", { bg = c.cursor })
  end,
}
