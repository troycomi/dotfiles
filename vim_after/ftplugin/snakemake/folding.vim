function! MarkdownFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^rule') >= 0
        return ">1"
    elseif match(thisline, '^def') >= 0
        return ">1"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()

function! MarkdownFoldText()
    let foldsize = (v:foldend-v:foldstart)
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=MarkdownFoldText()
