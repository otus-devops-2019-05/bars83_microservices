# bars83_microservices
bars83 microservices repository
## Homework #14 - docker #4
1) Working with different docker network types - none, host, bridge
2) Use docker-compose to run containerized reddit app
3) Docker compose default project name use current folder and folder with service description names. To set docker-compose project name use `-p` parameter, e.g.: `docker-compose -p reddit up -d`
4) Write docker-compose.override.yml to override some service parameters (e.g. volumes, commands)

## Homework #13 - docker #3
1) Write Dockerfile for each service
2) Using ENV (-e) on `docker run` command
    * e.g. `docker run -d --network=reddit --network-alias=my_comment -e COMMENT_
DATABASE_HOST=my_comment_db <your-dockerhub-login>/comment:2.0`
3) Use apline-based images to optimize srvices images
4) Use docker volume to store state
5) Use hadolint for Dockerfile's linting:
    * e.g. `docker run --rm -i hadolint/hadolint < ./comment/Dockerfile`

## Homework #12 - docker #2
1) Playing with docker
2) Using docker-machine with GCE
3) * - IaaC using Ansible+Packer+Terrafor to start dockerized reddit-app in GCE
