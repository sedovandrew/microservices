#!/bin/bash

for instance in controller-0 controller-1 controller-2; do
  gcloud compute scp bootstrapping-etcd-controller.sh ${instance}:~/

  gcloud compute ssh ${instance} --command="bash bootstrapping-etcd-controller.sh"
done
