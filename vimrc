" don't want no vi support
set nocompatible

" using vundle to load all plugins
if filereadable(expand("~/.vim/plug"))
  source ~/.vim/plug
endif

" enable syntax highlighting and file type detection

" fix colors in gnome-terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" ---------------------------------------------------------------------------
" BASIC SETTINGS
" ---------------------------------------------------------------------------

" Colorscheme options
colorscheme daves-tomorrow-transparent

" Other Options
set wildmode=longest,list,full
set wildmenu
set ruler
set nuw=4
set number
set backspace=indent,eol,start
set laststatus=2
set showmode
set showmatch
set ignorecase
set ignorecase smartcase
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set nowrap
set hlsearch
set nobackup
set nowritebackup
set noswapfile
set list listchars=tab:··,trail:·
set autoread
set splitright
set splitbelow
set showcmd
set textwidth=100
set modeline
set nojoinspaces

" toggle paste mode with F2
set pastetoggle=<F2>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Have ctrl-c behave the same as esc. This ensures that when leaving insert mode via ctrl-c that
" behaves the same as esc, triggers the same events, etc
" Also, it fixes a weird quirk where ale causes the cursor to jump back one char caused by
" https://github.com/dense-analysis/ale/issues/4605
imap <C-c> <Esc>

" --------------------------------------------------------------------------
" CUSTOM AUTOCMDS
" --------------------------------------------------------------------------

augroup vimrcEx
  " clear all autocmds in the group
  autocmd!

  " go to the last cursor position in the file
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  autocmd FileType ruby setlocal sw=2 sts=2 ts=2
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2
  autocmd FileType javascript setlocal sw=2 sts=2

augroup END

" ---------------------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------------------

" turn on vim-airline
let g:airline_powerline_fonts = 1

" set the snippets directory
let g:snippets_dir="~/.vim/snippets"

" map Ctrl-p to FzF Files
nmap <C-P> :Files<CR>

" turn on rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_conf = {'separately': {'nerdtree': 0}} " don't use on nerdtree window

" ignore pyc files
let NERDTreeIgnore = ['\.pyc$', '_site', '__pycache__']
set wildignore+=*.pyc,*/_site/**,*/__pycache__/**

let g:html_indent_inctags = "p,li"

" fix strange escape char sequences that appear with devicons and vim-airline
" https://github.com/ryanoasis/vim-devicons/issues/359
set t_RV=

let g:ale_fixers = {"python": ["black", "isort", "ruff", "ruff_format"]}
let g:ale_virtualtext_cursor=0
highlight ALEWarning ctermbg=17
" let g:ale_fix_on_save = 1

" ---------------------------------------------------------------------------
" MAPPINGS
" ---------------------------------------------------------------------------

" use arrow keys to navigate splits
nnoremap <silent> <Right> <c-w>l
nnoremap <silent> <Left> <c-w>h
nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j

" Set map leader to , instead of \
let mapleader = ","

" Show vim-which-key after timeout
nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>

" Nerd Tree commands and options
map <Leader>d :NERDTreeToggle<CR>

" remove the Windows line endings (^M)
map <Leader>m mz:%s/\r$//g<cr>`z

" get rid of highlighting
noremap <silent> <c-l> :noh<cr><c-l>

" run ALEFix
map <Leader>f :ALEFix<CR>


" ---------------------------------------------------------------------------
" SPELLING
" ---------------------------------------------------------------------------

map <Leader>s :setlocal spell! spelllang=en_us<cr>
iab defintion definition
iab Defintion Definition
iab enviornment environment
iab Enviornment Environment
iab fitler filter
iab Fitler Filter
iab teh the
iab Teh The

" spell check git commit messages and markdown
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
