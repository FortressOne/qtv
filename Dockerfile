FROM ubuntu:18.04
WORKDIR /qtv
RUN apt-get update \
 && apt-get install -y \
    make \
    git clone git@github.com:FortressOne/qtv.git \
 && rm -rf /var/lib/apt/lists/* \
 && cd qtv/ \
 && make \
 && mkdir qtvproxy/ \
 && cp qtv.bin qtvproxy/ \
 && mkdir qtvproxy/qtv/ \
 && cp qtvbg01.png style.css save.png stream.png qtvproxy/qtv/ \
 && cp -r levelshots/ qtvproxy/qtv/ \
 && cd /qtv
 && mv -r /qtv/qtv/qtvproxy /qtv/qtvproxy/ \
 && rm -rf /qtv/qtv/
COPY qtv.cfg /qtvproxy/
CMD ["/qtv/qtvproxy/qtv.bin +exec qtv.cfg"]
