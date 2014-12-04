# For Nodejs webapp

FROM kerkerj:nodejs
MAINTAINER Jerry Huang (jerry.huang@livebricks.com)

# basic node command tool
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
  npm install -g nodemon mocha && \
  mkdir /webapp

# Sample server
ADD ./AutoLog/ /webapp/AutoLog/
WORKDIR /webapp/AutoLog/
RUN npm install

ENV DEBUG *
EXPOSE 8080

CMD ["nodemon", "/webapp/AutoLog/bin/server.js"]
