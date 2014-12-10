#Docker [link](https://github.com/docker/docker)

##Concept

![image](https://dl.dropboxusercontent.com/u/12400343/images/Screen%20Shot%202014-11-20%20at%2016.32.27.png)

![image](https://dl.dropboxusercontent.com/u/12400343/images/Screen%20Shot%202014-11-20%20at%2016.32.33.png)

VM:

![images](https://dl.dropboxusercontent.com/u/12400343/images/Screen%20Shot%202014-11-25%20at%2014.45.44.png)

Docker:

![images](https://dl.dropboxusercontent.com/u/12400343/images/Screen%20Shot%202014-11-25%20at%2014.45.55.png)

##Installation on Mac -  [boot2docker](https://github.com/boot2docker/boot2docker)

在 mac 的 boot2docker 中, 運作原理是先在 mac 中跑一個輕量級的 linux, 再該 linux 上再跑 docker 

docker 並非傳統的 VM, 可以視為 wine on ubuntu

因此在安全性上不可輕忽，docker 做的事情並非由 VM kernel 處理而是透過 host kernel 處理

[小心暗藏惡意軟件：淺談 Docker 安全性](http://www.hkitblog.com/?p=22552)

##Run!

在 mac 中，有兩種方式來跑 docker

a. 先安裝好 [boot2docker](https://github.com/boot2docker/boot2docker) ，或是透過 homebrew 安裝 docker 和 boot2docker 後

第一次執行:

```
$ boot2docker init
```

p.s. 如果不是第一次使用而下該指令的話則會出現:

```
$ boot2docker init
Virtual machine boot2docker-vm already exists
```

不管有沒有 init 過，總之接著就是要將 VM 跑起來!

```
$ boot2docker up
Waiting for VM and Docker daemon to start...
.o
Started.
Writing /Users/jerryhuang/.boot2docker/certs/boot2docker-vm/ca.pem
Writing /Users/jerryhuang/.boot2docker/certs/boot2docker-vm/cert.pem
Writing /Users/jerryhuang/.boot2docker/certs/boot2docker-vm/key.pem

To connect the Docker client to the Docker daemon, please set:
    export DOCKER_CERT_PATH=/Users/jerryhuang/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
    export DOCKER_HOST=tcp://192.168.59.103:2376
```

接著他會要求你設定環境變數，如果使用 bash 或是 zsh 就直接寫入 conf 檔吧

還沒有的話就一行一行貼近終端機執行吧~

除了第一種方法，第二種方法是:

b. 執行 boot2docker.app，他會幫你執行上述的指令，讓你可以直接連進 docker server，直接使用 docker 指令做操作，因此只要點兩下就可以不用下指令，直接是熱騰騰設定好的終端機跳出來給你用，不過可惜的是還沒支援 iTerm，所以我還是偏向第一種做法 XD

##Basic commands

[Docker Basics by hSATAC](http://blog.hsatac.net/2014/06/docker-basics/)

* 拉 image: `docker pull ubuntu:14.04`

* 本機 image 清單: `docker images`

* 跑指令: `docker run -t -i {image_name} {command}`

	例如: `docker run -t -i ubuntu:14.04 /bin/bash`

* 移除所有 container or image or untagged image

```
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)

# Delete untagged images
docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
```

* build, 根據 Dockerfile 產生 container:

```
# with cache
$ docker build -t="kerkerj:nginx" .

# without cache
$ docker build -no-cache -t="kerkerj:nginx" .
```

* 跑 service (daemon mode) `-d`

```
$ docker run -t -p 80:80 -d -i kerkerj:nginx
```

* 砍倒 daemon mode server:

```
$ docker kill {container_id}
```

* port forwarding `-p host_port:guest_port`

```
$ docker run -t -p 80:80 -d -i kerkerj:nginx
```

* docker exec 可以 inject 新的 process 到正在執行中的 docker container 中，只要下 docker exec -i -t <container id> /bin/bash 就可以進 shell 了

## Dockerfile 

[dockerfile best practice](http://docs.docker.com/articles/dockerfile_best-practices/) or [markdown version](https://github.com/docker/docker/blob/master/docs/sources/articles/dockerfile_best-practices.md)

<font color='red'>Avoid RUN `apt-get upgrade` or `dist-upgrade`</font>

#Fig [link](https://github.com/docker/fig)

##Install

add this line to shell conf 

```
$(boot2docker shellinit)
```

e.g. 

```
$ echo $(boot2docker shellinit) >> ~/.zshrc
```

then install fig:

```
$ curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
```

###[Orchestrating Docker containers in production using fig](http://blog.docker.com/2014/08/orchestrating-docker-containers-in-production-using-fig/)

###Automated Development Flow

通常個人都會使用 nodemon 來監看檔案變更，若有變更則會重新啟動 server

但是在 docker 中，不曉得是什麼原因，nodemon 無法運行 (目前還不曉得為什麼)

換成 supervisor 後卻是正常的


#Others

[6 個 dockerfile 小技巧](http://www.oschina.net/translate/6-dockerfile-tips-official-images)


#如何將使用 Dockerfile build 的 image push 上 docker hub

需要先 build 一個和自己的 repo 相符合的 repo_name/tag

`docker build -t <myuser>/hellodocker:mytag .`

e.g. dockerhub 的 repo name: kerkerj/ubuntu

在 build 時下的指令即為 (tag 可以自訂): `docker build -t kerkerj/ubuntu:14.04 .`

```
$ docker login
$ docker build -t kerkerj/ubuntu:14.04 ~/Desktop/Docker/Ubuntu/
$ docker push kerkerj/ubuntu:14.04
```