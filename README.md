# Microservices Reddit

## Build containers

```bash
docker build -t advu/comment:2.2 comment/
docker build -t advu/post:2.1 post-py/
docker build -t advu/ui:3.1 ui/
```

## Create data volume

```bash
docker volume create reddit_db
```

## Run application

```bash
./run_containers.sh
```
