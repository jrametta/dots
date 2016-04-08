set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins go here

Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'pearofducks/ansible-vim'
Plugin 'mhinz/vim-startify'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" colorschemes
Plugin 'whatyouhide/vim-gotham'
Plugin 'marcopaganini/termschool-vim-theme'
Plugin 'morhetz/gruvbox'




" Plugin 'tpope/vim-fugitive'
" Plugin 'szw/vim-ctrlspace'
" set hidden

call vundle#end()
filetype plugin indent on

" a listtle vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

colorscheme termschool
"colorscheme gruvbox
"colorscheme molokai
"colorscheme gotham256

" let g:rehash256 = 1

syntax enable
" set shell=sh
"set bg=dark
" set mouse=a
" set ruler
" set shiftwidth=4
" set textwidth=110
" set smarttab
" set smartindent --- what ware the differences between all of these?


match ErrorMsg '\s\+$'  " show trailing whitspace
highlight ErrorMsg ctermbg=darkgreen guibg=lightgreen

set noshowmode          " Hide the default mode text
set formatoptions-=or 	" disable auto comment
set number		        " line numbering
set cursorline		    " highlight current line
set showmatch           " highlight matching [{()}]

set incsearch           " highlight search as you type
set ignorecase          " obvious
set smartcase           " case sensitive if uppercase
set hlsearch            " highlight searches
set wildmenu            " visual autocomplete for command menu

set tabstop=4 		    " number of spaces a tab counts for when opening
set softtabstop=4	    " number of spaces a tab counts for when editing
set expandtab

nnoremap tn  :tabnext<CR>
nnoremap tp  :tabprev<CR>
nnoremap tc	 :tabnew<CR>


"  move up and down one line even if line wraps
nnoremap j gj
nnoremap k gk

nmap <leader>q :nohlsearch<CR>
nmap <leader>l :setlocal number!<CR>
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>s :set spell!<CR>
" remove trailing whitespace
nmap <leader>c :%s/\s\+$//e<CR>
nmap <leader>[ :bp<CR>
nmap <leader>] :bn<CR>
" paste	toggle
nmap <silent> <F2> :set paste!<CR>:set nopaste?<CR>
nnoremap <Leader>v :set cursorline! cursorcolumn!<CR>
" set colorcolumn=85
nnoremap <leader>V :set colorcolumn=85<CR> colorcolumn=0<CR>


" plugin configurations
"
" gundo (visual undo tree)
nnoremap <leader>u :GundoToggle<CR>

" MiniBufExpl
map <leader>e :MBEToggle<cr>
map <leader>dd :MBEbd 
map <leader>b :buffer  
hi MBEVisibleActiveNormal  ctermfg=white
hi MBEVisibleActiveChanged ctermfg=red
hi MBEVisibleNormal  ctermfg=green
hi MBENormal ctermfg=grey
hi MBEVisibleChanged ctermfg=yellow

" NERDTree
nmap <silent> <F4> :NERDTreeToggle<CR>

"" Airline plugin
set laststatus=2
let g:airline_powerline_fonts = 1
" show or remove buffer/tab line
let g:airline#extensions#tabline#enabled = 0
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='base16_codeschool'
"let g:airline_theme='gruvbox'
"let g:airline_theme='base16'
"let g:airline_theme='base16_ocean'


"" Powerline status line plugin
set t_Co=256
"set encoding=utf-8 " Necessary to show Unicode glyphs
"set laststatus=2
""let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
"" let g:Powerline_theme = 'solarized256'
"" let g:Powerline_colorscheme = 'solarized256'

" supertab options
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" jedi vim options
let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"

"  language specific autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType yaml setlocal tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2
    autocmd FileType yaml setlocal softtabstop=2
augroup END


" puppets
au BufRead,BufNewFile *.pp
   \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
   \ nmap <F8> :!rspec --color %<CR>
" ansible
au BufRead,BufNewFile *.j2
   \ set filetype=j2

" some adjusted colors
hi WarningMsg ctermfg=red ctermbg=black
"hi CursorLine   cterm=NONE ctermbg=235
hi CursorLine   cterm=NONE ctermbg=236

" vim folds
"setlocal foldmethod=indent
"setlocal foldignore=
"set foldnestmax=2
"set fdl=1

" keep code block after indentation
vnoremap < <gv
vnoremap > >gv
