# Neovim

- ctrl + s to horizontal
- ctrl + v to vertical
- Ctrl + Arrow to move lines
- Ctrl + S save file
- \> , < indent in visual mod
- Shift + J join lines
- Shift + Up/Down Arrow Scroll half and center
- Leader + d delete to black hole
- Leader + s Replace the word under cursor
- Leader + x make current file executable
- gD go to declaration
- gd go to definition
- K hover
- gi implementation
- leader + D type definition
- gr references
- leader + e open diagnostics float
- [d, ]d diagnostics prev/next
- leader + q loclist
- leader + ca code action
- leader + rn rename
- leader + dd diagnostics
- leader + dD buffer diagnostics
- leader + cs symbol
- leader + cl def/ref

- C-Space show doc or file preview
- C-e close
- C-b/f doc/file backwards/forwards
- C-k show signature

- A + htns harpoon file select
- leader + a add file to harpoon
- ctrl + ; open harpoon pop-up
- ctrl + , . prev, next file in the list

- A + o open telescope
- leader + fg ripgrep
- leader + fh help
- leader + fk keymaps
- leader + fu undo
- leader + ft todo

- A + f open oil
- - parent
- \_ cwd
- \` cd to folder
- ~ cd to folder tab
- g. toggle hidden

- <CR> enter link, create link
- tab next link
- Shift + Tab previous link
- [[/]] next and previous link
- BS opens last active buffer
- Del next buffer
- leader - p create link from clipboard
- +/- increase/decrease heading
- Ctrl - Space toggle to do
- tab / shift tab, table next cell
- leader + ir new row below
- leader + iR new row above
- leader + ic new col after
- leader + iC new col before

- s flash search
- S flash treesitter
- ; , increse decrease section.

- `gcc` - Toggles the current line using linewise comment Normal Mod
- `gbc` - Toggles the current line using blockwise comment Normal Mod
- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise Normal Mod
- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise Normal Mod
- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment Normal Mod
- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment Normal Mod

- `gc` - Toggles the region using linewise comment Visual Mod
- `gb` - Toggles the region using blockwise comment Visual Mod
- `gco` - Insert comment to the next line and enters INSERT mode
- `gcO` - Insert comment to the previous line and enters INSERT mode
- `gcA` - Insert comment to end of the current line and enters INSERT mode

### Linewise

- `gcw` - Toggle from the current cursor position to the next word
- `gc$` - Toggle from the current cursor position to the end of line
- `gc}` - Toggle until the next blank line
- `gc5j` - Toggle 5 lines after the current cursor position
- `gc8k` - Toggle 8 lines before the current cursor position
- `gcip` - Toggle inside of paragraph
- `gca}` - Toggle around curly brackets

### Blockwise

- `gb2}` - Toggle until the 2 next blank line
- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
- `gbac` - Toggle comment around a class (w/ LSP/treesitter support)

- leader + f to format
- resizing splits with arrow keys + alt + shift
- moving between splits with arrow keys + Ctrl
- swapping buffers with arrow keys + alt + shift

# WezTerm
- moving and resizing windows are same with neovim
- alt + c/v to copy paste
- alt + shift + s to open ncspot in another terminal
- ctrl +w close current pane
- alt + w close current tabe
- ctrl + shift + s/v to split
- shift+ctrl + 1..6 go to tabe
- ctrl/shift tab next prev tab
- alt / shift + tab move tab
- ctrl + pageup/pagedown scroll
- ctrl + shift + arrow up/down scroll by line
- ctrl + shift + x active copy mode v, shift + v, ctrl + v
- ctrl + shift + z zoom toggle
