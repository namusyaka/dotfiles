syntax on
colorscheme hybrid

filetype plugin on
filetype plugin indent on "ruby.vim"

set autoindent
set smartindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set incsearch
set hlsearch
set laststatus=2
set t_Co=256

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
au BufNewFile,BufRead,BufReadPre *.ex set filetype=elixir
au BufNewFile,BufRead,BufReadPre *.ru set filetype=ruby
au BufNewFile,BufRead,BufReadPre *.rabl set filetype=ruby
