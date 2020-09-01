# Openshift CommandLine and Ansible

This Dockerfile execute the configuration of two tools (OC and Ansible), bellow has a simple explanation of the components.

The OC provides an interface of commands to interact with Openshift via Bash.

The Ansible provides the structure of ansible-playbook and ansible-galaxy to execute determinates ansible scripts in a cluster Openshift.

### Build Image

1. How to build this image

```
$ git clone https://github.com/lhsribas/docker-oc-ansible.git 
```

2. Build container

```
$ docker build -t oc-ansible .
```
### Get from Dockerhub

1. How to get image

```
$ docker push lhsribas/oc-ansible:1.0
```

2. Execute and access the bash command line.

```
$ docker run -it oc-ansible /bin/bash
```