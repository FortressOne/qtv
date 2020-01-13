FROM ubuntu:18.04
WORKDIR /qtv
RUN apt-get update \
 && apt-get install -y \
    gcc \
    make \
 && rm -rf /var/lib/apt/lists/*
COPY src/ /tmp/src/
RUN cd /tmp/src/ \
 && make \
 && cd /qtv/ \
 && cp /tmp/src/qtv.bin /qtv/ \
 && mkdir /qtv/qtv/ \
 && cp -r /tmp/src/qtv/ /qtv/ \
 && rm -rf /tmp/src/
COPY qtv.cfg /qtv/
ENTRYPOINT ["/qtv/qtv.bin", "+exec qtv.cfg"]
