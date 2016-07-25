#!/bin/bash

# 生成私有证书
openssl req -newkey rsa:2048 -subj '/CN=registry.juxinli.com' -nodes -sha256 -keyout auth/domain.key -x509 -days 3650 -out auth/domain.crt

# 把证书放到docker证书下
sudo cp ~/registry/auth/domain.crt /etc/docker/certs.d/registry.juxinli.com:5000/ca.crt
