set number
colorscheme ir_black
set guioptions=e
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

map <D-e> :ConqueTerm zsh <CR> 

" set up peepopen (to cmd p)
if has("gui_macvim")
  set lines=58 columns=230
  set guifont=Bitstream\ Vera\ Sans\ Mono:h12

  macmenu &File.Print key=<nop>
  map <D-p> <Plug>PeepOpen
  imap <D-p> <Esc><Plug>PeepOpen
end

":command -nargs=* Rfinder :Rscript find <args>
