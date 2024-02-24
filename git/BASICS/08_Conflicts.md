
## Solving complicts

### type somethig different directly on GitHub

### chec the log
```
git log --oneline
```

### type something in you local, and commit it, and try to pushh
### git shows you there are  some conflics
```
git add .
git commit -m "add new change"
git push
```

### you see something like
```
![rejected ] naub 0 -> main (fetch first)
...

hint: (e.g. , 'git pull ...') before pushing again.
```


### first pull from GitHub, but you see some aditional messages
```
git pull origin main
```

```
Auto-mergin README.md
CONFLICT (content): Merge conflic in README.md
Automatic merge failed; fix confics and then commit the result.
```

### the pattern you must see to fix  are `<<<<<<` ,  `====` and  `>>>>`
### Git does not what is the correct  code, you work is fix , add, remove the correct content

