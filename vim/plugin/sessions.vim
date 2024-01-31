
" sessions.vim - save sessions depending on location where vim is started
" Maintainer:   DaemonTsun
" Version:      1.0

function! SanitizePath(pth)
    let tmp = substitute(a:pth, "_", "__", "g")
    let tmp = substitute(tmp, "/", "_", "g")
    let tmp = trim(tmp)
    return tmp
endfunction

function! SaveCurrentSession()
    let savepth=$HOME . "/.config/vim/sessions"
    let mkdircmd="mkdir -p " . savepth
    call system(mkdircmd)

    let fname=SanitizePath(system("pwd"))
    let cmd=":mksession! " . savepth . "/" . fname
    echo "Session saved"
    execute cmd
endfunction

function! TryLoadCurrentSession()
    if v:argv[-1] != "set termguicolors"
        return
    endif

    let savepth=$HOME . "/.config/vim/sessions"

    if !isdirectory(savepth)
        " echoerr "No sessions directory found"
        return
    endif

    let pwd=system("pwd")
    let fname=SanitizePath(pwd)
    let fullpath=savepth . "/" . fname
    
    if !filereadable(fullpath)
        " echoerr "No session file for " . pwd
        return
    endif

    let cmd=":source " . fullpath
    execute cmd
endfunction
