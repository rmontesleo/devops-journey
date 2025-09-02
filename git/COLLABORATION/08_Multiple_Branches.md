# Segment 8. Multiple branches


### swtich and create a new branch
```
git switch -c my-first-stash
```

### create a new branch with checkout
```
git checkout -b my-second-stash
```

### check the branches
```
git branch -a
```


### cchek status again and check the branches
```
git status 
```

### Do some changes in main, then save your changes, make a commit
```
git status
git diff
git add .
git status
git diff
git diff --staged
git commit -m "commit before go to my-first-stash"
git status
```

### then switch to my-first-stash
```
git switch my-first-stash
```

### in my-first-stash make some changes  in some file... then try to swith to main
```
vim README.md
```

### try to swit to main
```
git switch main
```

### use stash to create a temp commit and switch of branch
```
git stash
```

### check log with graph 
```
git log --oneline --graph --all
```

### move to main
```
git switch main
```

### return to my-first-stash
```
git switch my-first-stash
```

### check if exist some change to get back
```
git stash list
```

### get all temporal changes
```
git stash pop
```

### if you dont require any more the changes in stash you clear it
```
git stash clear
```

### now , we are goint to synchronize the code
### push the changes of main
```
git push origin main
```

### rename a branch
```
git branch -m my-first-stash mfs
```

### check the changes of rename the branch
```
git branch -a
```

### swithc to mfs and push the changes
```
git switch mfs
git push origin mfs
```

### execute you pull request to merge changes
