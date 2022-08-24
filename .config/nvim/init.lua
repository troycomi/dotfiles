-- https://www.notonlycode.org/neovim-lua-config/
-- https://github.com/rockerBOO/awesome-neovim
--[[
-- TODO
-- setup completion with nvim-cmp https://github.com/LunarVim/Neovim-from-scratch/tree/05-completion
--]]
require "user.plugins"

require "user.options"
require "user.autocmd"
require "user.keymaps"

--[[
Plug 'snakemake/snakemake', {'rtp': 'misc/vim/'}
Plug 'PrincetonUniversity/blocklint', {'rtp': 'integration/vim/'}

" general settings {{{1
autocmd BufNewFile,BufRead * setlocal fo-=rot

" replace %% with current folder

set path+=**
set wildmenu
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Spell Check {{{1
set spelllang=en_us
augroup spell_group
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.rst setlocal spell
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
    autocmd FileType gitcommit setlocal colorcolumn=72 textwidth=72
    autocmd FileType gitcommit setlocal fo +=t
augroup END

" folding {{{1
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = "·"
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

" file specific {{{1
augroup specifics_Group
    autocmd!
        autocmd Filetype python setlocal foldtext=NeatFoldText()
        autocmd Filetype python let g:semshi#mark_selected_nodes=0
        autocmd Filetype cpp setlocal commentstring=//\ %s
        autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
augroup end

" vim-surround {{{1

" macros {{{1
" add self at start of word
let @s='viwoiself.'
" paste and increment first letter
let @i='Yp'

" Setup syntax highlighting for Snakemake {{{1
augroup snake_syn
    autocmd!
    autocmd BufNewFile,BufRead *.snake set filetype=snakemake
    autocmd Filetype snakemake set tabstop=4 shiftwidth=4 commentstring=#\ %s
    autocmd Filetype snakemake syn keyword pythonBuiltinObj paths
    autocmd Filetype snakemake highlight link pythonBuiltinObj Identifier
    autocmd Filetype snakemake highlight link pythonBuiltinFunc Function
    autocmd Filetype snakemake highlight link pythonBuiltinType Structure
augroup end
--]]
