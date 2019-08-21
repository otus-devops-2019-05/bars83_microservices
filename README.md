# bars83_microservices
bars83 microservices repository

## Homework #13 - docker #3
1) Write Dockerfile for each service
2) Using ENV (-e) on `docker run` command
    * e.g. `docker run -d --network=reddit --network-alias=my_comment -e COMMENT_
DATABASE_HOST=my_comment_db <your-dockerhub-login>/comment:2.0`
3) Use apline-based images to optimize srvices images
4) Use docker volume to store state
5) Use hadolint for Ddckerfile's linting:
    * e.g. `docker run --rm -i hadolint/hadolint < ./comment/Dockerfile`

## Homework #12 - docker #2
1) Playing with docker
2) Using docker-machine with GCE
3) * - IaaC using Ansible+Packer+Terrafor to start dockerized reddit-app in GCE
