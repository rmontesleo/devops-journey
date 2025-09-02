# Segment 3. Moving around different branches


### Do some changes in your code without do commit.

### Try to return to main. Git does not allow you switch, because you could loose your changes.
```
git switch main
```

### Commit your changes in this branch
```
git status
git diff
git add .
git status
git diff
git diff --staged
git commit -m "y mis 50,000 lineas de codigo. que?"
```

### Now you can switch to main
```
git switch main
```

### check the logs in main
```
git log --oneline
```

### return to first branch
```
git swith my_first_branch
```

### check your changes with vscode
```
code .
```

### push your code to github
```
git push origin my_first_branch
```