FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget gnupg2 && \
    echo "deb http://deb.theforeman.org/ bionic 1.22" > /etc/apt/sources.list.d/foreman.list && \
    wget -q https://deb.theforeman.org/foreman.asc -O- | apt-key add - && \
    apt-get update && apt-get install -y --no-install-recommends ruby-hammer-cli ruby-hammer-cli-foreman && \
    apt-get remove curl gnupg2 wget -y && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /etc/hammer/

ENTRYPOINT [ "hammer" ]
CMD [ "-h" ]