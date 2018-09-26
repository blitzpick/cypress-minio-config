#!/bin/sh

while ! nc -z $1 9000;
do
    echo sleeping;
    sleep 5;
done;

echo Connected!;

mc config host add myminio http://$1:9000 IMA_DEV_ACCESS_KEY IMA_DEV_SECRET_KEY --api s3v4;
mc mb myminio/bp-chimera-$2-images;
mc policy download myminio/bp-chimera-$2-images;
mc mb myminio/bp-chimera-$2-data-sources;

exit 0;