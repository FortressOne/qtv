FROM ubuntu:18.04
WORKDIR /qtv
RUN apt-get update \
 && apt-get install -y \
    gcc \
    make \
 && rm -rf /var/lib/apt/lists/*
 COPY src/ /qtv/src/
 RUN cd /qtv/src/ \
  && make \
  && cd /qtv/ \
  && mkdir /qtv/qtvproxy/ \
  && cp src/qtv.bin /qtv/qtvproxy/ \
  && mkdir /qtv/qtvproxy/qtv/ \
  && cp src/qtv/qtvbg01.png src/qtv/style.css src/qtv/save.png src/qtv/stream.png /qtv/qtvproxy/qtv/ \
  && cp -r src/qtv/levelshots/ /qtv/qtvproxy/qtv/ \
  && rm -rf /qtv/src/
 COPY qtv.cfg /qtv/
 ENTRYPOINT ["/qtv/qtvproxy/qtv.bin", "+exec qtv.cfg"]
