# Docker
this file attempts to capture all of the things that I tend to forget about Docker.

## Build
Standard command:
```bash
docker build .
```
Where you've navigated to a repo with a Dockerfile in it

Always tag your images. This can be done with the `-t` flag:
```bash
docker build -t flask-sample-one:latest .
```
### Multiple Docker files
If you have many Dockerfiles in the same repo, you just need to specify which Docker file you want to run using the following command:
```bash
docker build . -f one.Dockerfile
docker build . -f two.Dockerfile
```
The `-f` or `—file` flag means that we are specifying which file we want to use.

## Run

remember that the Docker container will run until it is complete and then it will stop. In order to make sure that it doesn't simply shut down, you can background the task.

### Important Flags

### Cross Platform
Remember that you might run these commands on either a unix or Windows machine, and so some of the short cuts won't always work. However powershell does try to make up for the discrepencies

## Restart
If you shut down Docker, or you don't explicitly tell the Docker container to remove itself after running (with the `--rm` flag) then the docker container will still be there.

## Cleaning up
Both images and containers can be left lying around, taking up space on your hard drive. THese are called 'dangling' where the containers don't have a tag or label.

### Images
Remove all images with a particular flag (e.g. `<IMAGE_TAG_NAME>`):
```bash
docker image rm $(docker image ls | grep <IMAGE_TAG_NAME> | awk '{print $3}')
```

Get rid of images that don't have a tag:
```bash
docker rmi $(docker images -f dangling=true --format "{{.ID}} ")
```
### Containers
Stop running container
```bash
docker kill $(docker ps -a | grep flask-sample-one | awk '{print $1}')
```

Remove stopped container
```bash
docker rm $(docker ps -a | grep flask-sample-one | awk '{print $1}')
```
### General
If you really want to clear up everything on your machine, use:
```bash
docker system prune
```
Remove any stopped containers and all unused images (not just dangling images), add the -a flag to the command:
```bash
docker system prune -a
```

## Resources
[On removing docker images and containers](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)
[On formatting output from Docker](https://docs.docker.com/engine/reference/commandline/images/#format-the-output)
