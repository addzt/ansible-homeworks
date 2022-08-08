#!/bin/bash

docker run -d --name ubuntu pycontribs/ubuntu:latest
docker run -d --name fedora pycontribs/fedora:latest
docker run -d --name centos7 pycontribs/centos:7
ansible-playbook -i ./inventory/prod.yml site.yml --ask-vault-pass
docker stop ubuntu fedora centos7
docker rm ubuntu fedora centos7
