FROM kerkerj:nodejs

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
  apt-get update --fix-missing && \
  curl -sL https://deb.nodesource.com/setup | sudo bash - && \
  apt-get install -y nodejs && \
  npm install -g nodemon mocha supervisor

WORKDIR /nodeapp

#CMD ["nodemon", "/nodeapp/server.js"]
