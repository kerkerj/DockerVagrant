# For Nodejs

FROM kerkerj:ubuntu
MAINTAINER Jerry Huang ((jerry54010@gmail.com))
RUN apt-get update --fix-missing
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# NVM
RUN curl -sL https://deb.nodesource.com/setup | sudo bash - && \
  apt-get install -y nodejs

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

