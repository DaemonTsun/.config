set mouse=a
set number
set cursorline
set inccommand=nosplit " really not a fan of this

GuiTabline 0
GuiScrollBar 1

colorscheme nvim-summerfruit

" TODO: save font settings to file and autoload / save
let s:font = "Iosevka SS02"
let s:fontsize = 15
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
