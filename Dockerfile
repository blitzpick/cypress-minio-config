FROM minio/mc

RUN apk add --update --no-cache bash gawk sed grep bc coreutils netcat-openbsd

RUN mkdir -p /usr/src/minioconfig
WORKDIR /usr/src/minioconfig

COPY startup.sh /usr/src/minioconfig/
