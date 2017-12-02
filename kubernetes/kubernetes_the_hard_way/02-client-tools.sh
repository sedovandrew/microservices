#!/bin/bash

# Install cfssl

for f in cfssl cfssljson; do
  if [ ! -x /usr/local/bin/$f ]; then
    wget -q --show-progress --https-only --timestamping \
        https://pkg.cfssl.org/R1.2/${f}_linux-amd64
    chmod +x ${f}_linux-amd64
    sudo mv ${f}_linux-amd64 /usr/local/bin/$f
  fi
done

# Install kubectl

if [ ! -x /usr/local/bin/kubectl ]; then
  wget https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/
fi
