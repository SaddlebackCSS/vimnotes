# Vim Notes

Vim can be downloaded from [vim.org](http://www.vim.org/).
The Windows installer is a self-extracting archive which does not require
administrator privileges to run (as long as you have permission to write to
the selected install folder).

---
## Contents

- [Intro](#intro)
- [Undo/Redo](#undoredo)
- [Inserting](#inserting)
- [Motions](#motions)
- [Editing](#editing)
- [Navigating Help](#navigating-help)
- [Searching](#searching)
- [Scrolling](#scrolling)
- [Marks](#marks)
- [Tags](#tags)
- [Completion](#completion)
- [Spell Checking](#spell-checking)
- [Macros](#macros)
- [Substituting](#substituting)
- [Visual Mode](#visual-mode)
- [Text Objects](#text-objects)
- [Buffers and Multiple Files](#buffers-and-multiple-files)
- [Windows](#windows)
- [Tab Pages](#tab-pages)
- [Vimdiff](#vimdiff)
- [Runtime Configuration](#runtime-configuration)
- [Filetypes](#filetypes)
- [QuickFix Mode](#quickfix-mode)
- [Compiling Code](#compiling-code)
- [Compiler Plugins](#compiler-plugins)
- [Browsing Folders](#browsing-folders)

---
## Intro

Vim is **modal**

- **Normal** mode maps each key to an editing command
- **Insert** mode is used to enter text

---

- GVim is Vim in a GUI.
    - a GUI terminal might intercept keystrokes that it understands;
      GVim only understands Vim commands.
- EVim is GVim in "easy mode".
- Easy mode can also be run using `vim -y` in the terminal
- Easy mode can also be activated using the Vim command `:set insertmode`.
  This also works in the command-line Vim.
  (see `:help evim-keys` for the full list of options that EVim uses).
- There are also "View" variants that open the file read-only

---

- In Vim/GVim, the program starts in Normal mode; use `i` to enter Insert mode and `ESC` to return to Normal mode
- In EVim, the program starts in Insert mode; use `CTRL-L` to enter Normal mode and `ESC` or `i` to return to Insert mode

---

- When in Normal mode, use `:` to enter the Vim command-line
- Use `:w [filename]` to save a file
    - To save a file under a different name without overwriting the original, use `:saveas [filename]`
- Use `:q` to quit Vim
- Use `:q!` to quit Vim without saving changes
- Use `:wq` or `ZZ` to save and close
- Use `:help` to read Vim's help

---
## Undo/Redo

- `u` undoes the previous command
- `CTRL-R` redoes the last undo

---
## Inserting

- `i` enters Insert mode at the current position
- `a` enters Insert mode after the current position
- `I` enters Insert mode at the beginning of the line
- `A` enters Insert mode at the end of the line
- `o` inserts a new line below the current line and enters insert mode on the new line
- `O` inserts a new line above the current line and enters insert mode on the new line
- `R` enters Replace / overtype mode; typed characters replace existing ones
- `c` followed by a motion deletes text and enters Insert mode (effectively `d` followed by `i`)
- `Esc` returns to Normal mode


Note that *everything* from when Insert mode is first entered to pressing `ESC`
is treated as *one* command, and therefore *one* item on the undo stack.
For that reason, I usually use `o` to enter newlines so that each line is a
separate command and a separate item on the undo stack.

---
## Motions
Motions move the cursor around. Most commands can be followed by a motion to indicate the affected text.

- When in Normal mode, use `h`, `j`, `k`, and `l` to move the cursor
    - `h` is on the left and moves the cursor left
    - `l` is on the right and moves the cursor right
    - `j` looks like a down arrow and moves the cursor down
    - `k` moves the cursor up
- Normally, only `j` and `k` are used; there are faster ways to move around

---

- `w` moves the cursor to the beginning of the next word
- `e` moves the cursor to the end of the next word
- `b` moves the cursor to the beginning of the previous word
- Lowercase `w`, `e`, and `b` treat whitespace and punctuation as word separators; Uppercase `W`, `E`, and `B` only treat whitespace as separators (punctuation is considered part of the word)

---

- `f` followed by a character goes forward (right) to the next character (e.g. `fg` goes to the next `g`)
- `F` followed by a character goes back (left) to the previous character (e.g. `Fg` goes to the previous `g`)
- `f` or `F` prefixed with a number goes to the nth character (e.g. `2fr` goes to the 2nd `r` after the cursor)

---

- `0` jumps to the beginning of the line
- `^` jumps to the first non-whitespace character of the line
- `$` jumps to the end of the line

---

- `H` moves the cursor to the highest visible line (on the screen)
- `L` moves the cursor to the lowest visible line
- `M` moves the cursor to the middle of the screen

---

- `gg` moves to the beginning of the document
    - Prefixed with a number, goes to the nth line (e.g. `20gg` goes to line 20)
- `G` moves to the end of the document

---

- `{` and `}` jump over paragraphs. A paragraph is any block of text separated by a blank line

---

- `%` scans forward for a grouping character and jumps to the matching character

---
## Editing

For nearly all editing commands, repeating the command character operates on the line under the cursor (e.g. `dd` deletes the line, `yy` copies the line, etc.).

- `d` followed by a motion will delete characters (placing them in the default register)
- `y` followed by a motion will copy (yank) characters into the default register
- `p` will put the contents of the default register after the cursor
- `P` will put the contents of the default register before the cursor
    - The above commands can be prefixed with `"` followed by a register letter to operate on a specific register (e.g. `"add` will delete the line and place it in register a; `"ap` will then paste this register)
        - Also, with `y` and `d`, using a captial register letter will *append* to the register instad of overwriting it
    - Also note that the special register `+` synchronizes with the system clipboard (e.g. `"+p` will paste the clipboard contents; `"+yy` will copy a line to the clipboard)
- `x` will delete the character under the cursor
- `>` followed by a motion indents the lines indicated by the motion
- `<` followed by a motion un-indents the lines indicated by the motion
- `.` repeats the last command

---
## Navigating Help

- use `:help` to view Vim's help
- use `:help <topic>` to jump to a topic
- You may notice some help text that is highlighted. These are [tags](#tags). Position the cursor on the text and press `CTRL-]` to jump to the tagged topic. Use `CTRL-O` to return to the previous topic.
- use `:helpgrep <text>` to search for `<text>` in the help
    - use `:cn` to go to the next search result


---
## Searching

- `/` allows to search for the next occurrence of a regex
- `?` allows to search for the previous occurrence of a regex
- `n` repeats the previous search in the same direction
- `N` repeats the previous search in the opposite direction

---

- `*` jumps to the next occurrence of the identifier under the cursor
- `#` jumps to the previous occurrence of the identifier under the cursor

---
## Scrolling

- `CTRL-F` scrolls down one screen
- `CTRL-B` scrolls up one screen
- `zt` places the current line at the top of the screen
- `zb` places the current line at the bottom of the screen
- `zz` places the current line at the middle of the screen
    - (This is not the same as `ZZ`, which saves and quits Vim)


---
## Marks

You can mark a location in a file and return to it later.
Every [buffer](#buffers-and-multiple-files) has its own set of lowercase marks.
Uppercase marks are global and can be used to jump between files.

- `m` followed by a letter sets a mark at the cursor position (e.g. `ma` sets mark `a`)
- `'` followed by a letter jumps to the mark

---
## Tags

You can have a tags file which contains the locations of function/class/method
definitions so that you can easily jump to the definition from other places.
See `:help ctags` for a list of programs that can generate tags files for
various programming languages.

---

- `:tag myfunc` jumps to the definition of `myfunc`
- `CTRL-]` jumps to the definition of the function/method under the cursor
- `CTRL-T` jumps to the previous location (before the last `CTRL-]`)
- `CTRL-W ]` jumps to the definition of the function/method under the cursor in a new window
- `CTRL-W }` jumps to the definition of the function/method under the cursor in the preview window

---
## Completion

When in Insert mode, use `CTRL-P` to quickly enter words that appear elsewhere in the document. Use `CTRL-P` and `CTRL-N` to scroll through the list. Use `CTRL-Y` to accept ("yes") or `CTRL-E` to cancel ("escape" or "exit").

When in Insert mode, use `CTRL-X` to enter Insert mode completion. See `:help ins-completion`.

Useful subcommands:

  - `CTRL-X CTRL-F`: Filename completion.
  - `CTRL-X CTRL-K`: Completion from one or more dictionary files (see `:help dictionary`).
  - `CTRL-X CTRL-T`: Completion from one or more thesaurus files (see `:help thesaurus`).
  - `CTRL-X CTRL-S` or `CTRL-X s`: If spelling is enabled, complete spelling suggestions.
  - `CTRL-X CTRL-]`: Tag completion.
  - `CTRL-X CTRL-O`: Omni-complete. This allows for completion based on filetype. See `:help compl-omni-filetypes`.
  - When the popup menu is displayed, use `CTRL-N` and `CTRL-P` to scroll through the list. You can also repeat the subcommand (e.g. `CTRL-F` for file completion) as a shortcut for `CTRL-N`.
  - `CTRL-Y`: Accept completion.
  - `CTRL-E`: Cancel completion.

---
## Spell Checking

The command `:setlocal spell spelllang=en_us` enables spell checking.
Spell files for other languages can be placed in `~/.vim/spell` (UNIX)
or `%USERPROFILE%\vimfiles\spell` (Windows).

Use the following commands with the spell checker:

- `]s` goes to the next misspelled word
- `[s` goes to the previous misspelled word
- `z=` suggests correctly spelled words for the word under the cursor.
- In Insert mode, use `CTRL-X CTRL-S` or `CTRL-X s` to find spelling suggestions.
- `zg` marks a word as "good" (i.e. not misspelled). This will be saved in your spell file.
- `zG` marks a word as good, but does not add it to the spell file. This will be lost when you exit Vim.
- `zw` marks a word as misspelled. This will be saved in your spell file.
- `zW` marks a word as misspelled, but does not add it to the spell file. This will be lost when you exit Vim.
- `zug`/`zuG`/`zuw`/`zuW` undo `zg`, `zG`, `zw`, or `zW`

---
## Macros

- `q` followed by a register will record all following commands to the register (use `q` to stop recording)
- `@` followed by a register will execute the contents of the register as commands
    - Prefix `@` with a count to execute the macro multiple times.


Note that these commands use the same registers as `p`, `y`, and `d`.
This means that you can use `qa` to record into register `a`, then `"ap` to paste
the commands entered; or use `"ayy` to yank a line into register `a`, then `@a`
to execute it. This ultimately means that you can edit a macro just like any
other text, to correct any mistakes made when recording.

---
## Substituting

- `:s` allows for regular expression find-and-replace
- `&` repeats the last `:s`

---

- `:s/red/blue/` replaces the first occurrence of `red` on the current line with `blue`
- `:s/red/blue/g` replaces all occurrences of `red` on the current line with `blue`
- `:3,5s/red/blue/g` replaces all occurrences of `red` on lines 3 to 5 with `blue`
- `:%s/red/blue/g` replaces all occurrences of `red` in the file with `blue`
- `:%s/red/blue/gc` asks to confirm each replacement
- `:%s/emacs//ig` deletes (note the empty replacement string) all occurrences of `emacs` (ignores case)
- `:s/.*/insert(&);/` wraps the entire line in a function call
- `:s/\(".*"\) *: *\(.*\),/mymap->insert(make_pair(\1, \2));/` converts a Python dictionary or JSON object literal to a C++ STL map insert


Note that the separator (the character following `s`) is `/` by tradition,
but can be (almost) any punctuation character.
This is useful if the pattern or replacement contains many `/` characters
(e.g. UNIX path names or URLs).
Common alternatives are `:`, `,`, and `@`.

The following all work:

- `:s:red:blue:`
- `:s@red@blue@`
- `:s,red,blue,`

---
## Visual Mode

Visual mode allows you to easily select text to be manipulated by a command.
After entering visual mode, all text between the cursor's current position
and the cursor's position when you entered visual mode are operated on.

- `v` starts visual mode in character mode
- `V` starts visual mode in line mode
- `CTRL-V` starts visual mode in block mode
- `gv` starts visual mode with the previously-selected text selected
- `o` goes to the other end of the selected area
- `O` is like `o`, but in block mode it goes to the opposite corner


---

The following commands are useful when you have text selected in visual mode.

- `d` deletes the selected text
- `c` changes the selected text
- `y` yanks the selected text
- `p` overwrites the selected text with the contents of the default register
    - Note that these commands can be used with `"` to select a different register
- `<` and `>` change the indentation of the selected lines
- `:` enters the Vim command line with a prefix so that the executed command operates on the selected text


---
## Text Objects

Text objects are a quick way to select and operate on various types of
structured text, such as words, sentences, paragraphs, quoted strings, blocks
delimited by any type of bracket or brace, and even XML tags.
See `:help text-objects`.

---
## Buffers and Multiple Files

Vim reads files into a `buffer`.
You can have multiple buffers to open multiple files.
You can create new buffers using `:hide edit <filename>` or `:hide enew`.
By default, every file specified on the command line is read into a separate buffer.

By default, you must write the current buffer before switching to another buffer.
You can append a `!` to the command to force the switch, but this will cause Vim to forget any changes.
`:set hidden` allows you to switch buffers without losing changes.

---

- `:buffers` or `:ls` lists all buffers
- `:buffer [N]` and `:b[N]` switch to buffer N
- `:bnext` and `:bn` switch to next buffer
- `:bprevious` and `:bp` switch to previous buffer
- `:bunload` unloads the current buffer and switches to another one (frees memory)
- `gf` opens the file under the cursor in a new buffer


---
## Windows

Vim's viewport can be split into multiple windows.
Each window can display a different buffer.
Different windows can also view the same buffer
(e.g. to view one part of the file while editing a different part).

---

The `-o` command-line option will cause Vim to open a window for each file on the command line.
For example, `$ vim -o file1 file2 file3` will open Vim with three windows,
one each for `file1`, `file2`, and `file3`.
You can also specify a number of windows.
For example, `$ vim -o2 file1 file2 file3` will open Vim with two windows,
one for `file1` and one for `file2`.
You will have to switch buffers to edit `file3`.

`-O` works like `-o`, except that the windows are split vertically.

---

- `:split` and `CTRL-W CTRL-S` and `CTRL-W s` split the current window in two, horizontally
- `CTRL-W CTRL-^` and `CTRL-W ^` split the current window and edit the alternate file
- `:sbuffer [N]` and `:sbuffer {bufname}` split the window and edit buffer N or `bufname`
- `[N] CTRL-W CTRL-^` and `[N] CTRL-W ^` split the current window and edit buffer N
- `:vsplit` and `CTRL-W CTRL-V` and `CTRL-W v` split the current window in two, vertically
- `:new` and `CTRL-W CTRL-N` and `CTRL-W n` create a new empty window
- `:vnew` creates a new empty window, split vertically
- `:split file` and `:new file` open `file` in a new window
- `CTRL-W CTRL-]` and `CTRL-W ]` split the window and jump to the tag under the cursor
- `CTRL-W CTRL-F` and `CTRL-W f` split the window and edit the file under the cursor
- `CTRL-W F` splits the window and edits the file and line number under the cursor
- `:all` opens a window for each open file
- `:quit` and `CTRL-W CTRL-Q` and `CTRL-W q` close the current window
- `:only` and `CTRL-W CTRL-O` and `CTRL-W o` close all windows except the current


---

- `CTRL-W CTRL-(HJKL)` and `CTRL-W (hjkl)` move the cursor to another window
- `CTRL-W =` makes all windows equal size
- `CTRL-W -` makes the current window shorter
- `CTRL-W +` makes the current window taller
- `CTRL-W _` makes the current window as tall as possible
- `CTRL-W >` makes the current window wider
- `CTRL-W <` makes the current window narrower
- `CTRL-W |` makes the current window as wide as possible


---

See `:help windows.txt`.

---
## Tab Pages

A tab page holds one or more windows.
You can easily switch between tab pages, so that you have several collections
of windows to work on different things.

The `-p` command-line option will cause Vim to open a tab page for each file on the command line.

---

- `:tabs` lists tab pages and the windows they contain
- `:tabnew` creates a new tab page
- `:tabedit file` opens a file in a new tab page
- `:tab cmd` executes `cmd` and when it opens a new window open a new tab page instead
- `:tab all` opens a new tab page for each file given on the command line
- `CTRL-W gf` opens a new tab page and edit the file under the cursor
- `CTRL-W gF` opens a new tab page and edit the file and line under the cursor
- `CTRL-W T` moves the current window to a new tab page
- `:tabclose` closes the current tab page
- `:tabonly` closes all other tab pages


---

- `:tabnext` and `gt` go to the next tab page
- `:tabnext {count}` and `{count}gt` go to tab page `{count}`
- `:tabprevious` and `gT` go to the previous tab page
- `:tabprevious {count}` and `{count}gT` go `{count}` tab pages back


---

- `:tabmove [N]` moves the current tab page after tab page N
- `:tabmove +[N]` and `:tabmove -[N]` move the current tab page relative to its current position

---

See `:help tabpage.txt`

---
## Vimdiff

Diff mode is used to compare two to four files side-by-side.
You can run Vim in diff mode by running `vimdiff file1 file2`
or `vim -d file1 file2`.
You may also use `gvimdiff` or `vim -d -g`.  The GUI is started then.
You may also use `viewdiff` or `gviewdiff`.  Vim starts in readonly mode then.

This only works when a standard `diff` command is available.
See `:help diffexpr`.

See `:help diff.txt`

---
## Runtime Configuration

When Vim runs, it reads and executes an "rc" file.
This file is used to store user settings.
By default, this is a file called `.vimrc` or `_vimrc` in your `$HOME` folder.
(Run `:help .vimrc` for more info on where Vim searches for this file).

There are many settings which can be overridden in the rc file,
including `:set` options and key bindings.
If [filetype detection](#filetypes) is enabled, then you can use the `:autocmd`
command to set filetype-specific settings.

When running GVim or EVim, they will also load the `.gvimrc`
(after loading the `.vimrc`).
This can be used for GUI-specific startup commands (e.g. disabling the mouse).

I have included excerpts of my `.vimrc` and `.gvimrc` files for reference.

---
## Filetypes

Vim can perform syntax coloring/highlighting for various file types.
To enable this, run the command `:syntax enable`.
This will keep your current color settings, which can be changed with `:highlight`.
If you want Vim to overrule your color settings, use `:syntax on`.
It may be useful to have one of these in your `.vimrc`.

---

The `filetype` option allows Vim to customize settings for various types of files.
Use `:filetype on` to enable filetype detection.
With filetype detection enabled, you can register autocommands to execute when
certain types of files are loaded.
This is done using `:autocmd` (and is often done in your `.vimrc`).

Vim indentation plugins are used to load different automatic indentation
settings based on the file type.
Use `:filetype indent on` to enable this.

Vim filetype plugins are used to load settings and key bindings for specific
file types.
To enable loading plugins, use `:filetype plugin on`.

You can combine filetype detection, plugin settings, and indentation settings
using `:filetype plugin indent on`.

You can install new syntax, filetype, and indentation settings in the folder
`~/.vim/` (UNIX) or `%USERPROFILE%\vimfiles` (Windows).

Note that filetype plugins will override settings in your `.vimrc`.
You can over-override your plugins with plugins stored in
`~/.vim/after/` (UNIX) or `%USERPROFILE%\vimfiles\after` (Windows).

The `:filetype detect` command will cause Vim to detect the filetype of the
current file (if you opened an empty file and started writing).

---
## QuickFix Mode

QuickFix mode enables Vim to parse the output of programs and open the files and lines mentioned in the output.
The most common use is to parse compiler errors and jump to the offending lines.

You can save the compiler output and start Vim using the `-q` option:

```sh
$ g++ *.cpp > errors.txt || echo "there were errors, see errors.txt"
$ vim -q errors.txt
```

An easier way to do this is to use the `:make` command.
See [Compiling Code](#compiling-code) below.

The `errorformat` option should be set to match the error messages from your
compiler (see `:help errorformat`).

---

- `:cc` displays and jumps to the current error message
- `:cnext` displays and jumps to the next error message
- `:cprevious` displays and jumps to the previous error message
- `:clist` lists all recognized errors
- `:clist!` lists all errors (this will also contain context from the compiler output)
- `:copen` opens a new window containing the list of errors (this will also contain context from the compiler output). Press `<Enter>` to jump to the error under the cursor.
    - `CTRL-W <Enter>` opens a new window and jumps to the error there
    - `:cclose` closes the quickfix window
- `:cfile` re-reads the error file and jumps to the first error
- `:cfile filename` reads error file `filename`
- `:cgetfile [filename]` is like `:cfile`, but does not jump to the first error
- `:cquit` quits Vim with an error code, so that the compiler can abort (if the compiler opened Vim to correct the errors)


---

See `:help quickfix.txt`

---
## Compiling Code

The `:make` command can be used to compile programs.
The name comes from [Make](https://en.wikipedia.org/wiki/Make_(software)),
but you can use other build tools.
To do so, set the `makeprg` option to the name of your build tool 
(e.g. `:set makeprg=ant`)
(This is best done using `:autocmd` in your `.vimrc`)
(You could also write a `Makefile` so make can run your compiler,
which is what make is for).

Running `:make` will cause Vim to save the output and enter quickfix mode.
Make sure you set `errorformat` before running `:make`
(e.g. in your `.vimrc`, or via a [compiler plugin](#compiler-plugins)).

See `:help :make_makeprg`

---
## Compiler Plugins

Compiler plugins are used to set the `makeprg` and `errorformat` options for
specific compilers.
You can install new compiler settings in the folder `~/.vim/compiler` (UNIX)
or `%USERPROFILE%\vimfiles\compiler` (Windows).

Use `:compiler name` to load a compiler plugin.

See `:help compiler-select`

---
## Browsing Folders

Vim includes a standard plugin for browsing folders.
To use it, simply edit a folder (e.g. by specifying a folder name on the
command-line or using `:edit`).
This plugin can also be used to browse FTP sites and network shares
(the URL **must** end with a `/`).

---

- `:Explore` opens the directory containing the current file. If the file has unsaved changes, the directory will open in a new window.
- `:Explore {dir}` opens the directory containing `dir`. If the current file has unsaved changes, the directory will open in a new window.
- `:Sexplore` always opens the directory in a new window
- `:Lexplore` always opens the directory in a new window on the left side of the tab page
- `:Texplore` always opens the directory in a new tab page
- `:Rexplore` toggles between the previously-viewed file and the previously-viewed directory


The above commands (except `:Rexplore`) can also be given a pattern for searching for files.
See `:help netrw-star`.
Use `:Nexplore` and `:Pexplore` or `SHIFT-<Down>` and `SHIFT-<Up>` to scroll through the list of matches.

---

- `<Enter>` makes Vim enter the directory or edit the file under the cursor
- `o` enters the file/directory in a new window
- `P` enters the file/directory in the last used window
- `v` enters the file/directory in a new window, using a vertical split
- `t` enters the file/directory in a new tab page
- `u` goes to the previous directory

---

- `s` changes the sorting style (by name, by time, by size)
- `r` reverses the sorting order

---

- `R` renames a file or directory
- `d` creates a new directory
- `D` attempts to delete a file or directory

---

- `i` cycles between thin, long, wide, and tree listings
- `c` makes the viewed directory Vim's current directory (i.e. it makes Vim `:cd` into that directory)
- `CTRL-L` refreshes the directory listing
- `qf` displays information on the file under the cursor

---

See `:help netrw-browse` and `:help pi_netrw.txt`

