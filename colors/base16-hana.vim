" Base16 Hana (https://github.com/chriskempson/base16)
" Scheme: Jon Q (http://jonquach.com)

" This enables the coresponding base16-shell script to run so that
" :colorscheme works in terminals supported by base16-shell scripts
" User must set this variable in .vimrc
"   let g:base16_shell_path=base16-builder/output/shell/
if !has('gui_running')
  if exists("g:base16_shell_path")
    execute "silent !/bin/sh ".g:base16_shell_path."/base16-hana.".&background.".sh"
  endif
endif

" GUI color definitions

let s:gui00 = "282c34"
let s:gui01 = "2c323c"

let s:gui02 = "4f5b66"
let s:gui03 = "65737e"
let s:gui04 = "a7adba"
let s:gui05 = "c0c5ce"
let s:gui06 = "dfe1e8"
let s:gui07 = "eff1f5"

let s:gui08 = "eff1f5"
let s:gui09 = "eff1f5"
let s:gui0A = "eff1f5"
let s:gui0B = "eff1f5"
let s:gui0C = "eff1f5"
let s:gui0D = "eff1f5"
let s:gui0E = "eff1f5"
let s:gui0F = "eff1f5"


" Light

let s:gui08Dark = "bfc1c4"
let s:gui09Dark = "bfc1c4"
let s:gui0ADark = "bfc1c4"
let s:gui0BDark = "bfc1c4"
let s:gui0CDark = "bfc1c4"
let s:gui0DDark = "bfc1c4"
let s:gui0EDark = "bfc1c4"
let s:gui0FDark = "bfc1c4"




" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

" Theme setup
hi clear
syntax reset

let g:colors_name = "base16-hana"

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . s:gui(a:guifg)
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfun

" Return GUI color for light/dark variants
fun s:gui(color)
  if &background == "dark"
    return a:color
  endif

  " Light
  if a:color == s:gui00
    return s:gui07
  elseif a:color == s:gui01
    return s:gui06
  elseif a:color == s:gui02
    return s:gui05
  elseif a:color == s:gui03
    return s:gui04
  elseif a:color == s:gui04
    return s:gui03
  elseif a:color == s:gui05
    return s:gui02
  elseif a:color == s:gui06
    return s:gui01
  elseif a:color == s:gui07
    return s:gui00
  elseif a:color == s:gui08
    return s:gui08Dark
  elseif a:color == s:gui09
    return s:gui09Dark
  elseif a:color == s:gui0A
    return s:gui0ADark
  elseif a:color == s:gui0B
    return s:gui0BDark
  elseif a:color == s:gui0C
    return s:gui0CDark
  elseif a:color == s:gui0D
    return s:gui0DDark
  elseif a:color == s:gui0E
    return s:gui0EDark
  elseif a:color == s:gui0F
    return s:gui0FDark
  endif

  return a:color
endfun

" Return terminal color for light/dark variants
fun s:cterm(color)
  if &background == "dark"
    return a:color
  endif

  " Light
  if a:color == s:cterm00
    return s:cterm07
  elseif a:color == s:cterm01
    return s:cterm06
  elseif a:color == s:cterm02
    return s:cterm05
  elseif a:color == s:cterm03
    return s:cterm04
  elseif a:color == s:cterm04
    return s:cterm03
  elseif a:color == s:cterm05
    return s:cterm02
  elseif a:color == s:cterm06
    return s:cterm01
  elseif a:color == s:cterm07
    return s:cterm00
  endif

  return a:color
endfun

" Vim editor colors
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:gui00, s:gui07, s:cterm00, s:cterm07, "", "")
call <sid>hi("ErrorMsg",      s:gui07, s:gui00, s:cterm07, s:cterm00, "", "")
call <sid>hi("Exception",     s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("FoldColumn",    s:gui0C, s:gui01, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:gui01, s:gui0D, s:cterm01, s:cterm0D, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("MatchParen",    s:gui00, s:gui03, s:cterm00, s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("MoreMsg",       s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "", "")

call <sid>hi("Search",        s:gui0F, s:gui02, s:cterm0F, s:cterm02,  "", "")

call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("Underlined",    s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("WarningMsg",    s:gui07, "", s:cterm07, "", "", "")

call <sid>hi("WildMenu",      s:gui0F, s:gui02, s:cterm0F, s:cterm02,  "", "")

call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "none", "")
call <sid>hi("Conceal",       s:gui0D, s:gui00, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")

call <sid>hi("StatusLine",    s:gui04, s:gui01, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")

call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("PMenu",         s:gui04, s:gui01, s:cterm04, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:gui01, s:gui0D, s:cterm01, s:cterm0D, "", "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:gui07, s:gui01, s:cterm07, s:cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:gui05, "", s:cterm05, "", "", "")

call <sid>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:gui05, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call <sid>hi("Type",         s:gui0A, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("csAttribute",             s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("csModifier",              s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",         s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",      s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",          s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("cssProp",           s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("cssFunctionName",   s:gui0E, "", s:cterm0E, "", "", "")
" call <sid>hi("cssAtRule",         s:gui05, "", s:cterm05, "", "", "")
" call <sid>hi("cssAtRuleLogical",  s:gui05, "", s:cterm05, "", "", "")
" call <sid>hi("cssMediaType",      s:gui05, "", s:cterm05, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:gui01,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitCommitOverflow",  s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("gitCommitSummary",   s:gui0B, "", s:cterm0B, "", "", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",               s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",         s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",         s:gui09, "", s:cterm09, "", "", "")

call <sid>hi("jsFrom"  ,                 s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsImport",                 s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsExport",                 s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsModuleAs",               s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsOperator",               s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("jsStorageClass",           s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsVariableDef",            s:gui0A, "", s:cterm0A, "", "", "")

call <sid>hi("jsArrowFunction",          s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsClassFuncName",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassKeyword",           s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsDecoratorFunction",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsDestructuringArray",     s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("jsDestructuringBlock",     s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("jsFuncName",               s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsObjectFuncName",         s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsStatement",              s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsString",                 s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("jsSwitchCase",             s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsVariableDef",            s:gui0A, "", s:cterm0A, "", "", "")

" One continued...




































" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
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

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "", "")

" SCSS highlighting
" call <sid>hi("scssAmpersand",               s:gui0B, "", s:cterm0B, "", "", "")
" call <sid>hi("scssAtRoot",                  s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("scssControl",                 s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("scssEachKeyword",             s:gui0E, "", s:cterm0E, "", "", "")
" call <sid>hi("scssElse",                    s:gui07, "", s:cterm07, "", "", "")
" call <sid>hi("scssExtend",                  s:gui07, "", s:cterm07, "", "", "")
" call <sid>hi("scssForKeyword",              s:gui07, "", s:cterm07, "", "", "")
" call <sid>hi("scssIf",                      s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("scssInclude",                 s:gui0E, "", s:cterm0E, "", "", "")
" call <sid>hi("scssInterpolationDelimiter",  s:gui0B, "", s:cterm0B, "", "", "")
" call <sid>hi("scssMixinName",               s:gui08, "", s:cterm08, "", "", "")
" call <sid>hi("scssReturn",                  s:gui07, "", s:cterm07, "", "", "")
" call <sid>hi("scssSelectorName",            s:gui06, "", s:cterm06, "", "", "")
" call <sid>hi("scssVariable",                s:gui0B, "", s:cterm0B, "", "", "")
" call <sid>hi("scssWhile",                   s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("scssImport",                  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("scssMixin",                   s:gui0E, "", s:cterm0E, "", "", "")
" Custom Override
" call <sid>hi("String",                      s:gui08, "", s:cterm08, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:gui07, s:gui01, s:cterm07, s:cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:gui00, "", s:cterm00, "undercurl", s:gui08)
call <sid>hi("SpellLocal",   "", s:gui00, "", s:cterm00, "undercurl", s:gui0C)
call <sid>hi("SpellCap",     "", s:gui00, "", s:cterm00, "undercurl", s:gui0D)
call <sid>hi("SpellRare",    "", s:gui00, "", s:cterm00, "undercurl", s:gui0E)

" Fix XML for JSX highlighting
call <sid>hi("Tag",         s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("xmlTag",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("xmlTagName",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("xmlEndTag",   s:gui0D, "", s:cterm0D, "", "", "")

" Remove functions
delf <sid>hi
delf <sid>gui
delf <sid>cterm

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F  s:gui08Dark  s:gui09Dark  s:gui0ADark  s:gui0BDark  s:gui0CDark  s:gui0DDark  s:gui0EDark  s:gui0FDark
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
