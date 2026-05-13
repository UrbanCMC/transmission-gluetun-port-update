FROM alpine:3

RUN apk add --no-cache curl

ENV TRANSMISSION_RPC_HOST=127.0.0.1 \
    TRANSMISSION_RPC_PORT=9091 \
    TRANSMISSION_RPC_USERNAME=admin \
    GLUETUN_PORT_FILE=/tmp/forwarded-port \
    INITIAL_DELAY_SEC=10 \
    CHECK_INTERVAL_SEC=60 \
    ERROR_INTERVAL_SEC=5 \
    ERROR_INTERVAL_COUNT=5

COPY port-update.sh /port-update.sh

CMD ["/bin/sh", "/port-update.sh"]

