#!/bin/bash
set -e

mkdir -p ~/.kube

if [[ ! -z ${KUBE_CONFIG} ]]; then
    echo ${KUBE_CONFIG} | base64 -d > ~/.kube/config
fi

if [[ -z ${CI} ]]; then
    kubectl "$@"
else
    exec "$@"
fi

