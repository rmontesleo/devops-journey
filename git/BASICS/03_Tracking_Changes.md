
### Check the status of your git repository
```
git status
```

### create a simple file
```
touch README.md
```

### check the status, and see the file is untracked
```
git status
```

### adding a specific files
```
git add README.md
```

### check the status, to verify the file is on stage area
```
git status
```

### Without -m flag we enter in the default editor to write comments
### Add specifics comments about your commit
```
git commit
```

### Check again the status
```
git status
```

### Edit your file and add some text
```
vim README.md
```

### Check again the status and see the differences
### You see the number of files affected and the number of lines added or removed
```
git status
```

### send the changes to the stage
### the .  is a shortcut to say , send to stage all changes in this folder
```
git add .
```

### Check againt the status
```
git status
```



### Add specifics comments about your commit with flag -m
```
git commit -m "Add content to our README.md file"
```

