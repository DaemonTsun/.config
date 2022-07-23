set number
set cursorline

GuiTabline 0
GuiScrollBar 1

colorscheme nvim-summerfruit

let s:font = "Iosevka SS02"
let s:fontsize = 13
let s:fontweight = 25

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! " . s:font . ":h" . s:fontsize . ":w" .s:fontweight
endfunction

call AdjustFontSize(0)

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
