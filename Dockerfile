FROM qnib/dplain-init

ENV CEPH_VERSION=kraken \
    DEBIAN_VERSION=jessie

RUN apt-get update \
 && apt-get install -y wget unzip jq apt-transport-https \
 && wget -q -O- 'https://download.ceph.com/keys/release.asc' | apt-key add - \
 && echo deb https://download.ceph.com/debian-${CEPH_VERSION}/ ${DEBIAN_VERSION} main | tee /etc/apt/sources.list.d/ceph-${CEPH_VERSION}.list \
 && apt-get install -y --force-yes ceph
