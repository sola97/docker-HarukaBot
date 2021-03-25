FROM alpine:latest
LABEL maintainer="sola97 <my@sora.vip> "
RUN apk update && \
    apk add --no-cache tzdata python3 py3-pip && \
    apk add --virtual .build-deps git build-base gcc wget python3-dev zlib-dev jpeg-dev&& \
    pip install --no-cache-dir --upgrade git+https://github.com/SK-415/HarukaBot.git#master && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del .build-deps
WORKDIR /HarukaBot
CMD ["/usr/bin/hb","run"]
