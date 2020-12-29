let g:dark_theme = "horizon"
let g:light_theme = "solarized"

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
execute 'colorscheme ' . g:dark_theme
let g:airline_theme='atomic'

function! ToggleDarkMode()
  if &background == 'dark'
    set background=light
    execute 'colorscheme ' . g:light_theme
  else
    set background=dark
    execute 'colorscheme ' . g:dark_theme
  endif
endfunction

nmap <silent> <Bslash>c :call ToggleDarkMode()<CR>

