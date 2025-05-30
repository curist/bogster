if version > 580
    hi clear
    if exists('syntax_on')
        syntax reset
    endif
endif

let g:colors_name='bogster'

let g:bogster_colors = {
  \ "base0"        : ["#161c23", 233],
  \ "base1"        : ["#232d38", 235],
  \ "base2"        : ["#313f4e", 237],
  \ "base3"        : ["#415367", 239],
  \ "base4"        : ["#536984", 240],
  \ "base5"        : ["#627d9d", 241],
  \ "base6"        : ["#9ea4c2", 247],
  \ "base7"        : ["#b6b6c9", 249],
  \ "base8"        : ["#cbc7d0", 250],
  \ "fg0"          : ["#c6b8ad", 251],
  \ "fg1"          : ["#e5ded6", 253],
  \ "red"          : ["#d32c5d", 204],
  \ "lred"         : ["#dc597f", 211],
  \ "orange"       : ["#dc7759", 209],
  \ "dyellow"      : ["#A58023", 136],
  \ "yellow"       : ["#dcb659", 221],
  \ "green"        : ["#57a331", 118],
  \ "lgreen"       : ["#7fdc59", 120],
  \ "dblue"        : ["#1e758d", 31],
  \ "blue"         : ["#36b2d4", 80],
  \ "lblue"        : ["#59dcd8", 86],
  \ "purp"         : ["#b759dc", 171],
  \ "pink"         : ["#dc59c0", 206],
  \ "teal"         : ["#23a580", 36],
  \ "lteal"        : ["#59dcb7", 50],
  \ "none"         : ["NONE", "NONE"]
  \ }

if (&background ==# 'light')
    let g:bogster_colors["fg0"] = g:bogster_colors["base1"]
    let g:bogster_colors["fg1"] = g:bogster_colors["base0"]
    let g:bogster_colors["base0"] = ["#f6fbd6", 230]
    let g:bogster_colors["base1"] = ["#c7c7ba", 187]
    let g:bogster_colors["base2"] = ["#aaaa97", 144]
    let g:bogster_colors["blue"] = ["#289cbc", 38]
endif

" if doesn't support termguicolors or < 256 colors exit
if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

"########################################
" Terminal colors for NeoVim

if has('nvim')
    let g:terminal_color_0 = g:bogster_colors["base0"][0]
    let g:terminal_color_8 = g:bogster_colors["base3"][0]

    let g:terminal_color_1 = g:bogster_colors["red"][0]
    let g:terminal_color_9 = g:bogster_colors["lred"][0]

    let g:terminal_color_2 = g:bogster_colors["green"][0]
    let g:terminal_color_10 = g:bogster_colors["lgreen"][0]

    let g:terminal_color_3 = g:bogster_colors["orange"][0]
    let g:terminal_color_11 = g:bogster_colors["yellow"][0]

    let g:terminal_color_4 = g:bogster_colors["blue"][0]
    let g:terminal_color_12 = g:bogster_colors["lblue"][0]

    let g:terminal_color_5 = g:bogster_colors["purp"][0]
    let g:terminal_color_13 = g:bogster_colors["pink"][0]

    let g:terminal_color_6 = g:bogster_colors["teal"][0]
    let g:terminal_color_14 = g:bogster_colors["lteal"][0]

    let g:terminal_color_7 = g:bogster_colors["fg0"][0]
    let g:terminal_color_15 = g:bogster_colors["fg1"][0]
endif

" Terminal colors for Vim
if exists('*term_setansicolors')
    let g:terminal_ansi_colors = repeat([0], 16)

    let g:terminal_ansi_colors[0] = g:bogster_colors["base0"][0]
    let g:terminal_ansi_colors[8] = g:bogster_colors["base3"][0]

    let g:terminal_ansi_colors[1] = g:bogster_colors["red"][0]
    let g:terminal_ansi_colors[9] = g:bogster_colors["lred"][0]

    let g:terminal_ansi_colors[2] = g:bogster_colors["green"][0]
    let g:terminal_ansi_colors[10] = g:bogster_colors["lgreen"][0]

    let g:terminal_ansi_colors[3] = g:bogster_colors["orange"][0]
    let g:terminal_ansi_colors[11] = g:bogster_colors["yellow"][0]

    let g:terminal_ansi_colors[4] = g:bogster_colors["blue"][0]
    let g:terminal_ansi_colors[12] = g:bogster_colors["lblue"][0]

    let g:terminal_ansi_colors[5] = g:bogster_colors["purp"][0]
    let g:terminal_ansi_colors[13] = g:bogster_colors["pink"][0]

    let g:terminal_ansi_colors[6] = g:bogster_colors["teal"][0]
    let g:terminal_ansi_colors[14] = g:bogster_colors["lteal"][0]

    let g:terminal_ansi_colors[7] = g:bogster_colors["fg0"][0]
    let g:terminal_ansi_colors[15] = g:bogster_colors["fg1"][0]
endif

"########################################
" funcs

function! s:__hl(group, guifg, ...)
    " Arguments: group, guifg, guibg, style

    let fg = g:bogster_colors[a:guifg]

    if a:0 >= 1
        let bg = g:bogster_colors[a:1]
    else
        let bg = g:bogster_colors["none"]
    endif

    if a:0 >= 2
        let style = a:2
    else
        let style = "NONE"
    endif

    let hi_str = [ "hi", a:group,
            \ 'guifg=' . fg[0], "ctermfg=" . fg[1],
            \ 'guibg=' . bg[0], "ctermbg=" . bg[1],
            \ 'gui=' . style, "cterm=" . style
            \ ]

    execute join(hi_str, ' ')
endfunction

"########################################
" clear any previous highlighting and syntax

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

"########################################
" set the colors

if (&background ==# 'light')
    call s:__hl("BogsterLRed", "red")
    call s:__hl("BogsterRed", "red")
    call s:__hl("BogsterRedUnder", "red", "none", "undercurl")
    call s:__hl("BogsterRedBold", "red", "none", "bold")
    call s:__hl("BogsterOrange", "orange")
    call s:__hl("BogsterYellow", "dyellow")
    call s:__hl("BogsterYellowBold", "dyellow", "none", "bold")
    call s:__hl("BogsterLTeal", "teal")
    call s:__hl("BogsterTeal", "teal")
    call s:__hl("BogsterLBlue", "blue")
    call s:__hl("BogsterBlue", "dblue")
    call s:__hl("BogsterBlueItalic", "dblue", "none", "italic")
    call s:__hl("BogsterBlueUnder", "dblue", "none", "underline")
    call s:__hl("BogsterLGreen", "green")
else
    call s:__hl("BogsterLRed", "lred")
    call s:__hl("BogsterRed", "red")
    call s:__hl("BogsterRedUnder", "red", "none", "undercurl")
    call s:__hl("BogsterRedBold", "red", "none", "bold")
    call s:__hl("BogsterOrange", "orange")
    call s:__hl("BogsterYellow", "yellow")
    call s:__hl("BogsterYellowBold", "yellow", "none", "bold")
    call s:__hl("BogsterLTeal", "lteal")
    call s:__hl("BogsterTeal", "teal")
    call s:__hl("BogsterLBlue", "lblue")
    call s:__hl("BogsterBlue", "blue")
    call s:__hl("BogsterBlueItalic", "blue", "none", "italic")
    call s:__hl("BogsterBlueUnder", "blue", "none", "underline")
    call s:__hl("BogsterLGreen", "lgreen")
endif


call s:__hl("BogsterBase0", "base0")
call s:__hl("BogsterBase1", "base1")
call s:__hl("BogsterBase2", "base2")
call s:__hl("BogsterBase3", "base3")
call s:__hl("BogsterBase4", "base4")
call s:__hl("BogsterBase5", "base5")
call s:__hl("BogsterBase6", "base6")
call s:__hl("BogsterFg0", "fg0")
call s:__hl("BogsterFg1", "fg1")
call s:__hl("BogsterFg1Bold", "fg1", "none", "bold")
call s:__hl("BogsterFg1Under", "fg1", "none", "underline")
call s:__hl("BogsterUnder", "none", "none", "underline")
call s:__hl("BogsterBold", "none", "none", "bold")
call s:__hl("BogsterItalic", "none", "none", "italic")

call s:__hl("Cursor", "fg0", "none", "reverse")
call s:__hl("iCursor", "base0", "lred")
call s:__hl("vCursor", "base0", "purp")
call s:__hl("CursorColumn", "none", "base1")
call s:__hl("CursorLine", "none", "base1")
call s:__hl("CursorLineNr", "lblue", "base2")
call s:__hl("DiffAdd", "green", "base0")
call s:__hl("DiffChange", "yellow", "base0")
call s:__hl("DiffDelete", "lred", "base0")
call s:__hl("ErrorMsg", "red", "base0")
call s:__hl("ErrorMsgInverse", "base0", "red")
call s:__hl("WarningMsg", "orange", "base0")
call s:__hl("WarningMsgInverse", "base0", "orange")
call s:__hl("InfoMsgInverse", "base0", "lblue")
call s:__hl("InfoMsg", "lblue", "base0")
call s:__hl("HintMsgInverse", "base0", "teal")
call s:__hl("HintMsg", "teal", "base0")
call s:__hl("Error", "none", "lred")
call s:__hl("Folded", "fg0", "base1")
call s:__hl("MatchParen", "none", "base3")
call s:__hl("Normal", "fg1", "base0")
call s:__hl("Pmenu", "fg0", "base1")
call s:__hl("PmenuSel", "fg0", "base2")
call s:__hl("Search", "base0", "orange")
call s:__hl("SignColumn", "none", "base0")
call s:__hl("StatusLine", "fg1", "base3")
call s:__hl("StatusLineNC", "base0", "base2")
call s:__hl("Todo", "fg0", "base0")
call s:__hl("VertSplit", "base1", "base1")
call s:__hl("Visual", "none", "none", "reverse")

"########################################
" links

hi! link Special BogsterLGreen
hi! link Boolean Number
hi! link Character Constant
hi! link Comment BogsterBase5
hi! link Ignore BogsterBase5
hi! link Conceal Ignore
hi! link Conditional Statement
hi! link Constant BogsterLTeal
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter BogsterOrange
hi! link Directory BogsterLBlue
hi! link Exception Statement
hi! link Float Number
hi! link FunctionDef Function
hi! link Function BogsterLBlue
hi! link Identifier BogsterFg1
hi! link Include PreProc
hi! link IncSearch Search
hi! link Keyword BogsterYellow
hi! link Label BogsterBlue
hi! link LibraryFunc Function
hi! link LibraryIdent Identifier
hi! link Type BogsterLRed
hi! link LibraryType Type
hi! link LineNr BogsterBase3
hi! link LocalFunc Function
hi! link LocalIdent Identifier
hi! link LocalType Type
hi! link Macro PreProc
hi! link ModeMsg BogsterFg0
hi! link MoreMsg BogsterFg0
hi! link MsgArea Title
hi! link Noise Delimiter
hi! link NonText BogsterBase3
hi! link NonText Ignore
hi! link Number BogsterBlue
hi! link Operator BogsterOrange
hi! link PreCondit PreProc
hi! link PreProc BogsterOrange
hi! link Question BogsterFg0
hi! link Quote StringDelimiter
hi! link Repeat Statement
hi! link Searchlight Search
hi! link SignifySignAdd Signify
hi! link SignifySignChange Signify
hi! link SignifySignDelete Signify
hi! link Special BogsterLGreen
hi! link SpecialChar Special
hi! link Statement BogsterYellow
hi! link StatusLineTermNC StatusLineNC
hi! link StatusLineTerm StatusLine
hi! link StorageClass Statement
hi! link String Constant
hi! link StringDelimiter String
hi! link Structure Statement
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine
hi! link TabLine StatusLineNC
hi! link Tag Special
hi! link Terminal Normal
hi! link Title BogsterFg0
hi! link Todo BogsterRedBold
hi! link Underlined BogsterBlueUnder
hi! WinSeparator guibg=NONE guifg=#273340


" buftabline
hi! link BufTabLineCurrent Pmenu
hi! link BufTabLineActive PmenuSel


" Tree-sitter highlighting groups
" Text
hi! link @text Normal
hi! link @text.strong BogsterFg1Bold
hi! link @text.emphasis BogsterBlueItalic
hi! link @text.underline BogsterFg1Under
hi! link @text.title Title
hi! link @text.literal String
hi! link @text.uri BogsterBlueUnder
hi! link @text.reference Identifier

" Comments
hi! link @comment Comment
hi! link @comment.error ErrorMsg
hi! link @comment.warning WarningMsg

" Punctuation
hi! link @punctuation.bracket Delimiter
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.special Delimiter

" Constants
hi! link @constant Constant
hi! link @constant.builtin Special
hi! link @constant.macro Define

" Strings
hi! link @string String
hi! link @string.escape SpecialChar
hi! link @string.regexp String " Fallback, consider defining BogsterPurp or similar if distinct color desired

" Characters
hi! link @character Character
hi! link @character.special SpecialChar

" Numbers & Booleans
hi! link @number Number
hi! link @boolean Boolean
hi! link @float Float

" Functions
hi! link @function Function
hi! link @function.builtin LibraryFunc
hi! link @function.call Function
hi! link @function.macro Macro
hi! link @method Function
hi! link @method.call Function

" Types & Classes
hi! link @constructor Type
hi! link @class Type " Using Type for classes as well
hi! link @type Type
hi! link @type.builtin Type
hi! link @type.definition Typedef
hi! link @storageclass StorageClass

" Identifiers
hi! link @parameter Identifier
hi! link @variable Identifier
hi! link @variable.builtin Special
hi! link @property BogsterTeal " Or link to Identifier if BogsterTeal is not suitable

" Keywords
hi! link @keyword Keyword
hi! link @keyword.function Keyword
hi! link @keyword.operator Operator
hi! link @keyword.return Statement

" Operators
hi! link @operator Operator

" Modules & Includes
hi! link @namespace BogsterLGreen " Mapped to a Special-like color
hi! link @include Include
hi! link @preproc PreProc

" Tags (HTML/XML)
hi! link @tag Tag
hi! link @tag.attribute BogsterOrange " Color for attribute names
hi! link @tag.delimiter Delimiter

" Control Flow
hi! link @conditional Conditional
hi! link @exception Exception
hi! link @repeat Repeat
hi! link @label Label

" Misc
hi! link @error Error
hi! link @todo Todo


" C

hi! link cInclude PreProc
hi! link cIncluded Directory
hi! link cSpecial BogsterLGreen
hi! link cRepeat Keyword
hi! link cLabel BogsterOrange
hi! link cConstant BogsterLBlue


" NeoVim LSP
hi! link DiagnosticHint HintMsg
hi! link DiagnosticWarn WarnMsg
hi! link DiagnosticError ErrorMsg
hi! link DiagnosticInfo InfoMsg

hi! link LspDiagnosticsDefaultError ErrorMsg
hi! link LspDiagnosticsDefaultWarning WarningMsg
hi! link LspDiagnosticsDefaultInformation InfoMsg
hi! link LspDiagnosticsDefaultHint HintMsg
hi! link LspDiagnosticsError LspDiagnosticsDefaultError
hi! link LspDiagnosticsWarning LspDiagnosticsDefaultWarning
hi! link LspDiagnosticsInformation LspDiagnosticsDefaultInformation
hi! link LspDiagnosticsHint LspDiagnosticsDefaultHint
hi! link LspDiagnosticsSignError ErrorMsgInverse
hi! link LspDiagnosticsSignWarning WarningMsgInverse
hi! link LspDiagnosticsSignInformation InfoMsgInverse
hi! link LspDiagnosticsSignHint HintMsgInverse

hi! link DiagnosticUnderlineError BogsterRedUnder
hi! link DiagnosticUnderlineWarn BogsterYellowBold
hi! link DiagnosticUnderlineInfo BogsterBlueUnder
hi! link DiagnosticUnderlineHint BogsterBase5

" diff

hi! link diffAdded DiffAdd
hi! link diffBDiffer WarningMsg
hi! link diffChanged DiffChange
hi! link diffCommon WarningMsg
hi! link diffDiffer WarningMsg
hi! link diffFile Directory
hi! link diffIdentical WarningMsg
hi! link diffIndexLine Number
hi! link diffIsA WarningMsg
hi! link diffNoEOL WarningMsg
hi! link diffOnly WarningMsg
hi! link diffRemoved DiffDelete

" Git commit

hi! link gitcommitHeader Todo
hi! link gitcommitOverflow Error
hi! link gitcommitSummary Title

" HTML
hi! link htmlTag Operator
hi! link htmlEndTag htmlTag
hi! link htmlSpecialChar Special

" JavaScript

hi! link jsArrowFunction Operator
hi! link jsFunction Keyword
hi! link jsOperatorKeyword Keyword
hi! link jsGlobalObjects BogsterLRed
hi! link jsSpecial Special
hi! link jsExport BogsterLRed

" markdown

hi! link markdownH1 BogsterYellowBold
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownLinkText BogsterRedUnder
hi! link markdownUrl BogsterLBlue
hi! link markdownBold BogsterFg1Bold
hi! link markdownCode Quote
hi! link markdownHeadingRule Operator
hi! link markdownHeadingDelimiter Operator
hi! link markdownCodeDelimiter Operator
hi! link markdownListMarker Operator

" shell
hi! link shVariable BogsterFg1
hi! link shAlias shVariable
hi! link shDeref BogsterLRed
hi! link shConditional Keyword
hi! link shStatement Keyword
hi! link shSet Keyword
hi! link shSetList Normal
hi! link shQuote Quote
hi! link shSnglCase Operator
hi! link shTestOpr Operator
hi! link shVarAssign Operator
hi! link shEscape BogsterLGreen
hi! link shOption Keyword
hi! link shDblBrace Operator
hi! link shSpecial shEscape
hi! link shSpecialDQ shSpecial
hi! link shSpecialSQ shSpecial

