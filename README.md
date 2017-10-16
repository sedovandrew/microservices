# Microservices Reddit

This project allows you to deploy the Reddit application in docker containers
on your machine.

## Build containers

Preparing containers with the application.

```bash
docker build -t advu/comment:2.2 comment/
docker build -t advu/post:2.2 post-py/
docker build -t advu/ui:3.1 ui/
```

## Create data volume

Your data will be stored on this volume.

```bash
docker volume create reddit_db
```

## Run application

This command will start four containers with Reddit application.

```bash
./run_containers.sh
```
## Use application

Enter in browser `http://<your-machine>:9292/` and enjoy.
