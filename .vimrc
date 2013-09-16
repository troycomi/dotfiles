set nocompatible               " be iMproved
filetype on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-perl/vim-perl'
Bundle 'wgibbs/vim-irblack'
Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
"Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-markdown'
"Bundle 'klen/python-mode'
"Bundle 'LaTeX-Box-Team/LaTeX-Box'
"Bundle 'msanders/snipmate.vim'
Bundle 'SirVer/ultisnips'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'LaTeX-Box-Team/LaTeX-Box'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'desert256.vim'
Bundle 'bufkill.vim'
Bundle 'perl-support.vim'
Bundle 'JavaScript-Indent'
Bundle 'TaskList.vim'
Bundle 'sjl/gundo.vim'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...
"Bundle 'git://repo.or.cz/vcscommand.git'

filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" Colors **********************************************************************
set t_Co=256 " 256 colors
set background=dark
filetype on
syntax on " syntax highlighting
"let g:solarized_termcolors=256
colorscheme desert256

set number       "Display line numbers"
set autoindent   "Always set auto-indenting on"
set smartindent
set expandtab    "Insert spaces instead of tabs in insert mode. Use spaces for indents"
set tabstop=4    "Number of spaces that a <Tab> in the file counts for"
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent"
set textwidth=0

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4	

" Set Ctrl+movement for moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Python Folding (should set this for only python files somehow)
set foldmethod=indent
set foldlevel=99

" Perl Folding
" let perl_fold=1

" NerdTREE setup
map <leader>n :NERDTreeToggle<CR>
" Close if NerdTREE is only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Easily open TaskList
map <leader>td <Plug>TaskList

" Easily open Gundo window
" map <leader>g :GundoToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Setup Syntastic 
let g:syntastic_python_checkers=['flake8']

" LatexBox Setup
let g:LatexBox_Folding=1
