execute pathogen#infect()
syntax on
filetype plugin indent on

"set number
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
map <C-G> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1


"1) split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"2) Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za


"3) indentation rules for py, c, cpp files -- py removed
au BufNewFile,BufRead *.cpp, *.c, *.h, *.hpp
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ match BadWhitespace /\s\+$/


"4) syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"5) nerdtree
" open filesystem if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" key-mapping for opening nerdtree
map <C-n> :NERDTreeToggle<CR>


"6) CtrlP
"files to ignore while searching
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"7) 80 characters line and trailing spaces
"[a]
set colorcolumn=81
"execute "set colorcolumn=" . join(range(81,335), ',')
" highlight ColorColumn ctermbg=Black ctermfg=DarkRed
"[b]
" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


"8) indentLine settings
" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
