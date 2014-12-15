# For Nodejs webapp

FROM kerkerj:nodejs
MAINTAINER Jerry Huang (jerry54010@gmail.com)

# basic node command tool
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
  npm install -g supervisor mocha && \
  mkdir /webapp

# Sample server
ADD ./NodejsTestApp/ /webapp
WORKDIR /webapp
RUN npm install

ENV DEBUG TEST
ENV MONGODB_IP mongodb
EXPOSE 8080

CMD ["supervisor", "/webapp/bin/server.js"]
