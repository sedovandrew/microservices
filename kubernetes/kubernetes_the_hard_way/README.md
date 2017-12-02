# Kubernetes the hard way

## Create Kubernetes cluster

```bash
bash 02-client-tools.sh
bash 03-compute-resources.sh
```

Wait until the resources are ready. Then:

```bash
bash 04-certificate-authority.sh
bash 05-kubernetes-configuration-files.sh
bash 06-data-encryption-keys.sh
bash 07-bootstrapping-etcd.sh
bash 08-bootstrapping-kubernetes-controllers.sh
bash 09-bootstrapping-kubernetes-workers.sh
bash 10-configuring-kubectl.sh
bash 11-pod-network-routes.sh
bash 12-dns-addon.sh
```

## Deploy Reddit Application

```bash
kubectl apply -f ../../mongo-deployment.yml
kubectl apply -f ../../comment-deployment.yml
kubectl apply -f ../../post-deployment.yml
kubectl apply -f ../../ui-deployment.yml
```

## Remove kubernetes cluster

```bash
bash 14-cleanup.sh
```
