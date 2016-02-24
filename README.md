# Vim Notes

Vim can be downloaded from [vim.org](http://www.vim.org/).
The Windows installer is a self-extracting archive which does not require
administrator privileges to run (as long as you have permission to write to
the selected install folder).

---

Vim is **modal**

- **Normal** mode maps each key to an editing command
- **Insert** mode is used to enter text

---

- GVim is Vim in a GUI.
    - a GUI terminal might intercept keystrokes that it understands;
      GVim only understands vim commands.
- EVim is GVim in "easy mode".
- Easy mode can also be run using `vim -y` in the terminal
- Easy mode can also be activated using the Vim command `:set insertmode`.
  This also works in the command-line Vim.
  (see `:help evim-keys` for the full list of options that EVim uses).
- There are also "View" variants that open the file read-only

---

- In Vim/GVim, the program starts in Normal mode; use `i` to enter Insert mode and `ESC` to return to Normal mode
- In EVim, the program starts in Insert mode; use `Ctrl-L` to enter Normal mode and `ESC` or `i` to return to Insert mode

---

- When in Normal mode, use `:` to enter the Vim command-line
- Use `:w [filename]` to save a file
    - To save a file under a different name without overwriting the original, use `:saveas [filename]`
- Use `:q` to quit vim
- Use `:wq` or `ZZ` to save and close
- Use `:help` to read Vim's help

---
## Undo/Redo

- `u` undoes the previous command
- `Ctrl-R` redoes the last undo

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
## Completion

- When in Insert mode, use `Ctrl-P` to quickly enter words that appear elsewhere in the document. Use `Ctrl-P` and `Ctrl-N` to scroll through the list. Use `Ctrl-E` to cancel or `Ctrl-Y` to accept.
- When in Insert mode, use `Ctrl-X` to enter Insert mode completion. See `:help ins-completion`. Useful subcommands:
  - `Ctrl-X Ctrl-F`: Filename completion.
  - `Ctrl-X Ctrl-K`: Completion from one or more dictionary files.
  - `Ctrl-X Ctrl-K`: Completion from one or more thesaurus files.
  - `Ctrl-X s`: If spelling is enabled, complete spelling suggestions.
  - `Ctrl-X Ctrl-O`: Omni-complete. This allows for completion based on filetype. See `:help compl-omni-filetypes`.
  - When the popup menu is displayed, use `Ctrl-N` and `Ctrl-P` to scroll through the list.
  - `Ctrl-Y`: Accept completion.
  - `Ctrl-E`: Cancel completion.

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

- `f` followed by a character goes forward (right) to the next character (eg `fg` goes to the next g)
- `F` followed by a character goes back (left) to the previous character (eg `Fg` goes to the previous g)
- Prefixed with a number, goes to the nth character (eg `2fr` goes to the 2nd r after the cursor)

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
    - Prefixed with a number, goes to the nth line (eg `20gg` goes to line 20)
- `G` moves to the end of the document

---

- `{` and `}` jump over paragraphs. A paragraph is any block of text separated by a blank line

---

- `%` scans forward for a grouping character and jumps to the matching character

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
## Editing

- For nearly all editing commands, repeating the command character operates on the line under the cursor (eg `dd` deletes the line, `yy` copies the line, etc)
- `d` followed by a motion will delete characters (placing them in the default register)
- `y` followed by a motion will copy (yank) characters into the default register
- `p` will put the contents of the default register after the cursor
- `P` will put the contents of the default register before the cursor
    - The above commands can be prefixed with `"` followed by a register letter to operate on a specific register (eg `"add` will delete the line and place it in register a; `"ap` will then paste this register)
        - Also, with `y` and `d`, using a captial register letter will *append* to the register instad of overwriting it
    - Also note that the special register +g synchronizes with the system clipboard (eg `"+gp` will paste the clipboard contents; `"+gyy` will copy a line to the clipboard)
- `x` will delete the character under the cursor

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

---
## Other

- `.` repeats the last command
- `&` repeats the last `:s`

---
## Navigating help

- use `:help` to view vim's help
- use `:help <topic>` to jump to a topic
- You may notice some help text that is highlighed. These are tags. Position the cursor on the text and press `Ctrl-]` to jump to the tagged topic. Use `Ctrl-O` to return to the previous topic.
- use `:helpgrep <text>` to search for `<text>` in the help
    - use `:cn` to go to the next search result


---
## Scrolling

- `Ctrl-F` scrolls down one screen
- `Ctrl-B` scrolls up one screen
- `zt` places the current line at the top of the screen
- `zb` places the current line at the bottom of the screen
- `zz` places the current line at the middle of the screen
    - (This is not the same as `ZZ`, which saves and quits Vim)


---
## Runtime Configuration

When Vim runs, it reads and executes an "rc" file.
This file is used to store user settings.
By default, this is a file called `.vimrc` or `_vimrc` in your `$HOME` folder.
(Run `:help .vimrc` for more info on where Vim searches for this file).

There are many settings which can be overridden in the rc file,
including `:set` options and key bindings.

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

The `filetype` option allows Vim to customize settings for various types of files.
Use `:filetype on` to enable filetype detection.
With filetype detection enabled, you can register autocommands to execute when
certain types of files are loaded.
This is done using `:autocommand` (and is often done in your `.vimrc`).

Vim can use different automatic indentation settings based on the file type.
Use `:filetype indent on` to enable this.

Vim filetype plugins are used to store settings and key bindings for specific
file types.
To enable loading plugins, use `:filetype plugin on`.

You can combine filetype detection, plugin settings, and indentation settings
using `:filetype plugin indent on`.

You can install new syntax, filetype, and indentation settings in the folder
`~/.vim/` (UNIX) or `%HOME%\vimfiles` (Windows).

Note that filetype plugins will override settings in your `.vimrc`.
You can over-override your plugins with plugins stored in
`~/.vim/after/` (UNIX) or `%HOME%\vimfiles\after` (Windows).

The `:filetype detect` command will cause Vim to detect the filetype of the
current file (if you opened an empty file and started writing).

