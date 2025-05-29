FROM registry.access.redhat.com/ubi8-minimal:latest
LABEL maintainer="pvn@novarese.net"
LABEL name="2025-05-demo"
LABEL org.opencontainers.image.title="2025-05-demo"
LABEL org.opencontainers.image.description="Simple image to test some SCA type tools."

USER root 

RUN set -ex && \
    microdnf -y install python3-devel python3 python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install --index-url https://pypi.org/simple --no-cache-dir orjson && \
    microdnf -y clean all && \
    rm -rf /var/cache/yum /tmp 

ENTRYPOINT /bin/false
