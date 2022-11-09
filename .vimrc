set encoding=utf-8

" turn off vi compat
set nocompatible
fixdel
" syntax highlighting
syntax on
" show line numbers
set number
set relativenumber
set showtabline=2
set tabpagemax=15

" detect filetype
filetype on
" load indent file for filetype
filetype indent on
" enable plugins for filetype
filetype plugin on

" highlight cursor line underneath the cursor horizontally.
" set cursorline
" highlight cursor line underneath the cursor vertically.
" set cursorcolumn
hi CursorLine term=reverse cterm=reverse
hi CursorColumn term=reverse cterm=reverse
hi CursorLineNr term=reverse cterm=reverse

" while searching though a file incrementally highlight matching characters as you type.
set incsearch
" ignore capital letters during search.
set ignorecase
" override the ignorecase option if searching for capital letters.
set smartcase
" use highlighting when doing a search.
set hlsearch
" show matching words during a search.
set showmatch

" set shift width to 4 spaces.
set shiftwidth=4
" set tab width to 4 columns.
set tabstop=4
" use space characters instead of tabs.
set expandtab

" enable auto completion menu after pressing TAB.
set wildmenu
" wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" disable redraw on certain actions like macros.
set lazyredraw
" show partial command you type in the last line of the screen.
set showcmd

" set tabs to default to below and right
set splitbelow
set splitright

" set the chars to show with list

set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
set showbreak=\\ " [bonus]
" set listchars=eol:¬
" set listchars+=space:·
" set listchars+=trail:·
" set listchars+=nbsp:◇
" set listchars+=tab:→-
" set listchars+=extends:▸
" set listchars+=precedes:◂
" set showbreak=↪\

" allow backspacing over autoindent, line breaks, start of insert
set backspace=indent,eol,start

" folding
set foldenable
set foldlevelstart=10
set foldmethod=indent

" mouse input
set mouse=a

" colours
" colorscheme elflord

" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" clear the currently highlighted options
nnoremap <leader><space> :nohlsearch<CR>

" fold/unfold
nnoremap <space> za

nnoremap <F6> :call ToggleRuler()<CR>
nnoremap <F8> :call ToggleList()<CR>

nnoremap <F7> :ALEFix<CR>
nnoremap <F9> :tabp<CR>
nnoremap <F10> :tabn<CR>

nnoremap <F5> :so $MYVIMRC<CR>

" splitting down up right left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" comment out current line in normal and visual modes
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" counts the words in the current file
let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction

" turns visibility on for control characters like ^I for tab and $ for line ending
function ToggleList()
    set list!
endfunction

" turns the ruler on and off at the bottom which shows current position and wordcount
let s:enabled = 1
function! ToggleRuler()
    if s:enabled
            set laststatus=0
            let s:enabled=0
    else
        set laststatus=2
        let s:enabled=1
    endif
endfunction

" turn line and column lines on
function ToggleCrosshair()
    set cursorline!
    set cursorcolumn!
endfunction

" turn line numbers on and off
function ToggleNumber()
    set number!
endfunction

" install plug.vim
function InstallPlug()
    :!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    PlugInstall
endfunction

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

set statusline = 
" anything ese we want in the status line should go here
set statusline+=%<\ %=%-14.(words:%{WordCount()},\ path:%f\ lc:%l,%c%V%)\ %P

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

" plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" declare the list of plugins.

Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    if has('python') || has('python3')
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
        Plug 'roxma/vim-hug-neovim-rpc'    
    endif
endif
let g:deoplete#enable_at_startup = 1



" list ends here. plugins become visible to Vim after this call.
call plug#end()

" }}}

" LANGUAGES -------------------------------------------------------------- {{{

" rust
let g:ale_fixers = {"rust": ['rustfmt']}
let g:ale_linters = {"rust": ['cargo', 'rls']}
let g:ale_rust_rls_toolchain = 'stable'

" }}}
