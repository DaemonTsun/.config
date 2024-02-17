
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" tab swapping with alt
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
inoremap <A-1> <ESC>1gt
inoremap <A-2> <ESC>2gt
inoremap <A-3> <ESC>3gt
inoremap <A-4> <ESC>4gt
inoremap <A-5> <ESC>5gt
inoremap <A-6> <ESC>6gt
inoremap <A-7> <ESC>7gt
inoremap <A-8> <ESC>8gt
inoremap <A-9> <ESC>9gt

" whoops this doesnt make sense: nnoremap <C-w> :q<CR>
" inoremap <C-w> <ESC>:q<CR>

" sessions
set sessionoptions=blank,buffers,folds,globals,localoptions,options,resize,tabpages,winpos,winsize
autocmd UIEnter  * :call TryLoadCurrentSession()
autocmd VimLeave * :call SaveCurrentSession()
