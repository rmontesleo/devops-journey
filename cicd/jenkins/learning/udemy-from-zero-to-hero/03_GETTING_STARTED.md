
```bash
# in virtual machine
java -version

# go inside the container
docker exec -it jenkins bash
java -version
touch /tmp/hello
exit

# go again inside
docker exec -it jenkins bash
echo "Current dates is $(date)"


```

###
```bash
# create an script
vi script.sh

# set execution permitions
chmod +x script.sh

# copy some file inside a container copy the file script.sh in the container called jenkins into the tmp directory
docker cp script.sh jenkins:/tmp/script.sh
docker exec -it jenkins bash

```