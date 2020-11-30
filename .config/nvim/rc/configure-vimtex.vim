" vimtex config {{{
set grepprg=grep\ -nH\ $*
set sw=2
set iskeyword+=:
let g:tex_flavor = 'latex'
let g:tex_fold_enabled = 1
let g:tex_nospell = 1
let g:tex_no_error = 1
let g:vimtex_view_automatic = 1
" tex_conceal options are:
" a -
" b -
" d - delimiters
" m - math symbols
" g - general symbols
let g:tex_conceal = ''

let g:vimtex_view_method = 'skim'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
"}}}

function! UpdateSkim(status) "{{{
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'),
          \ shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
"}}}

