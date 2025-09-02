# **Remotes**

### create and ssh key
```
ssh-keygen
```

### type the path where save the key and a name in this sample the name is mykey, and a file called mykey.pub  will be created
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
