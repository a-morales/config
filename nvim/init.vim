filetype off

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'                                   " Tmux.conf syntax highlighting
Plug 'airblade/vim-gitgutter'
Plug 'gabesoft/vim-ags'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'mattn/emmet-vim'
Plug 'wellle/targets.vim'
Plug 'danro/rename.vim'
Plug 'W0ng/vim-hybrid'
Plug 'tpope/vim-sleuth'
Plug 'derekwyatt/vim-scala'
Plug 'christoomey/vim-sort-motion'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-abolish'
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-pug'
Plug 'Carpetsmoker/undofile_warn.vim'
Plug 'mbbill/undotree'
Plug 'reasonml-editor/vim-reason'

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'GEverding/vim-hocon'
Plug 'mxw/vim-jsx'
Plug 'exu/pgsql.vim'
Plug 'ap/vim-css-color'
Plug 'fleischie/vim-styled-components'

Plug 'w0rp/ale'

Plug 'carlitux/deoplete-ternjs'

call plug#end()

" Leader
let mapleader = " "

" Themes and Colors

set termguicolors
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

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
set backupcopy=yes
set noswapfile                    " it's 2013, Vim.
set undofile

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p", 0700)
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p", 0700)
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p", 0700)
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
map <leader>mk :!mkdir %%

map <leader>c "*y
map <leader>v "*p

map <leader>r :windo redraw!<cr>
map <leader>R :so $MYVIMRC<cr>

nmap <leader>a :Ags<Space>

nnoremap <leader>n :call NumberToggle()<cr>
nnoremap <leader>u :UndotreeToggle<cr>

" Plugin Settings

"indent line
let indentLine_char = '│'

" lighline functions
function! FugitiveLightLine()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
endfunction

let g:tender_lightline = 1
let g:lightline = {
  \ 'colorscheme': 'one',
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

let g:deoplete#enable_at_startup=1
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'file']

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

nnoremap <C-p> :Files<cr>
nnoremap <C-space> :Buffers<cr>

if has('linebreak')
  set breakindent
  let &showbreak = '↳'
  set cpo+=n
end

nmap =j :%!python -m json.tool<CR>:set filetype=json<CR>

set iskeyword-=/

let g:tex_conceal = ""

let g:jsx_ext_required = 0

let g:sql_type_default = 'pgsql'

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
