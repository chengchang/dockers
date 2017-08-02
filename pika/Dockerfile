FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends make ca-certificates libzip-dev libsnappy-dev libprotobuf-dev protobuf-compiler bzip2 libbz2-dev g++ gcc git && \
    git clone https://github.com/Qihoo360/pika && \
    cd pika && git submodule init && git submodule update && \
    make __REL=1 && \
    mkdir -p /usr/local/pika20/lib/ && cp ./output/lib/* /usr/local/pika20/lib/ && \
    cp ./output/bin/pika /usr/local/bin && cd .. && \
    apt-get clean && apt-get purge -y --auto-remove g++ gcc git && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ./pika && mkdir -p /var/pika

ADD pika.conf /etc/pika.conf
ADD run.sh /run.sh

EXPOSE 9221
VOLUME ["/var/pika"]

CMD ["/run.sh"]
