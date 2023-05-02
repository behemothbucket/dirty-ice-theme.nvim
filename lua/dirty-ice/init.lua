local M = {}

local p = require('dirty-ice.palette')

local highlight_groups = {
  --Main
  Normal                     = { fg = p.white_m1, bg = p.black_p1, },
  NormalNC                   = { link = "Normal" },
  MsgArea                    = { fg = p.grey, bg = p.black_p1 },
  NormalFloat                = { link = "Normal" },
  Bold                       = { bold = true },
  Italic                     = { italic = true },
  Underlined                 = { underline = true },
  Visual                     = { fg = "NONE", bg = p.todo_bg },
  Directory                  = { fg = p.white_m1, bold = true },
  IncSearch                  = { link = "@text.todo" },
  Search                     = { link = "IncSearch" },
  Substitute                 = { link = "IncSearch" },
  MatchParen                 = { fg = p.red, bg = p.black_p1, underline = true },
  ModeMsg                    = { fg = p.main, bg = p.black_p1 },
  MoreMsg                    = { link = "Normal" },
  WarningMsg                 = { fg = p.yellow, bg = p.black_p1 },
  FloatBorder                = { fg = p.snow, bg = p.black_p1 },
  NonText                    = { fg = p.grey, bg = p.black_p1 },
  LineNr                     = { bg = p.black_p1, fg = p.grey_p2 },
  LineNrAbove                = { link = "LineNr" },
  LineNrBelow                = { link = "LineNr" },
  CursorLine                 = { fg = "NONE", bg = p.black_p2 },
  CursorLineNr               = { fg = p.grey_p1, bg = "NONE" },
  StatusLine                 = { fg = p.main, bg = p.black_p2 },
  WinSeparator               = { fg = p.grey, bg = "NONE" },
  SignColumn                 = { bg = p.black_p1 },
  Colorcolumn                = { link = "StatusLine" },
  TabLineSel                 = { fg = p.main, bg = p.black_p1 },
  Pmenu                      = { fg = p.main, bg = p.black_p1 },
  PmenuSel                   = { bg = p.todo_bg },
  PmenuThumb                 = { bg = p.grey },
  PmenuSbar                  = { link = "PmenuThumb" },
  Conceal                    = { link = "Operator" },
  Title                      = { link = "Pmenu" },
  Question                   = { link = "Normal" },
  WildMenu                   = { link = "Pmenu" },
  Folded                     = { fg = p.grey },
  FoldColumn                 = { link = "Folded" },
  Error                      = { fg = p.red },
  ErrorMsg                   = { link = "Error" },
  -- Spelling
  SpellBad                   = { underline = true },
  SpellLocal                 = { underline = true },
  SpellCap                   = { underline = true },
  SpellRare                  = { underline = true },
  -- Syntax
  Boolean                    = { link = "String" },
  Character                  = { link = "Normal" },
  Comment                    = { fg = p.grey_p1 },
  Conditional                = { link = "Keyword" },
  Constant                   = { link = "Type" },
  Define                     = { link = "Keyword" },
  Delimiter                  = { fg = p.grey },
  Float                      = { link = "Number" },
  Function                   = { fg = p.snow },
  Identifier                 = { fg = p.grey_p3 },
  Include                    = { link = "PreProc" },
  Keyword                    = { fg = p.main },
  Label                      = { link = "String" },
  Number                     = { link = "Identifier" },
  Operator                   = { link = "@variable" },
  PreProc                    = { fg = p.grey },
  Repeat                     = { link = "Keyword" },
  Special                    = { link = "Keyword" },
  SpecialChar                = { link = "String" },
  SpecialComment             = { link = "SpecialChar" },
  Statement                  = { link = "Type" },
  StorageClass               = { link = "Keyword" },
  String                     = { fg = p.green },
  Structure                  = { link = "Type" },
  Tag                        = { link = "SpecialChar" },
  Todo                       = { fg = p.todo_fg, bg = p.todo_bg },
  Type                       = { fg = p.hospital },
  Typedef                    = { link = "Type" },
  ["@text.todo"]             = { fg = "#4ba8ff", bg = p.todo_bg },
  ["@text.note"]             = { fg = "#ff57ff", bg = p.note_bg },
  ["@text.warning"]          = { fg = "#ff9900", bg = p.yellow },
  ["@text.danger"]           = { fg = "#ff8b64", bg = p.red },
  ["@text.uri"]              = { fg = p.snow, underline = true },
  ["@unchecked_list_item"]   = { link = "normal" },
  ["@checked_list_item"]     = { fg = p.grey, strikethrough = true },
  ["@text.todo.unchecked"]   = { link = "@unchecked_list_item" },
  ["@text.todo.checked"]     = { link = "@checked_list_item" },
  ["@keyword"]               = { link = "Keyword" },
  ["@function"]              = { link = "Function" },
  ["@method"]                = { link = "Function" },
  ["@field"]                 = { link = "Identifier" },
  ["@constructor"]           = { link = "Function" },
  ["@repeat"]                = { link = "Repeat" },
  ["@label"]                 = { link = "String" },
  ["@variable"]              = { link = "Variable" },
  ["@type"]                  = { link = "Type" },
  ["@type.builtin"]          = { link = "Keyword" },
  ["@constant"]              = { link = "Type" },
  ["@variable.builtin"]      = { link = "Type" },
  ["@operator"]              = { link = "@variable" },
  ["@punctuation.special"]   = { link = "Specialchar" },
  ["@punctuation.bracket"]   = { link = "Normal" },
  ["@conditional"]           = { link = "Conditional" },
  ["@exception"]             = { link = "Exception" },
  -- Diff
  DiffAdd                    = { fg = "NONE", bg = p.green },
  DiffAdded                  = { fg = p.green, bg = "NONE" },
  DiffChange                 = { fg = "NONE", bg = p.yellow },
  DiffChanged                = { fg = p.yellow, bg = "NONE" },
  DiffDelete                 = { fg = "NONE", bg = p.red },
  DiffRemoved                = { fg = p.red, bg = "NONE" },
  DiffText                   = { fg = p.green, bg = "NONE", bold = true },
  -- Telescope
  TelescopeSelection         = { bg = p.grey_m1 },
  TelescopeSelectionCaret    = { link = "TelescopeSelection" },
  TelescopeMatching          = { fg = p.white, bold = true },
  --Git
  GitSignsAdd                = { fg = p.green, bg = "NONE" },
  GitSignsChange             = { fg = p.yellow, bg = "NONE" },
  GitSignsDelete             = { fg = p.red, bg = "NONE" },
  --Diagnostic
  DiagnosticSignError        = { fg = p.red, bg = "NONE" },
  DiagnosticSignWarn         = { fg = p.yellow, bg = "NONE" },
  DiagnosticSignHint         = { fg = p.grey, bg = "NONE" },
  DiagnosticSignInfo         = { fg = p.todo_fg, bg = "NONE" },
  DiagnosticError            = { link = "DiagnosticSignError" },
  DiagnosticWarn             = { link = "DiagnosticSignWarn" },
  DiagnosticHint             = { link = "DiagnosticSignHint" },
  DiagnosticInfo             = { link = "DiagnosticSignInfo" },
  --Languages
  ["@css.property_name"]     = { fg = p.snow },
  ["@c.primitive_type"]      = { link = "@type" },
  ["@c.function_identifier"] = { link = "@variable" },
  --Scheme icon
  DevIconScheme              = { fg = p.red },
  --Oil
  OilDir                     = { link = "Directory" },
  --Mason
  MasonHeader                = { link = "StatusLine" },
}

function M.setup()
  vim.cmd('hi clear')

  vim.o.background = 'dark'
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'dirty-ice'

  local hi = vim.api.nvim_set_hl

  for name, style in pairs(highlight_groups) do hi(0, name, style) end
end

return M
