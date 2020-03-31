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

Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'crusoexia/vim-monokai'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'

Plug 'https://github.com/snakemake/snakemake.git', {'rtp': 'misc/vim/'}

call plug#end()
" PlugUpdate to install/upgrade
" PlugClean to remove

" window navigation {{{1
map <M-j> <c-w>j
map <M-k> <c-w>k
map <M-l> <c-w>l
map <M-h> <c-w>h

let g:tmux_navigator_no_mappings = 1

inoremap <silent> <M-j> <ESC> :TmuxNavigateDown<cr>
inoremap <silent> <M-k> <ESC> :TmuxNavigateUp<cr>
inoremap <silent> <M-l> <ESC> :TmuxNavigateRight<cr>
inoremap <silent> <M-h> <ESC> :TmuxNavigateLeft<cr>

nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>

" other settings {{{1
let mapleader = ","
set fo-=ro

" init.vim mappings
nmap <leader>v :tabedit $MYVIMRC<CR>
autocmd bufwritepost init.vim source $MYVIMRC

colorscheme monokai

set number relativenumber
set expandtab
set tabstop=4 shiftwidth=4 textwidth=0

set hlsearch
set incsearch
set hidden
set laststatus=2   " Always show the statusline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"
" cycle through tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

highlight Folded ctermfg=White
set foldmethod=syntax
set foldcolumn=3
set colorcolumn=80

set path+=**
set wildmenu

" Spell Check {{{1
set spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" NerdTREE setup {{{1
map <F2> :NERDTreeToggle<CR>
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
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 foldtext=NeatFoldText()
augroup python
    autocmd!
    autocmd FileType python syn keyword pythonBuiltinObj self
augroup end

autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" macros {{{1
" add self at start of word
let @s='viwoiself.'
" paste and increment first letter
let @i='Yp'

" Setup syntax highlighting for Snakemake snakefiles {{{1
au BufNewFile,BufRead Snakefile set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake filetype=snakemake

augroup snake_syn
    autocmd!
        autocmd Syntax snakemake syn keyword pythonBuiltinObj paths
        autocmd Syntax snakemake set tabstop=4 | set shiftwidth=4
augroup end

" UtiliSnips {{{1
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" emmet vim {{{1
let g:user_emmet_leader_key='<leader>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,jinja.html setlocal tabstop=2 shiftwidth=2 | EmmetInstall

" fzf {{{1
nnoremap <C-p> :Files<CR>

" gitgutter {{{1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
