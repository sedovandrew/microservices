# Gitlab

## Install Gitlab

```bash
helm install --name gitlab . -f values.yaml
```

## Configure

Add IP to `/etc/hosts`:

```bash
echo $(kubectl get service -n nginx-ingress nginx -o jsonpath="{.status.loadBalancer.ingress[0].ip}") gitlab-gitlab staging production | sudo tee -a /etc/hosts
```

## Using

Open http://gitlab-gitlab in your browser.
