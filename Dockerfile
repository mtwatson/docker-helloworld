############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


# Set the base image to Ubuntu
FROM ubuntu:18.04

# File Author / Maintainer
LABEL maintainer="Karthik Gaekwad"

# Install Nginx

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y --no-install-recommends vim=2:8.0.1453-1ubuntu1.3 wget=1.19.4-1ubuntu2.2 dialog=1.3-20171209-1 net-tools=1.60+git20161116.90da8a0-1ubuntu1

RUN apt-get install -y --no-install-recommends nginx=1.14.0-0ubuntu1.7

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

# Add a sample index file
ADD index.html /www/data/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Create a runner script for the entrypoint
COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

# Expose ports
EXPOSE 80

ENTRYPOINT ["/runner.sh"]

# Set the default command to execute
# when creating a new container
CMD ["nginx"]