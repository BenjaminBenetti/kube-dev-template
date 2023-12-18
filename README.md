# kube-dev-template
Template for a Kubernetes project. Including local k8s dev setup as well as prod deployment manifests. 
This project let's you quickly bootstrap your kubernetes development environment! :rocket: 

## Prerequisites
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)  
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [helm](https://helm.sh/docs/intro/install/)
- [skaffold](https://skaffold.dev/docs/install/)


## Setup

Once you've installed the prerequisites, edit the following files to configure your project:
1. `project.json` - This file contains general information about your project. For example, the name of your project.
2. `services.yaml` - This file contains the project specific list of services (microservices) that make up your project. This file defines how to deploy your project to kubernetes. Following the provided example in that file add your own services.
3. `skaffold.yaml` - Add any project specific images (dockerfiles) to the artifacts list. 

## Usage

Run your app locally in dev mode with the following command. :rocket:

```bash 
./dev.sh 
```