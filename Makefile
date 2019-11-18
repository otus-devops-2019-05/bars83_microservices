DOCKER_USER = ${USER_NAME}
all: build push

build: post comment ui prometheus cloudprober
push: push_comment push_post push_ui push_prometheus push_cloudprober

post: 
	cd src/post-py && bash docker_build.sh
comment: 
	cd src/comment && bash docker_build.sh
ui: 
	cd src/ui && bash docker_build.sh

prometheus:
	cd monitoring/prometheus && docker build -t ${DOCKER_USER}/prometheus .
cloudprober:
	cd monitoring/cloudprober && docker build -t ${DOCKER_USER}/cloudprober .

push_post:
	docker push ${DOCKER_USER}/post
push_comment:
	docker push ${DOCKER_USER}/comment
push_ui:
	docker push ${DOCKER_USER}/ui

push_prometheus:
	docker push ${DOCKER_USER}/prometheus
push_cloudprober:
	docker push ${DOCKER_USER}/cloudprober
