
### type something "wrong" in the file, just to simulate , something wrong in the file
```
git status
```

### check the differences, and  now we see the "error"
```
git diff
```

### rollback that change
```
git restore README.md
```

### Type again something wrong in your file and directly add to the stage
```
git add .
```

### how you see nothing in local, check the differences in stages, and you see something you dont want commit.
```
git diff --staged
```

### if you need remove changes from stagin area.  This action take out the changes from stage area
```
git restore --staged README.md
```

### but the changes are in local, chack the status
```
git status
```

### to remove the changes, and restore the previos version use
```
git restore README.md
```


###  delete the file
```
rm README.md
```

### check the status
```
git status
```

### restore in local
```
git restore README.md
```

### delete again the file and commit it
```
git add README.md
git commit -m  "delete readme file"
```

### seee the log history
```
git log --oneline
```

### restore a deleted/commited file . To get back the file
### this is like go to the past copy that file, and paste it , get to the present. (like in endgame.. kind of :P)
```
git checkout <ID_OF_THE_COMMIT>  README.md
```

### check again the status, that file is get back from past, "paste it" in stage are
```
git status
```

### now we commit the file
```
git commit -m "undelete the readme file"
```
