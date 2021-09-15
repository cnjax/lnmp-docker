FROM daocloud.io/nginx:stable-alpine

MAINTAINER coding01 <yemeishu@126.com>

ADD default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www

