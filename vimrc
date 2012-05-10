" no clue what this does
set nocompatible

" use pathogen to load plugins from .vim/bundles
silent! call pathogen#runtime_append_all_bundles()

" enable syntax highlighting and file type detection
syntax enable
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set map leader to , instead of \
let mapleader = ","

"Nerd Tree commands and options
map <Leader>d :NERDTreeToggle<CR>

"Map fuzzy file find to ff
"cmap <leader>ff :FufFile **/<CR>
"nmap <leader>t :FufFile<CR>
"map <C-t> :FufFile <CR>
"map <C-x> :FufFile <CR>

" hit ,smr to reload snippets
nnoremap <leader>smr <esc>:exec ReloadAllSnippets()<cr>
let g:snippets_dir="~/.vim/snippets"

" remove the Windows line endings (^M)
map <Leader>m mz:%s/\r$//g<cr>`z

" comands to edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"map command numbers to tabs
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

map <D-j> <C-w>w
map <D-k> <C-w>W

" Colorscheme options
colorscheme default

" Other Options
set wildmode=longest,list,full
set wildmenu
set ruler
set nuw=4
set vb
set binary noeol
set backspace=indent,eol,start
set laststatus=2
set showmode
set showmatch
set ignorecase
"set smartindent
"set incsearch
set ignorecase smartcase
set ts=2
set et
set softtabstop=2
set sw=2
set nowrap
set hlsearch
set nobackup
set nowritebackup
set noswapfile
set list listchars=tab:\ \ ,trail:·
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" rvm status
set statusline+=%{rvm#statusline()} 

" toggle paste mode with F2
set pastetoggle=<F2>

" let's use ;w as a shortcut for :w
nnoremap ; :

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" code folding
"set foldnestmax=2
"autocmd FileType ruby  setlocal foldmethod=syntax foldlevel=1
"autocmd FileType css   setlocal foldmethod=indent shiftwidth=2 tabstop=2
"autocmd FileType eruby setlocal foldmethod=indent shiftwidth=2 tabstop=2

" set .sql to mysql
autocmd BufRead *.sql set filetype=mysql
autocmd BufRead *.clj set filetype=clojure
autocmd BufRead *.thor set filetype=ruby

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" syntastic warnings
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" gundo undo visualizer
nnoremap <F5> :GundoToggle<CR>

" this seems to fix rvm
set shell=/bin/sh

" auto-compile coffeescript files
"let coffee_compile_on_save = 1

" have :make run the test
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif
autocmd User Bundler
      \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif
