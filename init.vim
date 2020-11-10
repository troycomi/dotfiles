" vim: foldmethod=marker

" vim plug {{{1
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins {{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/vim-plug'

Plug 'SirVer/ultisnips'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'google/vim-maktaba'
Plug 'gruvbox-community/gruvbox'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'

Plug 'snakemake/snakemake', {'rtp': 'misc/vim/'}

call plug#end()
" PlugUpdate to install/upgrade
" PlugClean to remove

" window navigation {{{1
set noequalalways
noremap <M-j> <c-w>j
noremap <M-k> <c-w>k
noremap <M-l> <c-w>l
noremap <M-h> <c-w>h

let g:tmux_navigator_no_mappings = 1

inoremap <silent> <M-j> <ESC> :TmuxNavigateDown<cr>
inoremap <silent> <M-k> <ESC> :TmuxNavigateUp<cr>
inoremap <silent> <M-l> <ESC> :TmuxNavigateRight<cr>
inoremap <silent> <M-h> <ESC> :TmuxNavigateLeft<cr>

nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>

tnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>

" general settings {{{1
let mapleader = ","
autocmd BufNewFile,BufRead * setlocal fo-=rot

" init.vim mappings
nnoremap <leader>v :edit $MYVIMRC<CR>
nnoremap <leader>V :source $MYVIMRC<CR>
nnoremap <leader>b :edit ~/.bashrc<CR>

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

set number relativenumber
set nowrap
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0

set hlsearch
set incsearch
set hidden
set laststatus=2   " Always show the statusline
" replace %% with current folder
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" cycle through tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" prepend searches with very magic
nnoremap / /\v
nnoremap ? ?\v

" control + L makes no highlight
nnoremap <silent> <C-l> :nohl<CR><C-l>
cnoremap <expr> noh getcmdtype() == ':' ? "NO NO NO" : 'noh'

highlight Folded ctermfg=White
set foldmethod=syntax
set foldcolumn=3
set colorcolumn=79

let g:python3_host_prog='/home/tcomi/miniconda3/bin/python'
set path+=**
set wildmenu
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
function! s:cFileEdit(filename)
    execute 'Tsrc ' . a:filename
    execute 'Vhead ' . a:filename
    execute 'Stest ' . a:filename
endfunction
command! -nargs=1 CE call s:cFileEdit(<f-args>)

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" terminal mappings {{{1
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
:highlight! TermCursorNC guibg=red guifg=white ctermbg=4 ctermfg=15

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

" NerdTREE setup {{{1
noremap <F2> :NERDTreeToggle<CR>
" Close if NerdTREE is only buffer left
augroup nerd_group
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" airline {{{1
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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

" macros {{{1
" add self at start of word
let @s='viwoiself.'
" paste and increment first letter
let @i='Yp'

" Setup syntax highlighting for Snakemake {{{1
augroup snake_syn
    autocmd!
    autocmd Filetype snakemake set tabstop=4 shiftwidth=4 commentstring=#\ %s
    autocmd Filetype snakemake syn keyword pythonBuiltinObj paths
    autocmd Filetype snakemake highlight link pythonBuiltinObj Identifier
    autocmd Filetype snakemake highlight link pythonBuiltinFunc Function
    autocmd Filetype snakemake highlight link pythonBuiltinType Structure
augroup end

" UtiliSnips {{{1
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" emmet vim {{{1
let g:user_emmet_leader_key='<leader>'
let g:user_emmet_install_global = 0
augroup emmet_group
    autocmd!
    autocmd FileType html,css,jinja.html setlocal tabstop=2 shiftwidth=2 | EmmetInstall
augroup END

" fzf {{{1
nnoremap <C-p> :Files<CR>

" gitgutter {{{1
nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" fugitive {{{1
command! Gconf Gvdiffsplit!
command! DGL diffget //2
command! DGR diffget //3

" ALE {{{1
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <silent> ]W <Plug>(ale_last)

" Inclusive syntax {{{1
augroup BlocklintALE
    autocmd!
    autocmd User ALEWantResults call BlocklintHook(g:ale_want_results_buffer)
augroup END

function! BlocklintHook(buffer) abort
    " Tell ALE we're going to check this buffer.
    call ale#other_source#StartChecking(a:buffer, 'blocklint')
    call ale#command#Run(a:buffer, 'blocklint -e --stdin',
                \ function('BlocklintWorkDone'), {'read_buffer': 1})
endfunction

function! BlocklintWorkDone(buffer, results, metadata) abort
    " Send results to ALE after they have been collected.
    let l:pattern = '\v^[^:]+:(\d+):(\d+):(\d+): (.+)$'
    let l:output = []
    for l:match in ale#util#GetMatches(a:results, l:pattern)
        call add(l:output, {
                    \ 'lnum': l:match[1],
                    \ 'col': l:match[2],
                    \ 'end_col': l:match[3],
                    \ 'text': l:match[4],
                    \ 'type': 'E'})
    endfor
    call ale#other_source#ShowResults(a:buffer, 'blocklint', l:output)
endfunction
