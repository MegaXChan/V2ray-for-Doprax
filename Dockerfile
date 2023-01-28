FROM alpine:3.14
ENV TIME_ZONE Asia/Shanghai
RUN apk add curl ca-certificates tar nginx supervisor unzip bash

RUN mkdir -p /usr/local/xray && cd /usr/local/xray &&  curl -LO https://github.com/XTLS/Xray-core/releases/download/v1.7.2/Xray-linux-64.zip  && unzip Xray-linux-64.zip && rm -rf Xray-linux-64.zip

COPY nginx.conf /etc/nginx/nginx.conf.tmp
COPY supervisord.conf /etc/supervisord.conf
COPY config.json /etc/xray/config.json.tmp


RUN mkdir -p /usr/share/nginx/html

COPY html7.zip /usr/share/nginx/html/html7.zip

RUN cd /usr/share/nginx/html/ && unzip html7.zip && rm -rf html7.zip


ENV UUID de04add9-5c68-8bab-950c-08cd5320df18
ENV PX /PX

ADD run.sh /

EXPOSE 80

CMD sh run.sh
