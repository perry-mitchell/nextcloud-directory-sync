FROM alpine:latest

ENV NC_USERNAME ""
ENV NC_PASSWORD ""
ENV NC_HOST ""
ENV PATH_LOCAL "/nextcloud"
ENV PATH_REMOTE "/"
ENV SYNC_WAIT "60"

ENV PUID 1000
ENV PGID 1000

COPY start.sh /start.sh
RUN apk update \
    && apk add nextcloud-client bash \
    && mkdir -p /home/nextcloud

CMD ["/start.sh"]
