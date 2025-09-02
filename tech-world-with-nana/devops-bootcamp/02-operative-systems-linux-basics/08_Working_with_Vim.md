### 8 - Working with Vim Editor
```bash
sudo apt update
sudo apt install vim -y

# 2 modes in vim
# Command Mode: default mode, can't edit the text, all typed is interpreted as a command as navigate, search, delete, undo.
# Insert Mode: Allows to enter text
# To Write, type i in the command mode
# To return to command mode press esc
# To save and quite, press esc :wq then enter
# To quit without saving changes type :q!
# To delete many lines, for example 10 , esc (command mode) then d10d, change 10 for the number of lines to delete
# To undo changes press esc and type u
# Type A, this go to end of the line and change to insert mode
# Type 0, this go to begining of the line  
# Type $  this go to the end of the  line
# To go to line 12 type the 12 or the number line then G.  12G
# To search in Command Mode type / then the word to find then enter.  Eg nginx  /nginx  and then enter
# Type n to go to the next match
# Type N to go to the previous match
# To replace some pather :%s/OLD_WORD/NEW_WORD  then enter Eg.   :$s/nginx/web-app   then enter

```
