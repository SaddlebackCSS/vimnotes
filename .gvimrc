" Prevents access to the menus using the Alt key.
set winaltkeys=no
" Disables the mouse.
set mouse-=a

" Tell GVim to use colors appropriate for a light background.
" Useful if you want to use a light background in GVim but your .vimrc has
" background=dark for the terminal.
"set background=light

" Set background and text colors
highlight Normal guibg=Black guifg=White

" Set the number of lines to display.
" Useful for tall displays.
" Also maximizes the window when run in diff mode
if &diff
    set lines=999 columns=999
else
    set lines=48
endif

" The visual bell causes the screen to flash on errors.
" This disables it.
set visualbell t_vb=


