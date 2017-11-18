if &compatible
  set nocompatible
endif

" Reset my auto command group
augroup MyAutoCmd
  autocmd!
augroup END

let g:python_host_prog = "/Users/y1r/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/y1r/.pyenv/versions/neovim3/bin/python"

" dein.vim install
let s:dein_dir = expand("~/.vim/dein")
let s:dein_vim_repo_dir = s:dein_dir . "/repos/github.com/Shougo/dein.vim"

if !isdirectory(s:dein_vim_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_vim_repo_dir))
endif

execute "set runtimepath+=" . s:dein_vim_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml("~/.config/nvim/dein.toml", {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"Markdown filename Setting
autocmd MyAutoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" display setting
set number
set showmode
set ruler
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set ambiwidth=double

" edit setting
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set showmatch
set clipboard=unnamedplus
set autoread
set hidden
set showcmd
set backspace=indent,eol,start

" move
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]
imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>

"search
set incsearch
set ignorecase
set smartcase

" bell
set visualbell
set t_vb=

" backup file and swap file directory setting
let s:backup_dir = expand("~/.vim/vim_backup")
let s:swap_dir = expand("~/.vim/vim_swap")

if !isdirectory(s:backup_dir)
  call system('mkdir -p ' . shellescape(s:backup_dir))
endif

if !isdirectory(s:swap_dir)
  call system('mkdir -p ' . shellescape(s:swap_dir))
endif

set backup
execute "set backupdir=" . s:backup_dir
set swapfile
execute "set directory=" . s:swap_dir
