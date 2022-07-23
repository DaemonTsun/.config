" vi:syntax=vim

" GUI color definitions
let s:brightpink   = "FFE7FF"
let s:blue		   = "0000FF"
let s:lightblue	   = "AAAAFF"
let s:lightestgray = "EEEEEE"
let s:white        = "FFFFFF"
let s:lightergray  = "E0E0E0"
let s:lightgray    = "D0D0D0"
let s:gray         = "B0B0B0"
let s:black        = "000000"
let s:gui05        = "101010"
let s:gui06        = "151515"
let s:gui07        = "202020"
let s:gui08        = "FF0086"
let s:orange        = "FD8900"
let s:mustard      = "ABA800"
let s:gui0B        = "00C918"
let s:gui0C        = "1FAAAA"
let s:gui0D        = "3777E6"
let s:gui0E        = "AD00A1"
let s:gui0F        = "CC6633"

" Terminal color definitions
let s:cterm00        = "00"
let s:cterm03        = "08"
let s:cterm05        = "07"
let s:cterm07        = "15"
let s:cterm08        = "01"
let s:cterm0A        = "03"
let s:cterm0B        = "02"
let s:cterm0C        = "06"
let s:cterm0D        = "04"
let s:cterm0E        = "05"

if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01        = "18"
  let s:cterm02        = "19"
  let s:cterm04        = "20"
  let s:cterm06        = "21"
  let s:cterm09        = "16"
  let s:cterm0F        = "17"
else
  let s:cterm01        = "10"
  let s:cterm02        = "11"
  let s:cterm04        = "12"
  let s:cterm06        = "13"
  let s:cterm09        = "09"
  let s:cterm0F        = "14"
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "nvim-summerfruit-light"

" Highlighting function
function! g:Base16hi(group, guifg, guibg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfunction


fun! <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        s:gui05, s:white, s:cterm05, s:cterm00, "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:white, s:gui08, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:white, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:gui0C, s:lightergray, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:gray, s:lightergray, s:cterm03, s:cterm01, "", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:gray, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:black, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:black, "", s:cterm0B, "", "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Search",        s:white, s:lightblue, s:cterm01, s:cterm0A,  "", "")
call <sid>hi("IncSearch",     s:white, s:orange, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Substitute",    s:white, s:mustard, s:cterm01, s:cterm0A, "none", "")
call <sid>hi("SpecialKey",    s:gray, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:lightergray, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     "", s:lightergray, "", s:cterm02, "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:gui08, s:mustard, s:cterm08, "", "", "")
call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "none", "")
call <sid>hi("Conceal",       s:gui0D, s:white, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:white, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:gray, "", s:cterm03, "", "", "")
call <sid>hi("LineNr",        s:gray, s:white, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:gray, s:lightergray, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:black, s:brightpink, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:black, s:lightergray, "", "", "none", "")
call <sid>hi("VertSplit",     s:lightgray, s:lightgray, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:lightergray, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:lightergray, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:lightestgray, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:black, s:lightergray, s:cterm04, s:cterm01, "", "")
call <sid>hi("QuickFixLine",  "", s:lightergray, "", s:cterm01, "none", "")
call <sid>hi("PMenu",         s:gui05, s:lightergray, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:lightergray, s:gui05, s:cterm01, s:cterm05, "", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:orange, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:gui0D, "", "", "", "", "")
call <sid>hi("Conditional",  s:blue, "", "", "", "bold", "")
call <sid>hi("Constant",     s:orange, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:gui0E, "", "", "", "bold", "")
call <sid>hi("Float",        s:orange, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:gui0C, "", "", "", "none", "")
call <sid>hi("Include",      s:gui0E, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:blue, "", "", "", "bold", "")
call <sid>hi("Label",        s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:gui08, "", "", "", "", "")
call <sid>hi("Operator",     s:gui0D, "", "", "", "none", "")
call <sid>hi("PreProc",      s:gui0E, "", "", "", "", "")
call <sid>hi("Repeat",       s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:gui0E, "", "", "", "bold", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:gui0F, "", s:cterm08, "", "none", "")
call <sid>hi("StorageClass", s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:gui08, "", "", "", "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:mustard, s:lightergray, s:cterm0A, s:cterm01, "", "")
call <sid>hi("Type",         s:gui0B, "", "", "", "bold", "")
call <sid>hi("Typedef",      s:mustard, "", "", "", "", "")

" Haskell highlighting
call <sid>hi("haskellDeclKeyword", s:gui0B, "", "", "", "bold", "")
call <sid>hi("haskellWhere", s:gui0B, "", "", "", "bold", "")
call <sid>hi("haskellLet", s:gui0B, "", "", "", "bold", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:lightergray,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:gray, s:lightergray,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:gui08, s:lightergray,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:gui0D, s:lightergray,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:gui0B, s:white,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:gui08, s:white,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:gui0B, s:white,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:gui0D, s:white,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:gui08, s:white,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        s:gray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:gray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:gray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:gray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:orange, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:gui0B, "", s:cterm0B, "", "bold", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  s:orange, "", s:cterm09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsStatement",         s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsReturn",            s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsThis",              s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("jsClassDefinition",   s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("jsFunction",          s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsFuncName",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsFuncCall",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassFuncName",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassMethodType",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsRegexpString",      s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("jsGlobalObjects",     s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("jsExceptions",        s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("jsBuiltins",          s:mustard, "", s:cterm0A, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("mailURL",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("mailEmail",    s:gui0D, "", s:cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:gui05, s:white, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonInclude",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonStatement", s:gui0E, "", s:cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:mustard, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:lightergray, s:cterm0B, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:gui0D, s:lightergray, s:cterm0D, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:gui08, s:lightergray, s:cterm08, s:cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "", "", "undercurl", s:gui08)
call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", s:gui0C)
call <sid>hi("SpellCap",     "", "", "", "", "undercurl", s:gui0D)
call <sid>hi("SpellRare",    "", "", "", "", "undercurl", s:gui0E)

" Startify highlighting
call <sid>hi("StartifyBracket",  s:gray, "", s:cterm03, "", "", "")
call <sid>hi("StartifyFile",     s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("StartifyFooter",   s:gray, "", s:cterm03, "", "", "")
call <sid>hi("StartifyHeader",   s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("StartifyNumber",   s:orange, "", s:cterm09, "", "", "")
call <sid>hi("StartifyPath",     s:gray, "", s:cterm03, "", "", "")
call <sid>hi("StartifySection",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("StartifySelect",   s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("StartifySlash",    s:gray, "", s:cterm03, "", "", "")
call <sid>hi("StartifySpecial",  s:gray, "", s:cterm03, "", "", "")

" nvim
call <sid>hi("TabLineFill",  s:black, s:white, s:white, "", "none", "")
call <sid>hi("TabLine",  s:black, s:brightpink, s:white, "", "none", "")
call <sid>hi("TabLineSel",  s:black, s:white, s:white, "", "standout", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:white s:lightergray s:lightgray s:gray  s:black  s:gui05  s:gui06  s:gui07  s:gui08  s:orange s:mustard  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
