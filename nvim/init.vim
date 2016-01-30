filety off

call plug#begin('~/.config/nvim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SwagKingTenK/VimSearch'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gabesoft/vim-ags'
Plug 'gorodinskiy/vim-coloresque'
Plug 'guns/vim-sexp'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'slim-template/vim-slim'
Plug 'szw/vim-ctrlspace'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'unblevable/quick-scope'
Plug 'wavded/vim-stylus'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'slim-template/vim-slim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'

call plug#end()

" Leader
let mapleader = " "

" Themes and Colors

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
colorscheme base16-ocean

" Settings
set list listchars=tab:→\ ,trail:·,extends:❯,precedes:❮
set list listchars=tab:→\ ,trail:·,extends:❯,precedes:❮
set backspace=indent,eol,start
set showmatch
set smarttab
set nrformats-=octal
set shiftround
set incsearch

set sidescrolloff=5
set display+=lastline
set autoread
set fileformats+=mac
set history=1000
set t_Co=256
set complete-=i
set laststatus=2
set ruler
set showcmd
set wildmenu
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set hlsearch
set autoindent
set smartindent
set showtabline=0
set cursorline
set splitright
set splitbelow
set hidden
set cmdwinheight=4
set tags=tags;/
set synmaxcol=256

if !empty(&viminfo)
  set viminfo^=!
endif

"custom functions

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" Auto Commands

" Resize vim when it is resized
au VimResized * :wincmd =

" Trim whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

au User AirlineAfterInit AirlineRefresh

" exit insert mode faster
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

"only show cursorline in current window in normal mode
augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END


set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Keyboard Shortcuts

"disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"go to matching brace
nnoremap <tab> %
vnoremap <tab> %

"allows vertical movements one row at a time instead of one line at a time
nnoremap j gj
nnoremap k gk

" Leader Shortcuts

"clear highlighted words from search
nnoremap <leader><space> :noh<cr>

"shortcuts to open edit window on current file path
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

map <leader>r :windo redraw!<cr>
map <leader>R :so $MYVIMRC<cr>

map <leader>G :GundoToggle<cr>

nmap <leader>coff :!coffee -p % \| less -p <C-r><C-w><CR>

nmap <leader>a :Ags<Space>

nnoremap <leader>n :call NumberToggle()<cr>

" Plugin Settings

"indent line
let indentLine_char = '│'

" airline options
let airline_powerline_fonts = 1
let g:airline_theme='gotham'
let g:tmuxline_preset='full'
let g:airline#extensions#tmuxline#enabled = 0

autocmd! BufWritePost * Neomake

"Marked stuff
:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

" lighline functions
function! FugitiveLightLine()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
endfunction

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ ['mode'], ['fugitive', 'filename', 'modified']],
  \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'component_function': {
  \   'fugitive': 'FugitiveLightLine'
  \ }
\}

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:ags_enable_async=1
let g:ags_winheight='30'

let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}
let g:fzf_layout = {'down': '~20%'}
let g:fzf_nvim_statusline = 0

nnoremap <C-p> :Files<cr>

if has('linebreak')
  set breakindent
  let &showbreak = '↳'
  set cpo+=n
end

nmap =j :%!python -m json.tool<CR>
