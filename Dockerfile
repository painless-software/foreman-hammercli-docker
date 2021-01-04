FROM ubuntu:18.04

ARG FOREMAN_VERSION=nightly
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
    ca-certificates \
    gnupg2 \
    lsb-release \
    wget \
 && echo "deb http://deb.theforeman.org/ $(lsb_release -cs) ${FOREMAN_VERSION}" | tee /etc/apt/sources.list.d/foreman.list \
 && wget -q https://deb.theforeman.org/foreman.asc -O- | apt-key add - \
 && apt-get update \
 && apt-get install --no-install-recommends -y \
    ruby-hammer-cli-foreman \
 && apt-get purge -y \
    gnupg2 \
    lsb-release \
    wget \
 && apt-get autoremove --purge -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /etc/hammer/

ENTRYPOINT [ "hammer" ]
CMD [ "-h" ]
