set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-perl/vim-perl'
Plugin 'wgibbs/vim-irblack'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'davidhalter/jedi-vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'JamshedVesuna/vim-markdown-preview'

" vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'desert256.vim'
Plugin 'bufkill.vim'
Plugin 'perl-support.vim'
Plugin 'JavaScript-Indent'
Plugin 'TaskList.vim'
Plugin 'sjl/gundo.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'https://bitbucket.org/johanneskoester/snakemake.git', {'rtp': 'misc/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
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

" Colors **********************************************************************
set t_Co=256 " 256 colors
set background=light
filetype on
syntax on " syntax highlighting
"let g:solarized_termcolors=256
"colorscheme desert256
colorscheme solarized

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

" Spell Check
set spelllang=en
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
"autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd FileType gitcommit setlocal spell

" Python Folding (should set this for only python files somehow)
"set foldmethod=indent
"set foldlevel=99

" Perl Folding
" let perl_fold=1

" NerdTREE setup
"map <leader>n :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['flake8']
let g:syntastic_perl_checkers=['perl']
let g:syntastic_enable_perl_checker = 1


" LatexBox Setup
let g:LatexBox_Folding=1

" Setup TT2HTML syntax for .tt2 files
autocmd BufNewFile,BufRead *.tt2 setf tt2html

" UltiSnips Trigger (works with YouCompleteMe)
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<F6>"
let g:snips_email="lparsons@princeton.edu"
let g:snips_github="https://github.com/lparsons"

" Populate the g:airline_symbols dictionary with powerline symbols
let g:airline_powerline_fonts = 1
" Fix wrapping statusline in iTerm
" set ambiwidth=double

" Setup syntax highlighting for Snakemake snakefiles
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

" Setup keyboard shortcut for Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
