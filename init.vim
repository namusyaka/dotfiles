" ensure vim-plug
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" color
syntax on
set t_Co=256
hi clear SignColumn

" indent
set autoindent
set smartindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2

" search
set incsearch
set hlsearch
set smartcase

" autocmd
augroup default
  autocmd!
  au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
  au BufNewFile,BufRead,BufReadPre *.ex set filetype=elixir
  au BufNewFile,BufRead,BufReadPre *.ru set filetype=ruby
  au BufNewFile,BufRead,BufReadPre *.rabl set filetype=ruby
	au FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
	au FileType ruby :map <C-e> <ESC>:!ruby %<CR>
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  au BufNewFile,BufRead *.pig setf pig
  au FileType go :highlight goErr cterm=bold ctermfg=214
  au FileType go :match goErr /\<err\>/
augroup END

" backspace
set backspace=indent,eol,start

" togglable
nnoremap <silent> <S-n> :<C-u>setlocal number!<CR>
nnoremap <silent> <S-p> :<C-u>setlocal paste!<CR>
set number

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'freeo/vim-kalisi'
Plug 'https://github.com/Lokaltog/powerline.git'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'derekwyatt/vim-scala'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'airblade/vim-gitgutter'
Plug 'elixir-lang/vim-elixir'
Plug 'kana/vim-smartinput'
Plug 'tpope/vim-endwise'
Plug 'dcharbon/vim-flatbuffers'
Plug 'aklt/plantuml-syntax'
Plug 'uarun/vim-protobuf'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'haya14busa/incsearch.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" hybrid
colorscheme kalisi
set background=dark

" simple-js-indenter
let g:SimpleJsIndenter_BriefMode = 1

" vim-go vars
let g:netrw_altv=1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" deoplete
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.9/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.6.3/bin/python'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
call deoplete#enable()

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources.go = ['buffer', 'go']

" status line
set laststatus=2

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
