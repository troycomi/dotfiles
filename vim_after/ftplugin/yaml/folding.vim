function! YamlFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^\a') >= 0
        return ">1"
    else if match(thisline, '^  \a') >= 0
        return ">2"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=YamlFolds()
