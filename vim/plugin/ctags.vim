
" ctags.vim - generate ctags at hopefully a good place and jump to tags
" Maintainer:   DaemonTsun
" Version:      1.0

" Generates a tags file at the root of a project, or at the first folder
" where a tags file is already located at.
" When used, it gets the location of the currently opened file and traverses
" up until it finds either a tags file, a CMakeLists.txt or a Makefile,
" and then calls ctags on all sources found in that directory.
function! GenerateCTags(...)
    let fname=expand('%:f') 
    let parent=fnamemodify(fname, ':p:h')
    let search_args='-type f -regextype posix-egrep -regex ".*\\.[ch](pp|xx)?" -not -regex ".*/(bin|build|binary|out|gen)-?(r|release|d|debug)?/.*"'

    let loop=1
    let found=0
    let append=0

    while loop
        if filereadable(parent . '/tags')
            let found=1
            let append=1
        elseif filereadable(parent . '/CMakeLists.txt') || filereadable(parent . '/Makefile')
            let found=1
            let append=0
        endif

        if found
            " TODO: figure out how the hell to add quotes around each file
            let files=join(systemlist('find "' . parent . '" ' . search_args), ' ')

            if append
                let cmd=system('ctags --append ' . files)
            else
                let cmd=system('ctags ' . files)
            endif

            echo cmd
            break
        endif
        
        let parent=fnamemodify(parent, ':h')

        if parent == '/'
            echoerr 'error: No suitable place found to place tags file for ' . fname
            break
        endif
    endwhile
endfunction

function! GoToDefinitionOfCurrentWord(...)
    let current_word = expand("<cword>")
    let show_list = get(a:, 0, 0)
    let cmd=':tag ' . current_word

    if show_list
        let cmd=':tselect ' . current_word
    endif

    try
        execute cmd
    catch
        " tag not found, try to generate tags & try again

        call GenerateCTags()
        execute cmd
    endtry
endfunction
