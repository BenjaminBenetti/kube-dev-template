#!/bin/bash

pushd $(dirname $0) >> /dev/null

PROJECT_NAME=$(cat ../project.json | jq -r '.name')

EXISTS=$(kind get clusters | grep ${PROJECT_NAME}-cluster)
if [ ! -z "$EXISTS" ]; then
    echo "Cluster already exists. Skipping cluster creation."
    exit 0
fi

# create kind cluster
kind create cluster -n ${PROJECT_NAME}-cluster --config ./manifest/kind-config.yaml 

# install traefik 
helm repo add traefik https://traefik.github.io/charts
helm repo update 
helm install traefik traefik/traefik --create-namespace --namespace traefik-ingress --values ./manifest/traefik-values.yaml

# install metrics server
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm upgrade --install metrics-server metrics-server/metrics-server --namespace kube-system --set args[0]="--kubelet-insecure-tls=true"

echo Your Ready to Dev!

popd >> /dev/null