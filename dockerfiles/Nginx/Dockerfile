# Nginx

FROM kerkerj:ubuntu
MAINTAINER Jerry Huang ((jerry54010@gmail.com))

# Nginx 
RUN cd ~ && \
  wget http://nginx.org/keys/nginx_signing.key && \
  apt-key add nginx_signing.key && \
  echo deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx \
  deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx >> /etc/apt/source.list && \
  apt-get update && \
  apt-get install -y nginx && \
  echo "daemon off;" >> /etc/nginx/nginx.conf && \
  echo `nginx -v`

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \ 
  apt-get autoremove -y

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start