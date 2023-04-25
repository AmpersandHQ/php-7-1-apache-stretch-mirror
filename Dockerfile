FROM php:7.1-apache-stretch

RUN echo 'deb http://archive.debian.org/debian-archive/debian/ stretch main' > /etc/apt/sources.list
#RUN echo 'deb http://debian.mirrors.uk2.net/debian stretch-updates main' >> /etc/apt/sources.list
RUN echo 'deb http://archive.debian.org/debian-security/ stretch/updates main' >> /etc/apt/sources.list

# Install packages
RUN apt-get update && apt-get install -y \
    dnsutils \
    htop \
    libxml2-dev \
    timelimit \
    vim \
    zlib1g-dev \
&& rm -rf /var/lib/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install soap mbstring zip pcntl
RUN sed -re 's#^(mozilla/DST_Root_CA_X3.crt)$#!\1#' -i /etc/ca-certificates.conf;
RUN update-ca-certificates;
