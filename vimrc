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
map <C-d> :NERDTreeToggle<CR>

"Map fuzzy file find to ff
cmap <leader>ff :FufFile **/<CR>
nmap <leader>t :FufFile<CR>
map <C-t> :FufFile <CR>
map <C-x> :FufFile <CR>

" hit ,smr to reload snippets
nnoremap <leader>smr <esc>:exec ReloadAllSnippets()<cr>

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
"set list
"set listchars=tab:>-,trail:-,extends:#,nbsp:.,
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" toggle paste mode with F2
set pastetoggle=<F2>

" let's use ;w as a shortcut for :w
nnoremap ; :

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Find in Project
" script/plugin install http://github.com/37signals/project_search.git
function! RailsScriptSearch(args)
  let l:savegrepprg = &grepprg  
  let l:savegrepformat = &grepformat

  try 
    set grepprg=script/find
    set grepformat=%f:%l:%m

    execute "grep " . a:args
  finally
    "execute "set grepprg=" . escape(l:savegrepprg, '')
    "execute "set grepformat=" . escape(l:savegrepformat, '')
    set grepprg="grep -n $* /dev/null"
    set grepformat="%f:%l:%m,%f:%l%m,%f  %l%m"
  endtry
endfunction

" search with explicitly provided arguments
command! -n=? Rgrep :call RailsScriptSearch('<args>')

" search for the word under the cursor
map <leader>rg :silent call RailsScriptSearch(expand("<cword>"))<CR>:cc<CR>

" search for the method definition of the word under the cursor
map <leader>rd :silent call RailsScriptSearch(expand("'def .*<cword>'"))<CR>:cc<CR>

" map :Rfinder to use script/find
command! -nargs=* Rfinder :Rscript find <args>
command! -n=* Rf :Rscript find <args>

" gvimrc stuff
if has('gui_running')
  set number
  colorscheme ir_black
  set guioptions=e
  set showtabline=2
  set tabpagemax=15
  set guifont=Bitstream\ Vera\ Sans\ Mono:h12
  set linespace=2
  set autoindent
  set smartindent

  " Turn on right scrollbars
  set guioptions+=R
  set guioptions+=r

  " go to normal mode after save
  iunmenu File.Save
  imenu <silent> File.Save <Esc>:if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>

endif

" code folding
"autocmd FileType ruby setlocal foldmethod=syntax
"autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2