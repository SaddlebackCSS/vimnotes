" Sets the folder where Vim keeps its swap (backup) files.
" When writing code, this keeps the backups out of your source folder,
" so you do not need to tell your VCS (git) to ignore them.
set directory=~/.swp
" Causes Vim to scan the first and last lines of a file for options.
" This is mainly used for Vim's automatic indentation, so that everyone who
" edits the file will use a consistent indentation style (eg using spaces
" instead of tabs, how many spaces to insert for a tab, how 'wide' a tab
" appears).
set modeline
" Shows the current line number in the status line at the bottom of the
" screen.
set ruler
" Shows line numbers in the left column.
" I prefer set ruler
"set number
" Shows incomplete commands in the status line.
set showcmd
" Inserts spaces instead of tabs
set expandtab
" Treat tabs as this many spaces
set softtabstop=4
" Number of spaces to use for autoindent
set shiftwidth=4
" Copy indent from the current line when starting a new line.
set autoindent
" In Normal mode, Ctrl-A and Ctrl-X can be used to increment/decrement the
" number under the cursor.
" This option prevents Vim from recognizing octal numbers, which have leading
" zeros.
set nrformats-=octal
" When editing multiple files, keep each file loaded.
" This way, you don't have to save the current file before switching to
" another file.
set hidden
" Tells Vim that your terminal uses a dark background, so Vim can adjust its
" colors accordingly.
" You can also set it to 'light' if your terminal uses a light background.
set background=dark
" Highlights the 80th column in red.
set colorcolumn=80
" Fix the backspace key to delete over indents, line breaks, and existing text
set backspace=indent,eol,start

" Creates a new command ':W' which saves the current file and runs 'make'.
" If you have a Makefile in the current directory, this will cause the default
" target to be executed.
" You can also set 'makeprg' so that the 'make' command executes something
" else (examples of this below).
command W write|make

" Disable the F1 key (I keep accidentally hitting it when trying to press ESC).
" map is for keystrokes in Normal, Visual, Select, and Operator-pending modes.
map <F1> <nop>
" imap is for Insert mode
imap <F1> <nop>

" Whenever you type an open parenthesis, this remap will insert the closing
" parenthesis and place the cursor between them.
inoremap ( ()<Left>
" With the above remap, if you type the closing parenthesis then you will
" have two closing parentheses.
" This will prevent the closing parenthesis duplication.
inoremap () ()
" Whenever you type an open brace followed by a new line, this remap will
" insert the closing brace on a new line and place the cursor on a new line
" between them.
" This remap will use auto-indentation (if enabled).
inoremap {<CR> {}<Left><CR><Up><End><CR>
" This remap will correctly insert quotes. When you type a quote, if the
" character after the cursor is a quote, then the cursor is just moved
" right, otherwise, two quotes are inserted and the cursor is moved left.
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" Note that the above remaps may break the undo stack

" set background and text colors
"highlight Normal ctermbg=White ctermfg=Black

" Autocmds are commands that are executed automatically on certain events.
" BufRead: opening an existing file
" BufNewFile: starting to edit a new file
" FileType: when the filetype has been set
if has("autocmd")

  " When editing any .md file in ~/SaddlebackCSS/SaddlebackCSS.github.io/
  " Set the filetype to liquid (Jekyll's template engine) and tell Liquid that
  " the file it is templating is Markdown
  "autocmd BufRead,BufNewFile ~/SaddlebackCSS/SaddlebackCSS.github.io/*.md let b:liquid_subtype = 'markdown' | set filetype=liquid
  " Likewise, but for HTML files
  "autocmd BufRead,BufNewFile ~/SaddlebackCSS/SaddlebackCSS.github.io/*.html let b:liquid_subtype = 'html' | set filetype=liquid

  " Prevent Vim from auto-wrapping comments
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " When editing Java files, use the javacomplete function to complete Java
  " class and method names.
  " Requires the javacomplete plugin
  "autocmd Filetype java setlocal omnifunc=javacomplete#Complete

  " When editing Java files, set 'makeprg' to ant.
  " This, combined with the above 'command' option, allows for quick
  " save/compile cycles using ':W'
  autocmd Filetype java setlocal makeprg=ant

  " When editing Python files, set 'makeprg' to the file itself.
  " This allows for quick save/run cycles using ':W'
  autocmd Filetype python setlocal makeprg=%:p

  " Since HTML and XML files tend to be deeply nested, set the shiftwidth to 2.
  autocmd Filetype html setlocal shiftwidth=2
  autocmd Filetype xml setlocal shiftwidth=2

  " For Markdown, HTML, and Liquid files, enable spell checking
  autocmd Filetype markdown setlocal spell spelllang=en_us
  autocmd Filetype html setlocal spell spelllang=en_us
  autocmd Filetype liquid setlocal spell spelllang=en_us
endif

" Enable syntax highlighting
syntax on
" Enable filetype detection, plugins, and automatic indentation
filetype plugin indent on

