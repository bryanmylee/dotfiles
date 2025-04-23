inoremap <expr> <Tab> coc#pum#visible() ? coc#_select_confirm() : "\<Tab>"

" coc extension commands are prefixed with <Leader>c
" =================================================
" Use rest client
nnoremap <Leader>cr :CocCommand rest-client.request<CR>

" coc-tailwindcss
nnoremap <Leader>cts :CocCommand tailwindCSS.headwind.sortTailwindClasses<CR>

" coc-prettier
nnoremap <Leader>cp :CocCommand prettier.formatFile<CR>

