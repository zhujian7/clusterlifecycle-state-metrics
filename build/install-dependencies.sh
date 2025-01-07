#!/bin/bash -e

# Copyright (c) 2020 Red Hat, Inc.
# Copyright Contributors to the Open Cluster Management project

# Go tools
_OS=$(go env GOOS)
_ARCH=$(go env GOARCH)
KubeBuilderVersion="v4.3.1"

if ! which patter >/dev/null; then
   echo "Installing patter ..."
   go install github.com/apg/patter@latest
fi
if ! which gocovmerge >/dev/null; then
   echo "Installing gocovmerge..."
   go install github.com/wadey/gocovmerge@latest
fi

# Build tools
if ! which kubebuilder >/dev/null; then
   # Install kubebuilder for unit test
   echo "Install Kubebuilder components for test framework usage!"

   # download kubebuilder and extract it to tmp
   curl -L -o kubebuilder https://github.com/kubernetes-sigs/kubebuilder/releases/download/$KubeBuilderVersion/kubebuilder_${_OS}_${_ARCH}

   chmod +x kubebuilder
   # move to a long-term location and put it on your path
   # (you'll need to set the KUBEBUILDER_ASSETS env var if you put it somewhere else)
   sudo cp kubebuilder $KUBEBUILDER_ASSETS
fi
# Image tools

# Check tools
