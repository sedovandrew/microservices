#!/bin/bash

for instance in worker-0 worker-1 worker-2; do
  gcloud compute scp bootstrapping-kubernetes-worker.sh ${instance}:~/
  gcloud compute ssh ${instance} --command='bash bootstrapping-kubernetes-worker.sh'
done
