#!/bin/bash

apt update -y

yes | unminimize

apt install -y man-db curl

curl -L https://siakhooi.github.io/apt/siakhooi-apt.list > /etc/apt/sources.list.d/siakhooi-apt.list
curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  > /usr/share/keyrings/siakhooi-apt.gpg
apt update -y

apt install -y ./siakhooi-devutils_1.1.1_amd64.deb
