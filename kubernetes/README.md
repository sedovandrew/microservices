# Reddit application in development environment

For deployment Reddit application in GCP you have to install
[terraform](https://www.terraform.io/intro/getting-started/install.html)
and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

## Creating Kubernetes Cluster

Configuring terraform:

```bash
cd kubernetes/terraform/dev
cp terraform.tfvars.example terrafrom.tfvars
```

Edit `terraform.tfvars` with your data.

Create Kubernetes Cluster in GKE with Terraform:

```bash
cd kubernetes/terraform/dev
terraform apply
```

## Deployment of the application

Create "dev" namespace and deploy Reddit application in "dev" namespace:

```bash
cd kubernetes
kubectl apply -f dev-namespace.yml
kubectl apply -f ./ -n dev
```

Create key and certificate:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=$(kubectl get ingress -n dev ui -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"
```

Configure tls secret with your `tls.crt` and `tls.key`:

```bash
cat ui-ingress-secret.yml.example | sed "s/TLS_CRT/$(cat tls.crt | base64 | tr -d '\n')/" | sed "s/TLS_KEY/$(cat tls.key | base64 |tr -d '\n')/" > ui-ingress-secret.yml
```

Apply tls secret:

```bash
kubectl apply -f ./ui-ingress-secret.yml -n dev
```

## Using the application

Get application IP (if nothing prints out, wait and try again):

```bash
kubectl get service -n dev ui -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

Copy IP address and paste it in browser. Ese `https` protocol. Enjoy the Reddit application. :-)

## Destroy resources

To remove the application with infrastructure components, type the following.

```bash
cd kubernetes
kubectl delete -f ./dev-namespace.yml
```

```bash
cd kubernetes/terrafrom/dev
terraform destroy
```
