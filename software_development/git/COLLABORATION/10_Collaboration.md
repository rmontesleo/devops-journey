# Segment 10. Discuss how the skills you learned directly apply to collaboration with other people

1 - Go to settings.
1 - Manage access.
1 - Invite collaborator.
1 - Go to settings again.
1 - Select Branches.
1 - Add proteccion rules.
1 - Select the options your collaboratos can interact


### add changes to your file
```
vim README.md
```

### try to push your changes, but you will be locked. Now the main branch is protected
```
git add .
git commit -m "some changes"
git push origin main
```

### create a new branch and see the log
```
git switch  -c my_rebase
git log --oneline --graph --all
```

### remove all changes from current and sent to the required location
```
git reset --hard <LOCATION_BRANCH_ID>
```

### talkign about git flow
