nnoremap <S-F8> :call ToggleContrast()<cr>:execute 'colorscheme ' . g:mylist[g:colorNumber]<cr>:execute "echom g:cc"<cr>
nnoremap <F8> :call ColorSchemeToggle()<cr>:execute "colo"<cr>
