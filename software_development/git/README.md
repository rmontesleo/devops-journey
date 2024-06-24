# Init Basics

- `git init`: initialize git repository in current working directory

- `git status`: gives you the status of each file in the project, gives branch name, if you have some commit, which files are tracked or untracked, files in staging area (ready to be commited).

- `git add <FILE>`: adds <FILE> to the staging area

- `git commit`: creates a commit, your provide message

- `git log`: shows you the log of your commits

- `git log --onelie`: shows you the on line version of log

- `HEAD`: Where you currently are (the version of the files on your computer)

- `git diff HEAD~<NUM> <FILE>`: Compares current file to file <NUMB> ago

- `git diff <HASH> <FILE>` : Compare current file to <HASH> version

- `git status` : To help you find the commands to unstage or restore

- `git checkout <HASH> <FILE>` : restore <FILE> TO VERSION IN <HASH>
    - if you run `git checkout <HASH>` without the <FILE>
    - You can fix this by running `git checkout main`


- git ignores emtpy folders
- use `.gitkeep` to "keep" and empty folder
- use `.gitignore` to ignore files/patterns


## Remotes

- `ssh-keygen` : to create ssh keys
- `git remote add <URL>` : adds the url
- `git push origin main`: push to the main branch to the origin remote
- `git pull origin main`: pull to the main branch from the origin remote
    
## Collaboration

- `git clone <URL>` : Clones/downloads the repo to your computer

- `git branc <NAME>` : creates a brnach called <NAME> where your are (HEAD)

- `git switch <NAME>`: move to the branch <NAME>
    - `git checkout <NAME>`: The "older" way to swtich branches
    - `git switch -c <NAME>` : Create and move to the branch <NAME>
    - `git checkout -b <NAME>` : also create and move to the branch  <NAME>

- `git stash` : will create a temp commit, that allow us switch to other branch
    - `git stash list` : show you the temp commits that are stashed
    - `git stash apply` : apply the last stash (pop)
    - `git stash clear`: remove all your stashes.

- `git rebase -b <BRANCH>`: Change the history and update current branch with <BRANCH>