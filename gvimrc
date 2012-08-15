set number
colorscheme ir_dave
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
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

  set lines=58 columns=230
  set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h12

  " Command-Return for fullscreen

  imap <silent> <D-d> <ESC>:NERDTreeToggle<CR>i
  map <silent> <D-d> :NERDTreeToggle<CR>

  macmenu &File.Print key=<nop>
  map <D-p> :CommandT<CR>
  imap <D-p> <Esc>:CommandT<CR>

  macmenu &File.Open\.\.\. key=<nop>
  imap <D-o> <ESC>:CommandTBuffer<CR>
  map <D-o> :CommandTBuffer<CR>
end

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
