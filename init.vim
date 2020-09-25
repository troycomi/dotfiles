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
Plug 'crusoexia/vim-monokai'
Plug 'dense-analysis/ale'
Plug 'google/vim-maktaba'
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

colorscheme monokai

set number relativenumber
set shiftround
set nowrap
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0

set hlsearch
set incsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set laststatus=2   " Always show the statusline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"
" cycle through tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

highlight Folded ctermfg=White
set foldmethod=syntax
set foldcolumn=3
set colorcolumn=79

let g:python3_host_prog='/home/tcomi/miniconda3/bin/python'
set path+=**
set wildmenu
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" terminal mappings {{{1
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
:highlight! TermCursorNC guibg=red guifg=white ctermbg=4 ctermfg=15

" Spell Check {{{1
set spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit setlocal colorcolumn=72 textwidth=72
autocmd FileType gitcommit setlocal fo +=t

" NerdTREE setup {{{1
noremap <F2> :NERDTreeToggle<CR>
" Close if NerdTREE is only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
autocmd Filetype python setlocal foldtext=NeatFoldText()
augroup python
    autocmd!
    autocmd FileType python syn keyword pythonBuiltinObj self
        autocmd Filetype python let g:semshi#mark_selected_nodes=0
        autocmd Filetype cpp setlocal commentstring=//\ %s
augroup end


" macros {{{1
" add self at start of word
let @s='viwoiself.'
" paste and increment first letter
let @i='Yp'

" Setup syntax highlighting for Snakemake snakefiles {{{1
au BufNewFile,BufRead Snakefile let b:python_highlight_all = 1 | set syntax=python syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.rules let b:python_highlight_all = 1 | set syntax=python syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snakefile let b:python_highlight_all = 1 | set syntax=python syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snake let b:python_highlight_all = 1 | set syntax=python syntax=snakemake filetype=snakemake

augroup snake_syn
    autocmd!
        autocmd Syntax snakemake syn keyword pythonBuiltinObj paths
augroup end

" UtiliSnips {{{1
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" emmet vim {{{1
let g:user_emmet_leader_key='<leader>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,jinja.html EmmetInstall

" fzf {{{1
nnoremap <C-p> :Files<CR>

" gitgutter {{{1
nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" ALE {{{1
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <silent> ]W <Plug>(ale_last)

