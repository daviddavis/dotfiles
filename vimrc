" no clue what this does
set nocompatible

" using vundle to load all plugins
if filereadable(expand("~/.vundle"))
  source ~/.vundle
endif

" enable syntax highlighting and file type detection
syntax enable
filetype plugin indent on

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
set list listchars=tab:··,trail:·
set autoread
set splitright
set splitbelow
set showcmd
set textwidth=79

" toggle paste mode with F2
set pastetoggle=<F2>

" let's use ;w as a shortcut for :w
nnoremap ; :

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" set the line numbers to darkgray
"hi LineNr guifg=#3D3D3D guibg=black gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE

" hightlight cursor
highlight Cursor guifg=white guibg=black

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

  " FILE TYPES
  autocmd BufRead *.sql set filetype=mysql
  autocmd BufRead *.clj set filetype=clojure
  autocmd BufRead *.thor set filetype=ruby

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

  " markdown
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off
  autocmd FileType python setlocal sw=4 sts=4 et
  autocmd FileType python let g:syntastic_mode_map['mode'] = "passive"
  autocmd FileType javascript setlocal sw=4 sts=4 et

  " automatically update ctags
  function! UpdateCtags()
    if filereadable("tags") && strpart(expand("%"), 0, len(getcwd())) == expand("%")
      execute "silent! !ctags -a " . expand("%:p")
    endif
  endfunction

  augroup ctags
    autocmd!
    autocmd BufWritePost * call UpdateCtags()
  augroup END

  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

augroup END

" ---------------------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------------------

" set the snippets directory
let g:snippets_dir="~/.vim/snippets"

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

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" gundo undo visualizer
nnoremap <F5> :GundoToggle<CR>

" this seems to fix rvm
set shell=/bin/sh

" auto-compile coffeescript files
"let coffee_compile_on_save = 1

" use symbols in powerline
let g:Powerline_symbols = 'fancy'

" set ctrlp results to a higher number
let g:ctrlp_max_height = 35

" turn on rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ignore pyc files
let NERDTreeIgnore = ['\.pyc$']
set wildignore+=*.pyc

" vimux settings
let g:VimuxUseNearestPane = 1

" turn off python code folding
let g:pymode_folding = 0
" ignore errors for gettext's _ function
let g:pymode_lint_ignore = "E501"
let g:pymode_lint_cwindow = 0

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

"Nerd Tree commands and options
map <Leader>d :NERDTreeToggle<CR>

" remove the Windows line endings (^M)
map <Leader>m mz:%s/\r$//g<cr>`z

" 1.8 -> 1.9 hash syntax
map <silent> <Leader>h :Bashrockets<CR>
map <silent> <Leader>oh :Hashrockets<CR>
nmap <C-h> :Bashrockets<CR>

" comands to edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" showmarks toggle
map <Leader>sm <Leader>mt

" hit ,smr to reload snippets
nnoremap <leader>smr <esc>:exec ReloadAllSnippets()<cr>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" get rid of highlighting
noremap <silent> <c-l> :noh<cr><c-l>

" splitjoin
noremap <silent> <leader>sjs :SplitjoinSplit<CR>
noremap <silent> <leader>sj :SplitjoinJoin<CR>

" tabularize
noremap <silent> <leader>a, :Tab/,<CR>
noremap <silent> <leader>a= :Tab/=<CR>
noremap <silent> <leader>a: :Tab/:\zs<CR>
noremap <silent> <leader>a{ :Tab/{<CR>
noremap <silent> <leader>ah :Tab/=><CR>

" CommandT shortcut
map <C-p> :CommandTFlush<CR>:CommandT<CR>

" vimux/turbux mappings
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vc :CloseVimTmuxPanes<CR>
map <Leader>vi :VimuxInterruptRunner<CR>
vmap <silent> <LocalLeader>vs "vy :call RunVimTmuxCommand(@v)<CR>

" buffergator shortcuts
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

" gundo shortcut
map <leader>g :GundoToggle<CR>
