# Nginx

FROM kerkerj:nginx
MAINTAINER Jerry Huang (jerry54010@gmail.com)

# remove original conf and add nodejs conf
RUN rm /etc/nginx/sites-enabled/default
ADD nodejs.conf /etc/nginx/sites-enabled/

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start