set number
colorscheme ir_black
set showtabline=2
set tabpagemax=15
set linespace=2
set autoindent
set smartindent

" Turn on right scrollbars
set guioptions+=R
set guioptions+=r

" go to normal mode after save
iunmenu File.Save
imenu <silent> File.Save <Esc>:if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>

" gvim/ubuntu stuff
nmap <C-t> :tabnew <CR>
nmap <C-q> :q <CR>
nmap <C-s> :w <CR>
imap <c-s> <Esc><c-s>
set lines=41 columns=185
set clipboard=unnamed
imap <C-z> <ESC>:undo <CR> i
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
map <A-C-]> <C-PageDown>
map <A-C-[> <C-PageUp>

map <D-e> :ConqueTerm zsh <CR> 

" set up peepopen (to cmd p)
if has("gui_macvim")
  set guioptions=e
  set lines=58 columns=230
  set guifont=Bitstream\ Vera\ Sans\ Mono:h12

  macmenu &File.Print key=<nop>
  map <D-p> <Plug>PeepOpen
  imap <D-p> <Esc><Plug>PeepOpen
end
