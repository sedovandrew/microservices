# Microservices Reddit

* [Run application with Docker Compose](#run-application-with-docker-compose)
* [Use application](#use-application)
* [Montoring services with Prometheus](#montoring-services-with-prometheus)
* [Build containers youself](#build-containers-youself)

This project allows you to deploy the Reddit application in docker containers
on your machine.   
Your data will be stored on "reddit_db" volume.   
Read about the installation of Docker [here](https://docs.docker.com/engine/installation/).

## Run application with Docker Compose

[Install Docker Compose](https://docs.docker.com/compose/install/#install-compose)

Set environments:

```bash
source ./env.sh
```

This command will start four containers with Reddit application and one with
Prometheus for monitoring:

```bash
docker-compose up -d
```

Stop application:

```bash
docker-compose down
```

## Use application

Enter in browser `http://<your-machine>:9292/` and enjoy.

## Monitoring services with Grafana

`http://<your-machine>:3000`

## Monitoring services with Prometheus

Enter in browser `http://<your-machine>:9090/`.

Metrics:

* ui_health
* ui_health_comment_availability
* ui_health_post_availability
* comment_health
* comment_health_mongo_availability

## Monitoring docker containers with cAdvisor

`http://<your-machine>:8080`

## Build containers youself

Docker images are on the docker hub.
But if you want to collect them yourself, then do the following.

Container with UI application:

```bash
cd ui
bash docker_build.sh
```

Container with Comment application:

```bash
cd comment
bash docker_build.sh
```

Container with Post application:

```bash
cd post-py
bash docker_build.sh
```
