# Microservices

Build application "Monolith Reddit":

```bash
docker build -t reddit:latest .
```

Run application:

```bash
docker run --name reddit -d --network=host reddit:latest
```
