# Docker 
this file attempts to capture all of the things that I tend to forget about Docker.

## Build

multiple Docker files

## Run

remember that the Docker container will run until it is complete and then it will stop. In order to make sure that it doesn't simply shut down, you can background the task.

### Important Flags

### Cross Platform
Remember that you might run these commands on either a unix or Windows machine, and so some of the short cuts won't always work. However powershell does try to make up for the discrepencies

## Restart
If you shut down Docker, or you don't explicitly tell the Docker container to remove itself after running (with the `--rm` flag) then the docker container will still be there. 

## Cleaning up
Both images and containers can be left lying around, taking up space on your hard drive. THese are called 'dangling' where the containers don't have a tag or label.