function g:toggle_line_number()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction

call g:toggle_line_number()
nnoremap <S-n> :call g:toggle_line_number()<CR>
nnoremap <S-p> :set paste<CR>
vnoremap <silent> <C-p> "0p<CR>

autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"helptags ~/.vim/doc
let g:user_zen_settings = {
            \'indentation' : '  ', 
            \}

highlight clear SignColumn
let g:SimpleJsIndenter_BriefMode = 1
