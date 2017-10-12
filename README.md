# Microservices Reddit

## Build containers

```bash
docker build -t advu/comment:2.1 comment/
docker build -t advu/post:2.0 post-py/
docker build -t advu/ui:2.0 ui/
```

## Create data volume

```bash
docker volume create reddit_db
```

## Run application

```bash
./run_containers.sh
```
