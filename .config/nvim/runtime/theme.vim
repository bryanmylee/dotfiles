let g:dark_theme = "horizon"
let g:light_theme = "xcodelight"

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme='atomic'

set background=dark
execute 'colorscheme ' . g:dark_theme
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

function! ToggleDarkMode()
  if &background == 'dark'
    set background=light
    execute 'colorscheme ' . g:light_theme
  else
    set background=dark
    execute 'colorscheme ' . g:dark_theme
  endif
  " hi Normal guibg=NONE ctermbg=NONE
  " hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction

nmap <silent> <Bslash>c :call ToggleDarkMode()<CR>

