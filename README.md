# bars83_microservices
bars83 microservices repository

## Homework #21 - Kubernetes-3
1) Services, kube-dns, nodePort, LoadBalancer, Ingress
2) Secret, TLS Termination) 
3) (*) manifest with secret for UI Ingress - `kubernetes/reddit/ui-ingress-secret.yml`
4) Network Policy
5) Volumes, PV, PVC, StorageClass

## Homework #20 - Kubernetes-2
1) Install `kubectl`
2) Install `Minikube`
3) Start Minikube cluster
4) Inspect `kubectl` context
5) Prepare reddit-app k8s mainfests - deployments, services
6) Play with namespaces
7) Setup Kubernetes Dashboard
8) Start GKE cluster
9) (*) - bootstrap GKE cluster using Terraform (`kubernetes/terraform`)
10) (*) - access to Kubernetes Dashboard:
    * install Dashboard - `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml`
    * create ServiceAccount and ClusterRoleBinding `kubectl apply -f dashboard/dashboard-adminuser.yaml`
    * Get dasboard access token - `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')`


## Homework #19 - Kubernetes-1
1) Describe reddit-app in Kubernetes manifests
2) Walked through [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
3) (*/2) - try not so hard way, using [prepared ansible playbooks](git@github.com:zlbabe/Kubernetes-the-hard-way-with-Ansible.git):
    * `git clone git@github.com:zlbabe/Kubernetes-the-hard-way-with-Ansible.git`
    * `cd Kubernetes-the-hard-way-with-Ansible`
    * `vagrant up`
    * `ansible-playbook k8s.yml`

 
  

----

Docker images placed in https://hub.docker.com/u/bars83/

## Homework #18 - Logging
1) Update reddit-app to looging-ready code
2) Add docker-compose-logging.yml to describe EFK (Elasticsearch+Fluentd+Kibana) services
3) Play with EFK structured logs
4) Set unstructured logs parsing
5) (*) - add fluentd `grok` pattern to parse UI service logs
6) Using Zipkin distributed tracing system
7) (*) - on [bugged-code](https://github.com/Artemmkin/bugged-code) Zipin traicing shows 3sec delay while getting post in `post` service. It seem that developer forget to remove `time.sleep(3)` on [line 167 of post-py/post_app.py](https://github.com/Artemmkin/bugged-code/blob/e16d0e6bfec61a04fc38734af8e0466ed6e64e76/post-py/post_app.py#L167). Zipkin tracing was very helpful to find this botleneck.

## Homework #17 - Monitoring-2
1) Separate docker-compose-monitoring.yml from base docker-compose file
2) Using cAdvisor to monitor docker containers
3) Using Grafana to metrics visualization - using dashboards from grafana.com, building custom dashboards
4) Using Alermanager for metrics alerting in Slack channel
5) (*) - update Makefile with new services
6) (*) - get Docker daemon metrics https://medium.com/p/e02a6a5745a/responses/show), add Grafana dashboard (id=1229)
7) (*) - using Telegraf to export Docker daemon metrics
8) (*) - set up Alertmanager rule to fire on too high response latency of UI service by 95th percentile
9) (**) - provision Grafana datasource and dashboards on container startup
10) (***) - proxy Grafana to Prometheus requests with Trickster for caching

## Homework #16 - Monitoring-1
1) Run Prometheus container
2) Monitoring Reddit microsevices with Prometheus
3) Using Node Exporter to get host metrics
4) (*) - MongoDB monitoring using https://github.com/percona/mongodb_exporter
5) (*) - play with Blackbox exporter (https://github.com/prometheus/blackbox_exporter)
6) (*) - play with Cloudprober exporter
7) (*) - add Makefile to automate images preparing, building and pushing

## Homework #15 - Gitlab CI
1) Bootsrap Gitlab with docker-compose
2) Setup Gitlab - create group and projects
3) Add Gitlab as remote for our microservices projects
4) Play with CI pipelines
5) Play with gitlab environments (static and dynamic)
6) (* task) - edit "build" job for docker image building
7) (** task) - provision gitlab runner with ansible using gcp inventory (iaac in `gitlab-ci/infra`)
8) (** task) - configure Slack notifications for Gitlab pipeline events

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
