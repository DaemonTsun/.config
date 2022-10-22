" source_header_swap.vim - swap between header and source files
" Maintainer:   DaemonTsun
" Version:      1.1

fu! SourceHeaderSwap()
    " TODO: make this smarter, e.g. see if files exist
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
    execute 'edit' fname . '.' . swap_ext

    let ln = search(current_word)

    if ln > -1
        execute ln
    endif
endfunction
