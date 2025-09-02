### 7 - Package Manager - Installing Software on Linux
```bash

# Install Sofware by package manager tool
# APT - Advance Package Tool

#  get information about this tool
apt 

# search about java with apt tool
sudo apt search openjdk

# you can install one or more installed programs with apt (names separated by a space)
# you can remove some package with apt remove <package_name>

# Difference between 
# APT : progress bar, some friendly options 
# APT-GET: more specifict output in console no progress bar

#
sudo apt update

# see the folder with configurations for apt package manager
ls /et/apt

# see the content of file with sources list for apt package manager
cat /etc/apt/sources.list

# Other pacakge manager tools
# 1) Ubuntu Software Center
# 2) Snap Package Manager: newer
# 3) Add reposigtory to official list of repos (add-apt-repository)

# Differences 
# Snap: is self-containded, dependencies are containded in the package, automatic updates, support packages(like .snap), larger files
# APT: dependencies are shared, manual update, only for specifica linux distribution (like .deb), smaller files, dependency is shared across applications.

# Add repository: 
# - When installing relatively new application
# - which are not official repositories yet (example add the docker repository  to APT sources)

# PPA : Personal Package Archive
# PPAs are provided by the community, sometimes not verified,
# Anybody can create this PPA, private repository to distribute the software
# Usually used by developers to provide update more quickly than in the official Ubuntu repositories
# BE AWARE, by posible risks


# Linux Distros grouped, based on same source code
# Distros in same category, use the same package manager

# Debian based -  ubuntu, debian, mint - apt , apt-get
# Red Hat based - RHEL, CentOS, Fedora - yum, dnf




```