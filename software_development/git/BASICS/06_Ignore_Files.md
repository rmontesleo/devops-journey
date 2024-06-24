# Ignore Files

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
