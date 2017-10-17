# Microservices Reddit

* [Run application with Docker Compose](#run-application-with-docker-compose)
* [Run application without Docker Compose (only with Docker)](#run-application-without-docker-compose-only-with-docker)
* [Use application](#use-application)

This project allows you to deploy the Reddit application in docker containers
on your machine.   
Your data will be stored on "reddit_db" volume.   
Read about the installation of Docker [here](https://docs.docker.com/engine/installation/).

## Run application with Docker Compose

[Install Docker Compose](https://docs.docker.com/compose/install/#install-compose)

This command will start four containers with Reddit application.

```bash
docker-compose up -d
```

Stop application:

```bash
docker-compose down
```

## Run application without Docker Compose (only with Docker)

Preparing docker containers with the application:

```bash
docker build -t advu/comment:2.2 comment/
docker build -t advu/post:2.2 post-py/
docker build -t advu/ui:3.1 ui/
```

Run application:

```bash
./run_containers.sh
```

Stop application:

```bash
docker stop ui comment post mongo_db
```

## Use application

Enter in browser `http://<your-machine>:9292/` and enjoy.
