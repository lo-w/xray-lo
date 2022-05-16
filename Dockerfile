FROM alpine:edge
RUN apk update && \
    apk add --no-cache ca-certificates wget && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - && \
    chmod +x /xray && \
    mv /xray /x && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
