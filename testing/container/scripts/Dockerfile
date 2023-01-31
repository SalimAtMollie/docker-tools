FROM php:8.0-apache

#update package list and install telnet
RUN apt update && \
  apt install netbase && \
  apt install telnet 

RUN apt-get update -y && \
  apt-get install -y swaks
  
RUN apt-get install -y dnsutils

RUN apt-get update && apt-get install -y iputils-ping

# prepare entrypoint.d pattern
RUN mkdir /entrypoint.d
COPY ./files/entrypoint.sh /entrypoint.sh
COPY ./entrypoint.d/* /entrypoint.d/
RUN chmod 777 /entrypoint.sh && chmod 777 /entrypoint.d/*

ENTRYPOINT ["/entrypoint.sh"]
