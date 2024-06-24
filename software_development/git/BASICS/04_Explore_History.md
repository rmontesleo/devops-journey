
### see all the commits with the following inf
### commit : with a hash id with the HEAD (HEAD, is where we are)
### Author: the username and the mail of this user
### Date: the date when the commited was executed
```
git log
```

### we can see the log in a commpress manner
```
git log --oneline
```


### See all the differences and all files with diff
```
git diff
```

### See just differences on README.md
```
git diff README.md
```


### see the differences between HEAD and two commits ago.
### if you add lines you see the + sing in green color
### if you remove lines you see the - sign in red color
```
git diff HEAD~2 README.md
```

### if you know the id of the commit (from git log --oneline) , you can HEAD check against that
```
git diff <ID_FROM_ONE_LNE> <FILENAME>

git diff <ID_FROM_ONE_LNE> README.md
```

### now, the info in status have more sense
```
git status
```

### add the changes to staging area
```
git add README.md
```

### check status
```
git status
```

### check again diff.. you see nothing. Because the changes are on stage, not just in local file
### for git there no differences
```
git diff
```

### but if we want to know the things in staging area
```
git diff --staged
```

### commit again your changes
```
git commit -m  "<SOME MEANINGFULL COMMENT HERE, ABOUT THE CHANGE>"
```

###
```
git log --oneline
```
