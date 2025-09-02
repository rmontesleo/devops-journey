


```bash
# Resise some linux partition
sudo  mount -o remount,size=3G /tmp/
```

```bash
# Create user and home from jenkins
sudo useradd jenkins
sudo usermod -aG jenkins jenkins
```