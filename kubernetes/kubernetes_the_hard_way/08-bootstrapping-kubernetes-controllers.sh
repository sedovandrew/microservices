#!/bin/bash

for instance in controller-0 controller-1 controller-2; do
  gcloud compute scp bootstrapping-kubernetes-controller.sh ${instance}:~/
  gcloud compute ssh ${instance} --command='bash bootstrapping-kubernetes-controller.sh'
done

# The Kubernetes Frontend Load Balancer

gcloud compute target-pools create kubernetes-target-pool

gcloud compute target-pools add-instances kubernetes-target-pool \
  --instances controller-0,controller-1,controller-2

KUBERNETES_PUBLIC_ADDRESS=$(gcloud compute addresses describe kubernetes-the-hard-way \
  --region $(gcloud config get-value compute/region) \
  --format 'value(name)')

gcloud compute forwarding-rules create kubernetes-forwarding-rule \
  --address ${KUBERNETES_PUBLIC_ADDRESS} \
  --ports 6443 \
  --region $(gcloud config get-value compute/region) \
  --target-pool kubernetes-target-pool
