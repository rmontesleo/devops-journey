# Collaboration

## Setup you environment

### Create a git project on GitHub
```
```

### Create a local folder and clone your repository
```
```

---

## Segment 1. Creating branches

### Create a new branch
```
git branch my_first_branch
```

### Check you have the new branch
```
git log --oneline
```

### Switch to the new branch
```
git switch my_first_branch
```

### in some previous versions of git you have to use checkout to switch of branch
```
git checkout my_first_branch
```


### check what happened
```
git log --oneline
```
---

## Segment 2. Making commits in branches

### Type some changes in your files and the, execute the git flow to commit
```
git add .
git commit -m "udpating files, but this time in branch"
```

### check 
```
git log --oneline --graph --all
```

---

## Segment 3. Moving around different branches

### returning to main. If you didnt commit your changes, git does not allow you to switch
```
git switch main
```

### check the content of main

### check the logs in main
```
git log --oneline
```

### return to first branch
```
git swith my_first_branch
```

---

## Segment 4. Merging branches

### Open your pull request

1 - click on branch link
2 - you see all branches. Select the branch you want to do the pull request
3 - press the button `New pull request` of selected branch.
4 - Select the branch target and the branch to merge
5 - add title and description of your pull request
6 - review the differences. 
7 - verify the changes, review the code and avoid to put passwords or sensible data.
8 - click on button `Create pull request`


---

## Segment 5. Merging branches with remotes and Segment 6. Pull requests (aka merge requests)

### review the pull request. Start your **Code Review**
1 - reviw the changes and the request.
2 - you can see the commits in the pull request
3 - add comments in the points that are required
4 - if everything is OK, add a coments and accept the pull request
5 - add more comments.
6 - if it is not required, delete the branch.
---

--

## Segment 7. Syncing up with your remote

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


### check again the log
```
git log --oneline
```


---

## Segment 8. Multiple branches


### swtich and create a new branch
```
git switch -c my-first-stash
```

### create a new branch with checkout
```
git checkout -b my-second-stash
```

### cchek status again and check the branches
```
git status 
```

### save your changes in main, make a commit and then switch to my-first-stash

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

### list get back the temporal commit
```
git stash list
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

---

## Segment 9. Incorporating hot fixes

### switch to mfs
```
git switch mfs
```

###  Next scenario.  Rebase
```
git fetch --prune
```

### check log with graph 
```
git log --oneline --graph --all
```

### switch again to main
```
git switch main
```

### update the main
```
git pull origin main
```

### switch to stash
```
git switch mfs
```

### execute the rebase
```
git rebase main
```

### now fix the problems in local

### check the status and see the options to fix the rebase or return to previous state
```
git status
```

### if everything is ok continue
```
git add .
git commit -m "solving issues"
git rebase --continue
git log --oneline --graph --all
```

### push the changes, to force update
```
git push origin mfs
```

### the make your pull request, then remove the remote mfs branch to make then a fetch
```
git fech --prune
git log --onelline --graph --all
```

### check the limit of each git file , in 2021 is 100MB
### check how to deploy and fix now in cloud

### check log history
```
git log --oneline  --graph --all
```

### Check about cherry pics

---

## Segment 10. Discuss how the skills you learned directly apply to collaboration with other people


1 - Go to settings
1 - Manage access
1 - invite collaborator
1 - got to settings again
1 - select Branches
1 - addd proteccion rules
1 - select the options your collaboratos can interact


### add changes to your file
```
vim README.md
```

### try to push your changes
### but you will be locked. Now the main branch is protected
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



---
