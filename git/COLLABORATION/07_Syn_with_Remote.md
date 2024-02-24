# Segment 7. Sync up with your remote

### switch back to main
```
git switch main
```

### check the branches
```
git branch -a
```

### we see something like
```
 main
  my_first_branch
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/my_first_branch
```

### update the info from the origin in GitHub
```
git fetch --prune
```

### check again the branches
```
git branch -a
```


### now you see the fremote branch is deleted and also delete on you computer
```
* main
  my_first_branch
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
```

### also check no more refernces with git logg --oneline
```
git log --oneline
```

### Now we delete the branch
```
git branch -d my_first_branch
```

### To force we use
```
git branch -D my_first_branch
```


### check the branches
```
git branch -a
```

### check again the brances you see
```
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
```

### update the main
```
git pull
```


### check again the log
```
git log --oneline
```
