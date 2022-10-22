" source_header_swap.vim - swap between header and source files
" Maintainer:   DaemonTsun
" Version:      1.3

function! SourceHeaderSwap(...)
    let fname=expand('%:r') 
    let ext=expand('%:e')
    let is_cpp = 0

    let cppexts = ['c', 'cpp', 'cc', 'cxx']
    let hppexts = ['h', 'hpp', 'hxx']

    if index(cppexts, ext) != -1
        let is_cpp = 1
    elseif index(hppexts, ext) != -1
        let is_cpp = 0
    else
        return
    endif

    let swap_ext = ''

    if is_cpp
        for hppex in hppexts
            if filereadable(fname . '.' . hppex)
                let swap_ext = hppex
            endif
        endfor

        if swap_ext == ''
            let swap_ext = 'hpp'
        endif
    else
        for cppex in cppexts
            if filereadable(fname . '.' . cppex)
                let swap_ext = cppex
            endif
        endfor

        if swap_ext == ''
            let swap_ext = 'cpp'
        endif
    endif

    let current_word = expand("<cword>")
    let do_search = get(a:, 0, 0)

    try
        execute 'edit' fname . '.' . swap_ext

        if exists("current_word") && do_search
            let w = search(current_word)
        endif
    endtry

endfunction
