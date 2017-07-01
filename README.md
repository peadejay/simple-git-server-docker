# simple-git-server-docker
A simple SSH Git server for Docker.

#### To build locally and run:
```
docker build -t simple-git-server .
docker run -d -p 2022:22 --name simple-git-server simple-git-server
```

#### To pull from Docker Hub and run:
```
docker pull peadejay/simple-git-server-docker
docker run -d -p 2022:22 --name simple-git-server peadejay/simple-git-server-docker
```

#### Once running, to login:
```
ssh git@127.0.0.1 -p 2022
```
using the default password "changeme" - don't forget to change this using the ```passwd``` command

#### When logged in, to create a new repository:
```
mkrepo <repo-name>
```
where ```repo-name``` is the name of the repository you want to create

#### To push to the server:
```
git remote add origin ssh://git@127.0.0.1:2022/repos/<repo-name>.git
git push -u origin master
```

#### To clone from the server:
```
git clone ssh://git@127.0.0.1:2022/repos/<repo-name>.git
```
