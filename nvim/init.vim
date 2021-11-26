"set runtimepath^=~/.vim
"set runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

let g:python3_host_prog = '~/.pyenv/shims/python3'

let mapleader=" "
let g:mapleader=" "

" """""""" plugins """"""""
call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-gruvbox8'
Plug 'mechatroner/rainbow_csv'
    nnoremap <leader>fdt :set ft=csv_semicolon<CR> <bar> :RainbowAlign<CR>
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    let g:Lf_PythonVersion=3
    let g:Lf_PopupWidth=0.9
    let g:Lf_WindowPosition='popup'
    let g:Lf_PreviewInPopup=1
    let g:Lf_ShowDevIcons=0
    let g:Lf_ExternalCommand='fd -t f "%s" '
    "let g:Lf_CommandMap={'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
    let g:Lf_WildIgnore={
        \ 'dir': ['.git', '__pycache__', '.DS_Store'],
        \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png', '*.bak',
        \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
        \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
        \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
        \ '*.mp3', '*.aac']
        \}
    nnoremap <leader>l  :LeaderfLine<CR>
    nnoremap <leader>rg :Leaderf rg<CR>
    nnoremap <leader>ru :LeaderfMru<CR>
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-current-search-match'
Plug 'mhinz/vim-startify'

call plug#end()


" """""""" options """"""""
let g:netrw_banner=0
let g:netrw_keepdir=0
let g:netrw_liststyle=3
let g:netrw_sort_options='i'
let g:netrw_list_hide=netrw_gitignore#Hide() . '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

set noswapfile
set nowritebackup
set nowrapscan

set ambiwidth=double
set fileformats=unix,dos,mac
set fileencodings=ucs-bom,utf-8,cp936,cp18030,big5,euc-jp,euc-kr,latin1

set autoread
set cursorline
set list
set number relativenumber
set autoindent smartindent
set ignorecase smartcase hlsearch incsearch

set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase

set wrap
set showbreak=↪
set whichwrap+=<,>,[,]

set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

set smarttab expandtab shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4

set virtualedit=block
set foldcolumn=1
set pumblend=10
set winblend=5

if has('mac')
    set clipboard+=unnamed
else
    set clipboard+=unnamedplus
endif

if has('gui_running')
    set background=dark
    "colorscheme evening

    "colorscheme gruvbox
    let g:gruvbox_italics=1
    let g:gruvbox_italicize_strings=1
    let g:gruvbox_filetype_hi_groups = 1
    let g:gruvbox_plugin_hi_groups = 1
    colorscheme gruvbox8_hard

endif

if has('gui_vimr')

endif


" """""""" mappings """"""""

nnoremap <leader>ev :new $MYVIMRC<CR>

map 0 ^

inoremap jk <ESC>
xnoremap jk <ESC>
cnoremap jk <C-c>

nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

vnoremap < <gv
vnoremap > >gv

" Change text without putting it into the vim register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c
nnoremap x "_x

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <silent> bd :bdelete<CR>

map <leader>cd :lcd %:p:h<CR>:pwd<CR>

map <silent> <leader><CR> :nohlsearch<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

inoremap <C-s>     <C-o>:update<CR>
nnoremap <C-s>     :update<CR>
nnoremap <leader>w :update<CR>

inoremap <C-q>     <ESC>:q<CR>
nnoremap <C-q>     :q<CR>
vnoremap <C-q>     <ESC>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt

map <C-1> <leader>1
map <C-2> <leader>2
map <C-3> <leader>3
map <C-4> <leader>4
map <C-5> <leader>5

if has('mac')
  nmap <D-1> <leader>1
  nmap <D-2> <leader>2
  nmap <D-3> <leader>3
  nmap <D-4> <leader>4
  nmap <D-5> <leader>5
endif

" """""""" autocmd """"""""

autocmd FocusGained,BufEnter * checktime
autocmd InsertEnter,InsertLeave * set cursorline!


" """""""" funtions """"""""

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" print the message to the new tab page.
function! TabMsg(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMsg call TabMsg(<q-args>)

