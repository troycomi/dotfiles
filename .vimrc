" vim: foldmethod=marker
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins here: {{{1
"
" plugins
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dense-analysis/ale'
Plugin 'kien/ctrlp.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'altercation/vim-colors-solarized'
Plugin 'crusoexia/vim-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-python/python-syntax'
Plugin 'lepture/vim-jinja'

" vim-scripts repos
Plugin 'desert256.vim'
Plugin 'bufkill.vim'
Plugin 'JavaScript-Indent'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chrisbra/csv.vim'
Plugin 'craigemery/vim-autotag'

Plugin 'https://github.com/snakemake/snakemake.git', {'rtp': 'misc/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" Colors {{{1
set t_Co=256 " 256 colors 
set background=dark
filetype on
syntax on " syntax highlighting
colorscheme monokai

" Basic Config {{{1
set number relativenumber       "Display line numbers"
set autoindent   "Always set auto-indenting on"
filetype plugin indent on
set expandtab    "Insert spaces instead of tabs in insert mode. Use spaces for indents"
set tabstop=4    "Number of spaces that a <Tab> in the file counts for"
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent"
set textwidth=0
let mapleader = "\<Space>"
set hlsearch

augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=10
    au InsertLeave * set timeoutlen=1000
augroup End

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" cycle through tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

autocmd BufNewFile * startinsert
highlight Folded ctermfg=White
set foldmethod=syntax
set foldcolumn=3
set colorcolumn=80

command! Shuf 2,$!shuf

set path+=**
set wildmenu


" Set Ctrl+movement for moving between windows {{{1
map j <c-w>j
map k <c-w>k
map l <c-w>l
map h <c-w>h

let g:tmux_navigator_no_mappings = 1

inoremap <silent> j <ESC> :TmuxNavigateDown<cr>
inoremap <silent> k <ESC> :TmuxNavigateUp<cr>
inoremap <silent> l <ESC> :TmuxNavigateRight<cr>
inoremap <silent> h <ESC> :TmuxNavigateLeft<cr>

nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> h :TmuxNavigateLeft<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

" Spell Check {{{1
set spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

let g:airline_theme='simple'
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024

" NerdTREE setup {{{1
"map <leader>n :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
" Close if NerdTREE is only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Easily open TaskList {{{1
map <leader>td <Plug>TaskList

" Setup Syntastic {{{1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"

let g:python_highlight_all = 1
let g:python_highlight_builtin_objs = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_yaml_checkers=['yamllint']
let g:syntastic_cpp_compiler_options=' -std=c++11'

map <leader>c :SyntasticCheck<CR>

function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors)+1, 10])
    endif
endfunction

" UtiliSnips {{{1
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Populate the g:airline_symbols dictionary with powerline symbols {{{1
let g:airline_powerline_fonts = 1

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

" Setup keyboard shortcut for Markdown preview {{{1
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'

" fastfold {{{1
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" python {{{1
let g:autotagCtagsCmd="ctags -R --python-kinds=-i"
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
let g:SimpylFold_docstring_preview = 1

augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonBuiltinObj self
augroup end

let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0

" other filetypes {{{1
let g:user_emmet_install_global = 0
autocmd FileType html,css,jinja.html set tabstop=2 | set shiftwidth=2 | EmmetInstall
let g:user_emmet_leader_key=','
inoremap jf <Esc>f>a
autocmd FileType yaml set tabstop=2 | set shiftwidth=2

" macros {{{1
" python docstring
let @c="o''''''O"
" join lines
let @j=':s/ \+$//eJr:noh'
" break args
let @a='0f,lr'
" add None return to end of line
let @n='$i -> None'
" remove space from blank line
let @b='cc'
" add self at start of word
let @s='viwoiself.'
" paste and increment first letter
let @i='Yp'
