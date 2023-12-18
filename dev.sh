#!/bin/bash

# all in one dev script. Creates cluster, deploys, and tears down all in one command.
pushd $(dirname $0) >> /dev/null

export PROJECT_NAME=$(cat ./project.json | jq -r '.name')

./devcluster/setup.sh
skaffold dev
./devcluster/teardown.sh

popd >> /dev/null