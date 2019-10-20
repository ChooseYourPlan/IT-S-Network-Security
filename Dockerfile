FROM ubuntu
RUN apt-get update
RUN apt-get -y remove openssl
RUN apt-get -y install gcc
RUN DEBIAN_FRONTEND=noninteractive apt-get -q update && apt-get -qy install wget make \
    && wget https://www.openssl.org/source/openssl-1.0.2g.tar.gz \
    && tar -xzvf openssl-1.0.2g.tar.gz \
    && cd openssl-1.0.2g \
    && ./config \
    && make install \
    && ln -sf /usr/local/ssl/bin/openssl 'which openssl'
