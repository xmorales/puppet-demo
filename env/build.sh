#!/bin/bash

echo Building test environments
docker build -t puppet-demo:centos6 -f Dockerfile.centos6 .
docker build -t puppet-demo:centos7 -f Dockerfile.centos7 .
docker build -t puppet-demo:ubuntu14.04 -f Dockerfile.ubuntu .
