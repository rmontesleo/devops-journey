## This is original version

# Git Basics

### first check you get git in your system
```
git --version
```

### See the configurations of git. To out of the list press the letter q  (of quit)
```
git config --list
```

### set your name and email in your own computer. And if you have only one account 
```
git config --global user.name "<Your Name>"
git config --global user.email "<YOUR_EMAIL>"
```

### If you have multiple projects and multiple creddential
```
git config  user.name "<Your Name>"
git config  user.email "<YOUR_EMAIL>"
```

### Some options to define the default editor for git
```
git config --global core.editor "vim"
git config --global core.editor "emacs"
git config --global core.editor "nano -w"
```

### Init your git repository, create a .git folder. 
### Remember only one .git folder is required
```
git init
```

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

### Add specifics comments about your commit with flag -m
```
git commit -m "Add content to our README.md file"
```

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


### See all the differences with diff
```
git diff
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

###
```
git log --oneline
```

### create two directories, but empty folders are not tracked by git
```
mkdir data analysis
```

### check your project
```
git status
```

### create a file in data folder
```
touch analysis/file.py
```

### if you dont have yet a content, but you want to enforce a folder structure you can
### .gitkeep is a convention to track the folder
```
touch data/.gitkeep
```

### now create a csv file
```
touch data/my_data.csv
```


### we can say to git , ignore these files/folders. This is created in the root folder of our project
```
touch .gitignore
```


### we can say exact name or use wild cards
```
*.log
*.pdf
*.csv
```

## **Remotes**

### create and ssh key
```
ssh-keygen
```

### type the path where save the key and a mykey.pub file will be created
```
/home/user/.ssh/mykey
```
### check you public key
```
cat /home/user/.ssh/mykey.pub
```

### set your key on github
```
1 - go to profile
2 - go to settings
3 - go to ssh and gpd keys
4 - new ssh key
5 - paste the content of your key and add a title
6 - save the key
```

### Create and empty repoditory on GitHub

### TO connect with the repository use http or ssh, copy the required one. Change the instructions to connect with git


### connecto with local repository with GitHub
### remote
### add
### origin : 
```
git remote add origin <URL_OR_SSH>
```

### check the remote response correctly
```
git remote -v
```

### now we push our code the first time
```
git push origin main
```

### edit directly on git with the button `Edit this file`

### then get (pull) the changes from GitHub
```
git pull origin main
```

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
git pull
```

```
Auto-mergin README.md
CONFLICT (content): Merge conflic in README.md
Automatic merge failed; fix confics and then commit the result.
```

### the pattern you must see to fix  are `<<<<<<` ,  `====` and  `>>>>`
### Git does not what is the correct  code, you work is fix , add, remove the correct content

