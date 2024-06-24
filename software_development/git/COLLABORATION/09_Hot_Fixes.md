# Segment 9. Incorporating hot fixes

## Scenario 1

### switch again to main
```
git switch main
```

### Do some changes in main branch and add, commit and push the changes
```
git add .
git commit -m "some changes before rebase"
git push origin main
```

### return again to mfs branch
```
git switch mfs
```

### check log with graph 
```
git log --oneline --graph --all
```

### update the mfs from the main
```
git pull origin main
```

## Scenario 2

### switch to main
```
git switch main
```

### do some changes in the code 
### and again pull to GitHub
```
git add .
git commit -m "commit changes in main"
git push origin main
```

### return to mfs and get the last changes of remote mfs
```
git switch mfs
git pull origin mfs
```

### add changes in that branch and commit
```
git add .
git commit -m "changes in branch mfs"
git push origin mfs
```

### pull from main, but some conflics will appeared
```
git pull origin main
```

### we avoid changes with
```
git merege --abort
```

### execute the rebase
```
git rebase main
```

### Some conflics will appeard, but now fix the problems in local, adding our changes `AFTER` the main changes. Check the status and see the options to fix the rebase or return to previous state
```
git status
```

### After resolved, if everything is ok continue
```
git status
git add .
git rebase --continue
git log --oneline --graph --all
```

### push the changes, then request by a pull request
```
git push origin mfs
```

###  after your pull request was executed and removed the branch in remote, fetch to prune branches
```
git fetch --prune
git branch -a
git log  --oneline --graph --all
```

### remove the other branches
```
git branch -D mfs
git branch -d my-second-stash
```

### Check about cherry pics
### check the limit of each git file , in 2021 is 100MB
### check how to deploy and fix now in cloud
