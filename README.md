# docker-helloworld

<!-- ![Docker Pulls](https://img.shields.io/docker/pulls/mtwatson/udacity-docker-final.svg) ![Automated Builds](https://img.shields.io/docker/automated/mtwatson/udacity-docker-final.svg) ![Build Status](https://img.shields.io/docker/build/mtwatson/udacity-docker-final.svg ) -->

## Overview

A simple helloworld app for docker

A simple nginx helloworld application that helps you learn docker image pulls. Runs on port :80

To pull this image:
```
docker pull mtwatson/udacity-docker-final:latest
```

To run this image:
```
docker run -p 80:80/tcp "mtwatson/udacity-docker-final:latest"
```

Dockerhub link: https://hub.docker.com/r/mtwatson/udacity-docker-final/

Github link: https://github.com/mtwatson/docker-helloworld

---

## How cluster is deployed

'eksctl create cluster'

## How does eksctl work?

eksctl leverages CloudFormation directly to create the appropriate clusters

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
