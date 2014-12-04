#This is my environments built by Docker in Vagrant VM!

##Howto

1. Install Vagrant

2. Set-up a VM by vagrant 

```
$ git clone {this_repo} 
```

3. start vagrant VM

```
$ cd {folder}
$ vagrant up
```

Also, we use this folder as our shared foler between Host OS and vagrant VM.

4. while you are in the VM:

```
vagrant@vagrant-ubuntu-trusty-64 $ cd /vagrant
vagrant@vagrant-ubuntu-trusty-64 $ ./clean_install.sh
```

then this script will install basic packages and docker/ fig.

5. Build docker images:

```
vagrant@vagrant-ubuntu-trusty-64 $ ./build.sh
```

6. Start exploring by fig to start your coding environments

##Image list:

* Base image - kerkerj/ubuntu:14.04 [docker hub](https://registry.hub.docker.com/u/kerkerj/ubuntu/)

* Nginx 

* Nodejs 

* Rails 