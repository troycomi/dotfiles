function! SnakemakeFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^\(rule\|def\)') >= 0
        return ">1"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=SnakemakeFolds()
