FROM php:8.0-apache

RUN apt-get update -y && \
  apt-get install -y swaks
  
RUN apt-get install -y dnsutils

# prepare entrypoint.d pattern
RUN mkdir /entrypoint.d
COPY ./files/entrypoint.sh /entrypoint.sh
COPY ./entrypoint.d/* /entrypoint.d/
RUN chmod 777 /entrypoint.sh && chmod 777 /entrypoint.d/*

ENTRYPOINT ["/entrypoint.sh"]
