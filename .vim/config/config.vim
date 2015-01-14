nnoremap <S-n> :set number<CR>
nnoremap <S-p> :set paste<CR>

autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
helptags ~/.vim/doc
let g:user_zen_settings = {
            \'indentation' : '  ', 
            \}

highlight clear SignColumn
let g:SimpleJsIndenter_BriefMode = 1
