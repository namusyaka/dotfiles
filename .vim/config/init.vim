if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/neobundle.vim/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-scripts/pig.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle "elixir-lang/vim-elixir"
NeoBundle "kana/vim-smartinput"
NeoBundle "tpope/vim-endwise"
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense.vim', {
      \'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],
      \}

if neobundle#tap('nerdtree') && has('vim_starting') && expand("%") == ""
  autocmd vimenter * NERDTree
endif

if neobundle#tap('neocomplcache')
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  
  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
      \'default' : ''
      \}
  
  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()
  
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  let g:rsenseUseOmniFunc = 1

  hi Pmenu ctermbg=4
  hi PmenuSel ctermbg=1
  hi PMenuSbar ctermbg=4
endif

if neobundle#tap('rsense')
  " see ~/.rsense
  let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
  let g:rsenseUseOmniFunc = 1
  
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

if neobundle#tap('powerline')
  let g:Powerline_symbols = 'fancy'
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
endif

call neobundle#end()

NeoBundleCheck
