# Docker Ubuntu SSH enabled

Repo in docker hub: https://hub.docker.com/repository/docker/shahjalalh/ubuntu-ssh

**username**: root **password**: admin1234

```
$ docker build -t shahjalalh/ubuntu-ssh:1.0 .

# running docker
$ docker run shahjalalh/ubuntu-ssh:1.0

# to get the ip
$ docker ps
$ docker inspect 6ab

# connecting through ssh with password
$ ssh shahjalal@172.17.0.9
```
