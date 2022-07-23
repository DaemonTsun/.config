" source_header_swap.vim - swap between header and source files
" Maintainer:   DaemonTsun
" Version:      1.1

fu! SourceHeaderSwap()
    " TODO: make this smarter, e.g. see if files exist
    let fname=expand('%:r') 
    let ext=expand('%:e')

    if ext == "cpp"
        let ext = "hpp"
    elseif ext == "hpp"
        let ext = "cpp"
    else
        return
    endif

    execute 'edit' fname . "." . ext
endfunction
