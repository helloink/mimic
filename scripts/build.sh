#!/bin/sh

set -e

docker build -f gcp/firestore.Dockerfile -t emulators/gcp-firestore:latest .
docker build -f gcp/pubsub.Dockerfile -t emulators/gcp-pubsub:latest .

docker push emulators/gcp-firestore
docker push emulators/gcp-pubsub
