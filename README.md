# Vim Notes
Vim is **modal**

- **Normal** mode maps each key to an editing command
- **Insert** mode is used to enter text

---

- GVim is Vim in a GUI.
    - a GUI terminal might intercept keystrokes that it understands;
      GVim only understands vim commands.
- EVim is GVim in "easy mode".
- Easy mode can also be run using `vim -y` in the terminal
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

- When in Insert mode, use `Ctrl-P` to quickly enter words that appear elsewhere in the document

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

- `q` followed by a buffer will record all following commands to the buffer (use `q` to stop recording)
- `@` followed by a buffer will execute the contents of the buffer as commands
    - Prefix `@` with a count to execute the macro multiple times.


Note that these commands use the same buffers as `p`, `y`, and `d`.
This means that you can use `qa` to record into buffer `a`, then `"ap` to paste
the commands entered; or use `"ayy` to yank a line into buffer `a`, then `@a`
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


