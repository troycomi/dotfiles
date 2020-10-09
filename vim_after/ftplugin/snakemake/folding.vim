function! SnakemakeFolds(lnum)
    let thisline = getline(v:lnum)

    if thisline =~? '\v^\s*$'
        return '-1'
    endif

    if thisline =~? '^\(rule\|def\)'
        return ">1"
    else
        return "="
    endif

endfunction
setlocal foldmethod=expr
setlocal foldexpr=SnakemakeFolds(v:lnum)
