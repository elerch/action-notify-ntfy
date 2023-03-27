FROM alpine

RUN true && \
    apk add --no-cache curl

COPY entrypoint.sh /

ENTRYPOINT ["entrypoint.sh"]
