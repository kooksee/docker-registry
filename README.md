## docker registry的搭建(ubuntu系统)
1，安装docker和openssl
2，生成证书
```
openssl req -newkey rsa:2048 -subj '/CN=registry.*****.com' -nodes -sha256 -keyout auth/domain.key
-x509 -days 3650 -out auth/domain.crt
```
3，把证书放到docker证书下面(因为证书是自己生成的，不是在网上购买的，所以还需要在客户端把证书放到docker下面)
```
sudo cp ~/registry/auth/domain.crt /etc/docker/certs.d/registry.*****.com/ca.crt
```
4，重启docker服务
```
sudo service docker restart
```
5，运行docker registry
```
docker run -d -p 5000:5000 --restart=always --name registry -v `pwd`/data:/var/lib/registry -v
`pwd`/auth:/auth -e REGISTRY_HTTP_TLS_CERTIFICATE=/auth/domain.crt -e
REGISTRY_HTTP_TLS_KEY=/auth/domain.key registry:2
```

## 客户端使用
1，把证书domain.crt复制到docker下面
```
sudo cp ~/registry/auth/domain.crt /etc/docker/certs.d/registry.*****.com:5000/ca.crt
```
2，更改hosts文件，并添加
```
192.168.101.237  registry.*****.com
```
3，重启一下服务
```
sudo service docker restart
```
4，使用
```
docker tag rabbitmqhaproxy registry.*****.com:5000/rabbitmqhaproxy
docker push registry.*****.com:5000/rabbitmqhaproxy
docker rmi registry.*****.com:5000/rabbitmqhaproxy
docker pull registry.*****.com:5000/rabbitmqhaproxy
```

