#!/usr/bin/env bash

docker run -it \
    --name elk-es1 \
    -h elk-es1 \
    --privileged \
    --cap-add SYS_PTRACE \
    --restart=always \
    -e TZ=Asia/Hong_Kong \
    -d \
    --add-host "es1.XXX.cn:192.168.2.111" \
    --add-host "lgh1.XXX.cn:192.168.2.111" \
    --add-host "kib1.XXX.cn:192.168.2.111" \
    --ulimit nofile=65536:65536 \
    --ulimit nproc=4096:4096 \
    -v /data/esdata/elasticsearch-6.2.4:/home/es/elasticsearch-6.2.4 \
    -p 9200:9200 \
    -p 9201:9201 \
    -p 9301:9301 \
    reg.XXX.com.cn/lnc-devops/elasticsearch6.2.4:latest \
    supervisord
