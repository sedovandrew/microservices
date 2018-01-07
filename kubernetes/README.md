# Reddit application in development environment

For deployment Reddit application in GCP you have to install
[terraform](https://www.terraform.io/intro/getting-started/install.html),
[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) and
[helm](https://docs.helm.sh/using_helm/#installing-helm).

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

Run Tiller server for helm:

```bash
cd kubernetes
kubectl apply -f filler.yml
helm init --service-account tiller
```

Create key and certificate (replace `reddit-application.ru` with your domain
name or IP address):

```bash
cd kubernetes
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout Charts/ui/tls_key.toml -out Charts/ui/tls_crt.toml -subj "/CN=reddit-application.ru"
```

Create "dev" namespace and deploy Reddit application in "dev" namespace:

```bash
cd kubernetes
kubectl apply -f dev-namespace.yml
helm dep update Charts/reddit
helm install --namespace dev --name reddit-dev Charts/reddit
```

## Using the application

Get application IP (if nothing prints out, wait and try again):

```bash
kubectl get ingress -n dev reddit-dev-ui -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

Copy IP address and paste it in browser. You can use `http` and `https` protocols. Enjoy the Reddit application. :-)

## Destroy resources

To remove the application with infrastructure components, type the following.

```bash
cd kubernetes
helm delete reddit-dev
kubectl delete -f ./dev-namespace.yml
```

```bash
cd kubernetes/terrafrom/dev
terraform destroy
```
