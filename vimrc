" no clue what this does
set nocompatible

" using vundle to load all plugins
if filereadable(expand("~/.neobundle"))
  source ~/.neobundle
endif

" enable syntax highlighting and file type detection
syntax enable

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
set modeline

" toggle paste mode with F2
set pastetoggle=<F2>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


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
  autocmd FileType javascript setlocal sw=4 sts=4 et

augroup END

" ---------------------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------------------

" set the snippets directory
let g:snippets_dir="~/.vim/snippets"

" syntastic warnings
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0

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
set wildignore+=*.pyc,*.rabl

" vimux settings
let g:VimuxUseNearestPane = 1

" turn off python code folding
let g:pymode_folding = 0
" ignore errors for gettext's _ function
let g:pymode_lint_ignore = "E501"
let g:pymode_lint_cwindow = 0

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': ['python'] }

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['yellow',      'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

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

" let 2x's' save
map ss :w<CR>

"Nerd Tree commands and options
map <Leader>d :NERDTreeToggle<CR>

" remove the Windows line endings (^M)
map <Leader>m mz:%s/\r$//g<cr>`z

" 1.8 -> 1.9 hash syntax
map <silent> <Leader>h :Bashrockets<CR>
map <silent> <Leader>oh :Hashrockets<CR>
nmap <C-h> :Bashrockets<CR>

" comands to edit and reload vimrc
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" showmarks toggle
map <Leader>sm <Leader>mt

" hit ,smr to reload snippets
nnoremap <Leader>smr <esc>:exec ReloadAllSnippets()<cr>

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
noremap <silent> <Leader>sjs :SplitjoinSplit<CR>
noremap <silent> <Leader>sj :SplitjoinJoin<CR>

" tabularize
noremap <silent> <Leader>a, :Tab/,<CR>
noremap <silent> <Leader>a= :Tab/=<CR>
noremap <silent> <Leader>a: :Tab/:\zs<CR>
noremap <silent> <Leader>a{ :Tab/{<CR>
noremap <silent> <Leader>ah :Tab/=><CR>

" CommandT shortcut
map <C-p> :CommandTFlush<CR>:CommandT<CR>

" vimux/turbux mappings
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vc :CloseVimTmuxPanes<CR>
map <Leader>vi :VimuxInterruptRunner<CR>
vmap <silent> <LocalLeader>vs "vy :call RunVimTmuxCommand(@v)<CR>

" gundo shortcut
map <Leader>g :GundoToggle<CR>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Quickfix next shortcut
noremap <leader>c :w<cr>:cnext<cr>


" ---------------------------------------------------------------------------
" SPELLING
" ---------------------------------------------------------------------------

map <Leader>ss :setlocal spell! spelllang=en_us<cr>
iab defintion definition
iab Defintion Definition
iab enviornment environment

" spell check git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
