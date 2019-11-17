DOCKER_USER = ${USER_NAME}
all: build push

build: post comment ui prometheus cloudprober alertmanager telegraf trickster
push: push_comment push_post push_ui push_prometheus push_cloudprober push_alertmanager push_telegraf push_trickster

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
alertmanager:
	cd monitoring/alertmanager && docker build -t ${DOCKER_USER}/alertmanager .	
telegraf:
	cd monitoring/telegraf && docker build -t ${DOCKER_USER}/telegraf .	
trickster:
	cd monitoring/telegraf && docker build -t ${DOCKER_USER}/trickster .	

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
push_alertmanager:
	docker push ${DOCKER_USER}/alertmanager
push_telegraf:
	docker push ${DOCKER_USER}/telegraf
push_trickster:
	docker push ${DOCKER_USER}/trickster


.PHONY: all build push post comment ui prometheus cloudprober alertmanager telegraf trickster push_post push_comment push_ui push_prometheus push_cloudprober push_alertmanager push_telegraf push_trickster
