#!/bin/bash

docker run -d -p 5000:5000 --restart=always --name registry -v `pwd`/data:/var/lib/registry -v `pwd`/auth:/auth -e REGISTRY_HTTP_TLS_CERTIFICATE=/auth/domain.crt -e REGISTRY_HTTP_TLS_KEY=/auth/domain.key registry:2
docker ps

