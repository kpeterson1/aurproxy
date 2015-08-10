# start with a base image
FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update && apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  git \
  iptables \
  nginx \
  python3-pip \
  build-essential \
  python-dev \
  openssh-server \
  vim \
  software-properties-common \
  supervisor && \
  rm -rf /var/lib/apt/lists/*

RUN pip3 install uwsgi flask

RUN mkdir -p /var/run/sshd /var/log/supervisor
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Add an authorized user
RUN adduser --system demo_user
RUN mkdir -p /home/demo_user/.ssh

# Clear and set authorized ssh key
RUN echo '' > /home/git/.ssh/authorized_keys
RUN echo 'INSERT KEY HERE' >> /home/demo_user/.ssh/authorized_keys


# Update shell to bash
RUN sed -i s#/home/demo_user:/bin/false#/home/git:/bin/bash# /etc/passwd

# Update working directories
ADD ./app /app
ADD ./config /config

# setup config
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default

RUN ln -s /config/nginx.conf /etc/nginx/sites-enabled/
RUN ln -s /config/supervisor.conf /etc/supervisor/conf.d/

EXPOSE 22 80
CMD ["supervisord", "-n"]
