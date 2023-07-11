# Termpop
An elisp script to launch your favorite terminal in a new bottom window, emulating the behaviour of other IDEs like VSCode or Atom

## Features
* Termpop can be used with vterm for now, but you can modify the code in order to support your favorite terminal application like `term`.
* When you launch `termpop` as a command or shorcut the script will divide horizontally one vertical window into two windows, the smallest bottom window will load vterm, and if its already loaded, focus will jump to that window.

## Future work
* For now Termpop just opens with horizontal divition, vertical divition is not supported yet and will be supported later.
* ~~When you exit vterm the window remains opened, so in the future termpop will colse his former window.~~
* Termpop have to be finally designed to work in the bottom window, if the frame is already divided into two or more windows, termpop have to be lauched in the last bottom window and not do any furter division.
