"1) pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on


"2) line number
noremap <F4> :set invnumber<CR>
inoremap <F4> <C-O>:set invnumber<CR>
"use system clipboard
set clipboard=unnamed


"3) split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"split below
set splitbelow
"split right
set splitright


"4) code folding
set foldmethod=indent
set foldlevel=99
"enable folding with the spacebar
nnoremap <space> za


"5) Indentation rules for py
au BufNewFile,BufRead *.py, *.pyw, *.cpp, *.c, *.h, *.hpp, *.cc
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
"flag unnecessary whitespace in red
au BufRead,BufNewFile *.py, *.pyw, *.c, *.h, *.cpp, *.cc, *.hpp
    \ match BadWhitespace /\s\+$/


"6) utf-8 encoding
set encoding=utf-8


"7) syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"python specific
let python_highlight_all=1
syntax on


"8) nerdtree
"open filesystem if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"key-mapping for opening nerdtree
map <C-n> :NERDTreeToggle<CR>
"hide .pyc and temp files
let NERDTreeIgnore=['\.pyc$', '\~$']


"9) CtrlP
"default key map
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"open working directory if directory not supplied
let g:ctrlp_working_path_mode = 'ra'
"files to ignore while searching
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"10) YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
map <C-G> :YcmCompleter GoToDefinitionElseDeclaration<CR>


"11) Ultisnips
" Track the engine.
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"12) 80 characters line and trailing spaces
"[a]
set colorcolumn=81
" execute "set colorcolumn=" . join(range(81,335), ',')
" highlight ColorColumn ctermbg=Black ctermfg=DarkRed
"[b]
" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
"
"
" "8) indentLine settings
" " vertical line indentation
" let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#09AA08'
" let g:indentLine_char = '_'
"
