# simple-git-server-docker
A simple SSH Git server for Docker.

#### To build:
```
docker build -t simple-git-server .
```

#### To run:
```
docker run -d -d 2022:22 --name simple-git-server simple-git-server
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
